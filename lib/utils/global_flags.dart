import 'package:args/args.dart';
import 'package:next_feature/utils/colors.dart';

mixin GlobalFlags {
  void addGlobalFlags(ArgParser parser) {
    parser.addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Show this help message.',
    );
    parser.addFlag(
      'version',
      abbr: 'v',
      negatable: false,
      help: 'Show the version of the CLI tool.',
    );
    parser.addSeparator('Output formatting:');
    parser.addFlag(
    'json',
        help: 'Output results in JSON format.',
        negatable: false,
    );
    parser.addFlag(
      'yaml',
      help: 'Output results in YAML format.',
      negatable: false,
    );
  }

  void handleGlobalFlags(ArgResults results) {
    if (results['help'] == true) {
      print(
        '${Colors.colorize('Usage', Colors.cyan)}: dart run bin/next_feature.dart command [options]',
      );
      print('Use ${Colors.colorize('--help',Colors.grey)} with a specific command to see its options.');
    }
    if (results['version'] == true) {
      print(
        '\n\u{1F4C4} Current version of Next Feature CLI is 1.0.0',
      ); // Replace with actual version
    }
  }
}
