# 🛠️ Next Feature CLI

A powerful **command-line tool** for Flutter developers that generates clean, scalable **feature folder structures** following clean architecture principles. Speed up your development by automatically creating organized folders and boilerplate code for data, domain, and presentation layers.

## ✨ Features

- 🚀 **One-command feature generation** - Create complete feature structures instantly
- 🏗️ **Clean Architecture** - Follows industry-standard separation of concerns
- 📂 **Auto-generated structure** - Creates `data`, `domain`, and `presentation` layers
- 🧱 **Smart templates** - Generates repositories, models, use cases, widgets, and state management
- 🔧 **Flexible options** - Choose your state management (Bloc, GetX, Provider, Riverpod)
- 📱 **Data source splitting** - Option to separate local and remote data sources
- ⚡ **Time-saving** - Eliminates repetitive boilerplate code creation
- 🎯 **Consistent structure** - Enforces best practices across your entire project

## 📦 Installation

### Global Installation (Recommended)
Install the CLI globally from pub.dev:

```bash
dart pub global activate next_feature
```

After installation, you can use the CLI directly:

```bash
next-feature create-feature
```

Make sure to add Dart's global packages to your PATH if not already done:
- **Windows**: Add `%LOCALAPPDATA%\Pub\Cache\bin` to your PATH
- **macOS/Linux**: Add `$HOME/.pub-cache/bin` to your PATH

### Local Development
Clone and run locally for development:

```bash
git clone https://github.com/MohamedOsama26/next-feature.git
cd next-feature
dart pub get
dart run bin/next_feature.dart create-feature
```

## 🚀 Usage

### Interactive Mode
Simply run the command and follow the prompts:

```bash
next-feature create-feature
```

The CLI will ask you to configure:
- **Feature name** - The name of your feature (e.g., user_profile, authentication)
- **State management** - Choose from bloc, getx, provider, or riverpod
- **Data source splitting** - Separate local and remote data sources
- **Models** - List of model classes to generate
- **Use cases** - List of use case classes to generate
- **Screens** - List of screen/page classes to generate

### Command Line Options
You can also provide options directly:

```bash
next-feature create-feature --feature-name user_profile --state-management-type bloc --split-data-source --models user,profile --use-cases get_user,update_profile --screens profile_page,settings_page
```

### Available Options
- `--feature-name` - Name of the feature to create
- `--state-management-type` - State management solution (bloc, getx, provider, riverpod)
- `--split-data-source` - Split data source into local and remote
- `--models` - Comma-separated list of model names
- `--use-cases` - Comma-separated list of use case names  
- `--screens` - Comma-separated list of screen names

## 📁 Generated Structure

For a feature named `user_profile` with Bloc state management:

```
lib/
└── features/
    └── user_profile/
        ├── data/
        │   ├── models/
        │   │   └── user_model.dart
        │   ├── repositories/
        │   │   └── user_profile_repository_impl.dart
        │   ├── datasources/
        │   │   ├── user_profile_local_datasource.dart
        │   │   └── user_profile_remote_datasource.dart
        │   └── datasource.dart
        ├── domain/
        │   ├── entities/
        │   │   └── user.dart
        │   ├── repositories/
        │   │   └── user_profile_repository.dart
        │   └── usecases/
        │       ├── get_user.dart
        │       └── update_profile.dart
        └── presentation/
            ├── pages/
            │   ├── profile_page.dart
            │   └── settings_page.dart
            ├── widgets/
            │   └── user_profile_widget.dart
            └── bloc/
                ├── user_profile_bloc.dart
                ├── user_profile_event.dart
                └── user_profile_state.dart
```

## 🎯 Clean Architecture Benefits

The generated structure follows **Clean Architecture** principles:

- **📊 Data Layer**: Handles data sources, models, and repository implementations
- **🏢 Domain Layer**: Contains business logic, entities, and repository interfaces  
- **🎨 Presentation Layer**: Manages UI, widgets, and state management

This separation ensures:
- **Testability** - Easy to unit test business logic
- **Maintainability** - Clear separation of concerns
- **Scalability** - Easy to add new features without affecting existing code
- **Independence** - Each layer can be modified without affecting others

## 🔧 Help & Documentation

Get help for any command:

```bash
next-feature --help
next-feature create-feature --help
```

## 🛠️ Customization

Want to customize templates? Fork the repository and modify the generator templates in `lib/generators/` to fit your project's specific needs. Contributions are welcome!

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **🐛 Report bugs** - Open an issue describing the problem
2. **💡 Suggest features** - Share your ideas for improvements  
3. **🔀 Submit PRs** - Fix bugs or add new features
4. **📖 Improve docs** - Help make the documentation better

Please visit our [GitHub repository](https://github.com/MohamedOsama26/next-feature) to contribute.

## 🚀 Roadmap

- [ ] Custom template support
- [ ] Integration with popular packages (dio, hive, etc.)
- [ ] VSCode extension
- [ ] More state management options
- [ ] Test file generation
- [ ] Internationalization support

## 📄 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

## 📬 Contact & Support

- 🐛 **Issues**: [GitHub Issues](https://github.com/MohamedOsama26/next-feature/issues)
- 📧 **Email**: [mohamed.99.kandel@gmail.com](mailto:mohamed.99.kandel@gmail.com)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/MohamedOsama26/next-feature/discussions)

---

**Happy coding!** 🚀 Speed up your Flutter development with clean, maintainable feature structures.
