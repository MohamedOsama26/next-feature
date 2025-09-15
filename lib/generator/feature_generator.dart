import 'dart:io';

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

    if (splitDataSource) {
      final localDir = Directory('${basePath.path}/data/data_sources/local');
      final remoteDir = Directory('${basePath.path}/data/data_sources/remote');
      if (!localDir.existsSync()) {
        localDir.createSync(recursive: true);
        print('✅ Created folder: ${localDir.path}');
      }
      if (!remoteDir.existsSync()) {
        remoteDir.createSync(recursive: true);
        print('✅ Created folder: ${remoteDir.path}');
      }
    }

    if (splitDataSource) {
      final List<String> files = [
        'data/data_sources/local/${featureName}_local_data_source.dart',
        'data/data_sources/local/${featureName}_local_data_source.impl.dart',
        'data/data_sources/remote/${featureName}_remote_data_source.dart',
        'data/data_sources/remote/${featureName}_remote_data_source.impl.dart',
      ];

      for (var file in files) {
        final filePath = File('${basePath.path}/$file');
        if (!filePath.existsSync()) {
          filePath.createSync(recursive: true);
          print('✅ Created file: ${filePath.path}');
        }
      }
    } else {
      final List<String> files = [
        'data/data_sources/${featureName}_data_source.dart',
        'data/data_sources/${featureName}_data_source.impl.dart',
      ];
      for (var file in files) {
        final filePath = File('${basePath.path}/$file');
        if (!filePath.existsSync()) {
          filePath.createSync(recursive: true);
          print('✅ Created file: ${filePath.path}');
        }
      }
    }

    for (var model in models) {
      final dtoFile = File('${basePath.path}/data/models/${model}_dto.dart');
      final mapperFile = File(
        '${basePath.path}/data/models/mappers/${model}_mapper.dart',
      );
      if (!dtoFile.existsSync()) {
        dtoFile.createSync(recursive: true);
        print('✅ Created file: ${dtoFile.path}');
      }
      if (!mapperFile.existsSync()) {
        mapperFile.createSync(recursive: true);
        print('✅ Created file: ${mapperFile.path}');
      }
    }

    final dataRepoImplFile = File(
      '${basePath.path}/data/repositories/${featureName}_repository.impl.dart',
    );
    if (!dataRepoImplFile.existsSync()) {
      dataRepoImplFile.createSync(recursive: true);
      print('✅ Created file: ${dataRepoImplFile.path}');
    }

    for (var model in models) {
      final entityFile = File('${basePath.path}/domain/entities/$model.dart');
      final entityMapperFile = File(
        '${basePath.path}/domain/entities/mappers/${model}_mapper.dart',
      );
      if (!entityFile.existsSync()) {
        entityFile.createSync(recursive: true);
        print('✅ Created file: ${entityFile.path}');
      }
      if (!entityMapperFile.existsSync()) {
        entityMapperFile.createSync(recursive: true);
        print('✅ Created file: ${entityMapperFile.path}');
      }
    }

    final domainRepoFile = File(
      '${basePath.path}/domain/repositories/${featureName}_repository.dart',
    );
    if (!domainRepoFile.existsSync()) {
      domainRepoFile.createSync(recursive: true);
      print('✅ Created file: ${domainRepoFile.path}');
    }

    for (var useCase in useCases) {
      final useCaseFile = File(
        '${basePath.path}/domain/use_cases/${useCase}_use_case.dart',
      );
      if (!useCaseFile.existsSync()) {
        useCaseFile.createSync(recursive: true);
        print('✅ Created file: ${useCaseFile.path}');
      }
    }

    final useCasesAggregatorFile = File(
      '${basePath.path}/domain/use_cases/${featureName}_use_cases.dart',
    );
    if (!useCasesAggregatorFile.existsSync()) {
      useCasesAggregatorFile.createSync(recursive: true);
      print('✅ Created file: ${useCasesAggregatorFile.path}');
    }

    if (stateManagementType.toLowerCase() == 'bloc') {
      final blocFile = File(
        '${basePath.path}/presentation/bloc/${featureName}_bloc.dart',
      );
      final eventFile = File(
        '${basePath.path}/presentation/bloc/${featureName}_event.dart',
      );
      final stateFile = File(
        '${basePath.path}/presentation/bloc/${featureName}_state.dart',
      );
      if (!blocFile.existsSync()) {
        blocFile.createSync(recursive: true);
        print('✅ Created file: ${blocFile.path}');
      }
      if (!eventFile.existsSync()) {
        eventFile.createSync(recursive: true);
        print('✅ Created file: ${eventFile.path}');
      }
      if (!stateFile.existsSync()) {
        stateFile.createSync(recursive: true);
        print('✅ Created file: ${stateFile.path}');
      }
    }

    for (var screen in screens) {
      final pageFile = File(
        '${basePath.path}/presentation/pages/${screen}_screen.dart',
      );
      if (!pageFile.existsSync()) {
        pageFile.createSync(recursive: true);
        print('✅ Created file: ${pageFile.path}');
      }
    }

    final widgetDir = Directory('${basePath.path}/presentation/widgets');
    if (!widgetDir.existsSync()) {
      widgetDir.createSync(recursive: true);
      print('✅ Created folder: ${widgetDir.path}');
    }
  }
}
