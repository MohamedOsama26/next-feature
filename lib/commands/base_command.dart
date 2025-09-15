import 'package:args/args.dart';

abstract class BaseCommand {
  String get name;
  String get description;

  /// Override this to add custom options for each command
  void configure(ArgParser parser);

  /// Internal: ensures `--help` is always added
  void configureWithBase(ArgParser parser){
    parser.addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Show usage information',
    );

    configure(parser); // allow the command to add more options
  }

  void run(ArgResults results);


  void printUsage(ArgParser parser) {
    print('Usage: dart run bin/next_feature.dart $name [options]');
    print(description);
    print(parser.usage);
  }
}