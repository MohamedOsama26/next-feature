import 'package:next_feature/models/base_command.dart';
import 'package:args/args.dart';
import 'package:prompts/prompts.dart' as prompts;
import '../utils/logger.dart';

class CreateFeatureCommand extends BaseCommand {
  @override
  String get name => 'create-feature';

  @override
  String get description => 'Creates a new feature scaffold.';

  @override
  void configure(ArgParser parser) {
    // No specific options for now
  }

  @override
  void run(ArgResults results) {
    String? featureName = results.rest.isNotEmpty ? results.rest.first : null;

    // Ask interactively if not provided
    featureName ??= prompts.get('Enter feature name');

    if (featureName.trim().isEmpty) {
      Logger.error('Feature name cannot be empty');
      return;
    }

    Logger.info('Creating feature: $featureName');

    // final generator = FeatureGenerator(featureName);
    // generator.generate();

    Logger.success('Feature "$featureName" created successfully!');
  }
}