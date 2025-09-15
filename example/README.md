# Next Feature CLI Examples

This directory contains examples of how to use the Next Feature CLI tool to generate Flutter feature structures following clean architecture principles.

## Installation

First, install the CLI globally:

```bash
dart pub global activate next_feature
```

## Basic Usage Examples

### 1. Interactive Mode (Recommended for beginners)

Simply run the command and follow the interactive prompts:

```bash
next-feature create-feature
```

**Sample interaction:**
```
? Enter feature name: user_profile
? Choose state management type: bloc
? Split data source into local and remote? Yes
? Enter models (comma-separated): user,profile,settings
? Enter use cases (comma-separated): get_user,update_profile,delete_user
? Enter screens (comma-separated): profile_page,edit_profile_page
```

### 2. Command Line Mode (For automation/scripts)

Provide all options directly via command line:

```bash
next-feature create-feature \
  --feature-name user_profile \
  --state-management-type bloc \
  --split-data-source \
  --models user,profile,settings \
  --use-cases get_user,update_profile,delete_user \
  --screens profile_page,edit_profile_page
```

## Real-World Examples

### Example 1: Authentication Feature with BLoC

```bash
next-feature create-feature \
  --feature-name authentication \
  --state-management-type bloc \
  --split-data-source \
  --models user,login_request,register_request \
  --use-cases login,register,logout,forgot_password \
  --screens login_page,register_page,forgot_password_page
```

**Generated structure:**
```
lib/features/authentication/
├── data/
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── login_request_model.dart
│   │   └── register_request_model.dart
│   ├── repositories/
│   │   └── authentication_repository_impl.dart
│   └── datasources/
│       ├── authentication_local_datasource.dart
│       └── authentication_remote_datasource.dart
├── domain/
│   ├── entities/
│   │   ├── user.dart
│   │   ├── login_request.dart
│   │   └── register_request.dart
│   ├── repositories/
│   │   └── authentication_repository.dart
│   └── usecases/
│       ├── login.dart
│       ├── register.dart
│       ├── logout.dart
│       └── forgot_password.dart
└── presentation/
    ├── pages/
    │   ├── login_page.dart
    │   ├── register_page.dart
    │   └── forgot_password_page.dart
    ├── widgets/
    │   └── authentication_widget.dart
    └── bloc/
        ├── authentication_bloc.dart
        ├── authentication_event.dart
        └── authentication_state.dart
```

### Example 2: E-commerce Product Feature with GetX

```bash
next-feature create-feature \
  --feature-name product \
  --state-management-type getx \
  --models product,category,review \
  --use-cases get_products,get_product_details,add_review \
  --screens product_list_page,product_details_page
```

### Example 3: Simple Settings Feature with Provider

```bash
next-feature create-feature \
  --feature-name settings \
  --state-management-type provider \
  --models app_settings,user_preferences \
  --use-cases get_settings,update_settings \
  --screens settings_page
```

### Example 4: Chat Feature with Riverpod

```bash
next-feature create-feature \
  --feature-name chat \
  --state-management-type riverpod \
  --split-data-source \
  --models message,chat_room,user \
  --use-cases send_message,get_messages,create_chat_room \
  --screens chat_list_page,chat_room_page
```

## Available Options

| Option | Description | Example |
|--------|-------------|---------|
| `--feature-name` | Name of the feature (required) | `user_profile`, `authentication` |
| `--state-management-type` | State management solution | `bloc`, `getx`, `provider`, `riverpod` |
| `--split-data-source` | Split into local and remote data sources | Use flag to enable |
| `--models` | Comma-separated list of model names | `user,profile,settings` |
| `--use-cases` | Comma-separated list of use case names | `get_user,update_profile` |
| `--screens` | Comma-separated list of screen names | `login_page,profile_page` |

## State Management Templates

The CLI generates different boilerplate based on your chosen state management:

- **BLoC**: Generates bloc, event, and state files with flutter_bloc pattern
- **GetX**: Creates GetX controller with reactive state management
- **Provider**: Generates ChangeNotifier classes with Provider pattern
- **Riverpod**: Creates providers with Riverpod state management

## Tips for Best Results

1. **Use snake_case for feature names**: `user_profile` instead of `UserProfile`
2. **Keep model names simple**: `user`, `product` instead of `user_model`
3. **Use descriptive use case names**: `get_user_profile`, `update_user_settings`
4. **Follow Flutter naming conventions**: `login_page`, `profile_widget`

## Integration with Existing Projects

To integrate generated features into your existing Flutter project:

1. Run the CLI in your project root directory
2. The feature will be created in `lib/features/[feature_name]/`
3. Add necessary dependencies to your `pubspec.yaml` based on state management choice
4. Import and use the generated files in your app

## Getting Help

For help with any command:

```bash
next-feature --help
next-feature create-feature --help
```

## Common Issues and Solutions

**Issue**: Command not found after installation
**Solution**: Ensure `~/.pub-cache/bin` (macOS/Linux) or `%LOCALAPPDATA%\Pub\Cache\bin` (Windows) is in your PATH

**Issue**: Permission denied on macOS/Linux
**Solution**: Run `chmod +x ~/.pub-cache/bin/next-feature`

For more examples and documentation, visit: https://github.com/MohamedOsama26/next-feature

