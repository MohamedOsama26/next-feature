import 'package:next_feature/commands/base_command.dart';
import 'package:args/args.dart';
import 'package:prompts/prompts.dart' as prompts;
import '../generator/feature_generator.dart';
import '../utils/logger.dart';

class CreateFeatureCommand extends BaseCommand {
  late ArgParser _parser; // Store the parser for usage printing

  @override
  String get name => 'create-feature';

  @override
  String get description => 'Creates a new feature scaffold.';

  @override
  void configure(ArgParser parser) {
    _parser = parser; // Save the parser reference
    parser
      ..addOption('feature-name', help: 'Name of the feature to create')
      ..addOption(
        'state-management-type',
        help: 'State management type (e.g., bloc, provider, riverpod)',
        defaultsTo: 'bloc',
      )
      ..addFlag(
        'split-data-source',
        help: 'Whether to split data source into local and remote',
        defaultsTo: false,
      )
      ..addMultiOption(
        'models',
        help: 'List of model names to create',
        defaultsTo: [],
      )
      ..addMultiOption(
        'use-cases',
        help: 'List of use case names to create',
        defaultsTo: [],
      )
      ..addMultiOption(
        'screens',
        help: 'List of screen names to create',
        defaultsTo: [],
      );
  }

  @override
  void run(ArgResults results) {
    // If --help is passed, print usage and return
    if (results['help'] == true) {
      printUsage(_parser);
      return;
    }

    // Feature name
    String? featureName =
        results['feature-name'] as String? ??
        (results.rest.isNotEmpty ? results.rest.first : null);
    featureName ??= prompts.get('Enter feature name');
    if (featureName.trim().isEmpty) {
      Logger.error('Feature name cannot be empty');
      return;
    }

    // State management type
    String? stateManagementType;
    if (results.wasParsed('state-management-type')) {
      stateManagementType = results['state-management-type'] as String?;
    } else {
      stateManagementType = prompts.get(
        'State management type (e.g., bloc, getx, provider, riverpod)',
        defaultsTo: 'bloc',
      );
    }

    // Split data source
    bool? splitDataSource;
    if (results.wasParsed('split-data-source')) {
      splitDataSource = results['split-data-source'] as bool?;
    } else {
      splitDataSource = prompts.getBool(
        'Split data source into local and remote?',
        defaultsTo: false,
      );
    }

    // Models
    List<String>? models = (results['models'] as List?)?.cast<String>();
    if (models == null || models.isEmpty) {
      String modelsInput = prompts.get(
        'List of model names to create (comma separated, leave empty for none)',
      );
      models = modelsInput.trim().isEmpty
          ? []
          : modelsInput
                .split(',')
                .map((s) => s.trim())
                .where((s) => s.isNotEmpty)
                .toList();
    }

    // Use cases
    List<String>? useCases = (results['use-cases'] as List?)?.cast<String>();
    if (useCases == null || useCases.isEmpty) {
      String useCasesInput = prompts.get(
        'List of use case names to create (comma separated, leave empty for none)',
      );
      useCases = useCasesInput.trim().isEmpty
          ? []
          : useCasesInput
                .split(',')
                .map((s) => s.trim())
                .where((s) => s.isNotEmpty)
                .toList();
    }

    // Screens
    List<String>? screens = (results['screens'] as List?)?.cast<String>();
    if (screens == null || screens.isEmpty) {
      String screensInput = prompts.get(
        'List of screen names to create (comma separated, leave empty for none)',
      );
      screens = screensInput.trim().isEmpty
          ? []
          : screensInput
                .split(',')
                .map((s) => s.trim())
                .where((s) => s.isNotEmpty)
                .toList();
    }

    Logger.info('Creating feature: $featureName');
    Logger.info('State management type: $stateManagementType');
    Logger.info('Split data source: $splitDataSource');
    Logger.info('Models: ${models.join(', ')}');
    Logger.info('Use Cases: ${useCases.join(', ')}');
    Logger.info('Screens: ${screens.join(', ')}');

    // Here you would add the logic to actually create the feature scaffold
    final generator = FeatureGenerator(
      featureName: featureName,
      stateManagementType: stateManagementType ?? 'bloc',
      splitDataSource: splitDataSource ?? false,
      models: models,
      useCases: useCases,
      screens: screens,
    );
    generator.generate();

    Logger.success('Feature "$featureName" created successfully!');
  }
}
