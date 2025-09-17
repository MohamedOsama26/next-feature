import 'dart:io';
import 'package:args/args.dart';
import 'package:next_feature/commands/base_command.dart';

class CreateRemoteDataSourceCommand extends BaseCommand {
  late ArgParser _parser;
  final List<String> options = [
    'Default',
    'REST API (HTTP)',
    'REST API (Dio)',
    'GraphQL',
    'gRPC',
    'WebSockets',
    'Server-Sent Events (SSE)',
    'MQTT',
    'TCP/UDP Sockets',
    'Firebase (Firestore / Realtime DB / Functions)',
    'Supabase',
    'Appwrite',
    'Custom SDK / Third-Party API',
  ];

  @override
  String get name => 'create-remote-data-source';

  @override
  String get description => 'Creates a remote data source class.';

  @override
  void configure(parser) {
    _parser = parser;

    parser
      ..addOption(
        'backend-type',
        help: 'Backend connection type',
        allowed: options,
        defaultsTo: options.first,
      )
      ..addFlag(
        'split-interface-and-implementation',
        help: 'Whether to split data source into interface and implementation files',
        defaultsTo: true,
      )
      ..addMultiOption(
        'functions',
        help: 'List of function names to create',
        defaultsTo: [],
      );
  }

  @override
  void run(results) {
    if (results['help'] == true) {
      printUsage(_parser);
      return;
    }

    // Get backend type - prompt if not provided
    String? backendType;
    if (results.wasParsed('backend-type')) {
      backendType = results['backend-type'] as String?;
    } else {
      backendType = _promptChoice('Select a backend connection type:', options);
    }

    // Get split interface flag - prompt if not provided
    bool? splitInterface;
    if (results.wasParsed('split-interface-and-implementation')) {
      splitInterface = results['split-interface-and-implementation'] as bool?;
    } else {
      splitInterface = _promptBool('Split interface and implementation files?', defaultsTo: true);
    }

    // Get functions - prompt if not provided
    List<String>? functions;
    if (results.wasParsed('functions')) {
      functions = (results['functions'] as List?)?.cast<String>();
    } else {
      String functionsInput = _prompt('List of function names to create (comma separated, leave empty for none)');
      functions = functionsInput.trim().isEmpty
          ? []
          : functionsInput.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
    }

    print('Selected backend type: $backendType');
    print('Split interface and implementation: $splitInterface');
    print('Functions: ${functions?.join(', ') ?? 'None'}');
  }

  String _promptChoice(String message, List<String> choices) {
    print('\n$message');
    for (int i = 0; i < choices.length; i++) {
      print('${i + 1}. ${choices[i]}');
    }

    while (true) {
      stdout.write('Enter your choice (1-${choices.length}): ');
      String? input = stdin.readLineSync()?.trim();

      if (input != null) {
        int? choice = int.tryParse(input);
        if (choice != null && choice >= 1 && choice <= choices.length) {
          return choices[choice - 1];
        }
      }
      print('Invalid choice. Please enter a number between 1 and ${choices.length}.');
    }
  }

  String _prompt(String message, {String? defaultsTo}) {
    stdout.write('$message${defaultsTo != null ? ' [$defaultsTo]' : ''}: ');
    String? input = stdin.readLineSync()?.trim();
    return input?.isEmpty == true ? defaultsTo ?? '' : input!;
  }

  bool _promptBool(String message, {bool defaultsTo = false}) {
    String defaultStr = defaultsTo ? 'y' : 'n';
    stdout.write('$message (y/n) [$defaultStr]: ');
    String? input = stdin.readLineSync()?.trim().toLowerCase();
    if (input == null || input.isEmpty) return defaultsTo;
    return input == 'y' || input == 'yes';
  }
}
