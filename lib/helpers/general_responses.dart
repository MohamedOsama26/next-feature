import 'package:next_feature/models/base_command.dart';
import 'package:next_feature/utils/colors.dart';

mixin GeneralResponses {
  /// this method prints the general usage information for the CLI tool.
  /// It takes a map of commands as an argument and prints the usage information
  /// for each command.
  void printGeneralUsage(Map<String, BaseCommand> commands) {
    print('Usage: dart run bin/next_feature.dart command [options]');
    print('Available commands:');
    for (var command in commands.values) {
      print(
        ' • ${Colors.colorize(command.name, Colors.cyan)}: ${command.description}',
      );
    }
    print('\nFor more information on a specific command, run:');
    print('  dart run bin/next_feature.dart <command> ${Colors.colorize('--help', Colors.grey)}');
  }
}
