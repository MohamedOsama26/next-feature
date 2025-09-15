import 'package:next_feature/cli.dart';

/// The main entry point of the CLI application.
/// It creates an instance of the CLI class and runs it with the provided arguments.
/// @param arguments The command-line arguments passed to the application.
/// like: dart run bin/next_feature.dart <command> [options]
/// so arguments are command and options
/// arguments: List<String> - A list of command-line arguments.
/// e.g., ['create_feature', 'feature_name']
void main(List<String> arguments) {
  CLI().run(arguments);
}
