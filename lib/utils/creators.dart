import 'dart:io';


/// A utility class for creating directories and Dart files for a feature
/// module in a Flutter project.
class Creators {
  static void _createDir(String path) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('✅ Created folder: ${dir.path}');
    }
  }

  static void _createDartFiles(List<String> filePaths) {
    for (var path in filePaths) {
      final file = File(path);
      if (!file.existsSync()) {
        file.createSync(recursive: true);
        print('✅ Created file: ${file.path}');
      }
    }
  }

  static void createDataSources({
    required String path,
    required bool splitDataSource,
    required String featureName,
  }) {
    if (splitDataSource) {
      final List<String> files = [
        'data/data_sources/local/${featureName}_local_data_source.dart',
        'data/data_sources/local/${featureName}_local_data_source.impl.dart',
        'data/data_sources/remote/${featureName}_remote_data_source.dart',
        'data/data_sources/remote/${featureName}_remote_data_source.impl.dart',
      ];

      _createDartFiles(files.map((file) => '$path/$file').toList());
    } else {
      final List<String> files = [
        'data/data_sources/${featureName}_data_source.dart',
        'data/data_sources/${featureName}_data_source.impl.dart',
      ];
      _createDartFiles(files.map((file) => '$path/$file').toList());
    }
  }

  static void createModels({
    required String path,
    required List<String> models,
  }) {
    _createDartFiles(
      models.map((model) => '$path/data/models/${model}_dto.dart').toList(),
    );
    _createDartFiles(
      models
          .map((model) => '$path/data/models/mappers/${model}_mapper.dart')
          .toList(),
    );
  }

  static void createRepositories({
    required String path,
    required String featureName,
  }) {
    _createDartFiles([
      '$path/domain/repositories/${featureName}_repository.dart',
      '$path/data/repositories/${featureName}_repository_impl.dart',
    ]);
  }

  static void createEntities({
    required String path,
    required List<String> models,
  }) {
    _createDartFiles(
      models.map((model) => '$path/domain/entities/$model.dart').toList(),
    );
    _createDartFiles(
      models
          .map((model) => '$path/domain/entities/mappers/${model}_mapper.dart')
          .toList(),
    );

  }

  static void createUseCases({
    required String path,
    required List<String> useCases,
    required String featureName,
  }) {
    _createDartFiles(['$path/domain/use_cases/${featureName}_use_cases.dart']);
    _createDartFiles(
      useCases
          .map((useCase) => '$path/domain/use_cases/${useCase}_use_case.dart')
          .toList(),
    );
  }

  static void createStateManagement({
    required String path,
    required String featureName,
    required String stateManagementType, // 'bloc', 'cubit', 'provider', etc.
  }) {
    if (stateManagementType.toLowerCase() == 'bloc') {
      _createDartFiles([
        '$path/presentation/bloc/${featureName}_bloc.dart',
        '$path/presentation/bloc/${featureName}_event.dart',
        '$path/presentation/bloc/${featureName}_state.dart',
      ]);
    }
    // Additional state management types can be added here
  }

  static void createPresentation({
    required String path,
    List<String>? widgets,
    List<String>? screens,
    required String featureName,
  }) {
    if (widgets != null && widgets.isNotEmpty) {
      _createDartFiles(
        widgets
            .map((widget) => '$path/presentation/widgets/${widget}_widget.dart')
            .toList(),
      );

    } else {
      _createDir('$path/presentation/widgets');

    }

    if (screens != null && screens.isNotEmpty) {
      _createDartFiles(
        screens
            .map((screen) => '$path/presentation/screens/${screen}_screen.dart')
            .toList(),
      );
    } else {
      _createDir('$path/presentation/screens');
    }
  }
}
