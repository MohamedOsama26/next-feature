import 'dart:io';

import 'package:next_feature/utils/creators.dart';

/// A simple feature generator for a Flutter project
class FeatureGenerator {
  final String featureName;
  final String template;
  final String stateManagementType;
  final bool splitDataSource;
  final List<String> models;
  final List<String> useCases;
  final List<String> screens;

  FeatureGenerator({
    required this.featureName,
    this.template = 'default',
    required this.stateManagementType,
    required this.splitDataSource,
    required this.models,
    required this.useCases,
    required this.screens,
  });

  /// Generates the feature structure based on the provided configuration
  void generate() {
    final basePath = Directory('lib/features/$featureName');

    if (!basePath.existsSync()) {
      basePath.createSync(recursive: true);
      print('✅ Created folder: ${basePath.path}');
    }

    Creators.createDataSources(
      path: basePath.path,
      splitDataSource: splitDataSource,
      featureName: featureName,
    );

    Creators.createModels(path: basePath.path, models: models);

    Creators.createRepositories(path: basePath.path, featureName: featureName);

    Creators.createEntities(path: basePath.path, models: models);

    Creators.createUseCases(
      path: basePath.path,
      useCases: useCases,
      featureName: featureName,
    );

    Creators.createStateManagement(
      path: basePath.path,
      stateManagementType: stateManagementType,
      featureName: featureName,
    );

    Creators.createPresentation(
      path: basePath.path,
      screens: screens,
      featureName: featureName,
    );
  }
}
