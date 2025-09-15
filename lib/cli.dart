import 'package:args/args.dart';
import 'package:next_feature/commands/create_feature_command.dart';
import 'package:next_feature/models/base_command.dart';
import 'package:next_feature/utils/global_options.dart';

import 'helpers/general_responses.dart';

class CLI with GeneralResponses, GlobalFlags {
  final ArgParser _parser = ArgParser();

  CLI() {
    addGlobalFlags(_parser);
  }

  /// This method runs the CLI tool with the provided arguments.
  void run(List<String> arguments) {
    /// Parse the command-line arguments using the ArgParser instance.
    final results = _parser.parse(arguments);

    handleGlobalFlags(results);
  }
}
