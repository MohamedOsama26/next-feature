import 'package:args/args.dart';
import 'package:next_feature/helpers/general_responses.dart';
import 'package:next_feature/utils/global_flags.dart';

import 'commands/base_command.dart';
import 'commands/create_feature_command.dart';

class CLI with GlobalFlags {
  final ArgParser _parser = ArgParser();
  final Map<String, BaseCommand> _commands = {
    'create-feature': CreateFeatureCommand(),
  };

  CLI() {
    addGlobalFlags(_parser);
    _registerCommands(_commands);
  }

  void run(List<String> arguments) {
    final results = _parser.parse(arguments);
    handleGlobalFlags(results);

    // Run the command if provided
    if (results.command != null) {
      final commandName = results.command!.name;
      final command = _commands[commandName];
      if (command != null) {
        command.run(results.command!);
      }
    } else {
      GeneralResponses.printGeneralUsage(_commands);
    }
  }

  void _registerCommands(Map<String, BaseCommand> commands) {
    for (var command in commands.values) {
      final commandParser = ArgParser();
      command.configureWithBase(commandParser);
      _parser.addCommand(command.name, commandParser);
    }

  }
}
