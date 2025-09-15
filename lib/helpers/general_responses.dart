import 'package:next_feature/commands/base_command.dart';
import 'package:next_feature/utils/colors.dart';

/// A utility class for printing general responses and usage information.
class GeneralResponses {
  static void printGeneralUsage(Map<String, BaseCommand> commands) {
    print('Usage: dart run bin/next_feature.dart command [options]');
    print('Available commands:');
    for (var command in commands.values) {
      print(
        ' • ${Colors.colorize(command.name, Colors.cyan)}: ${command.description}',
      );
    }
    print('\nFor more information on a specific command, run:');
    print(
      '  dart run bin/next_feature.dart <command> ${Colors.colorize('--help', Colors.grey)}',
    );
  }
}
