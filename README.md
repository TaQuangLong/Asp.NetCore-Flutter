## Flutter CRUD Consume ASP.NET CORE WEB API

### Prerequisites

- [.NET SDK](https://dotnet.microsoft.com/download)
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio/install)

### Setting Up the Backend

1. Navigate to the `NetCoreAndFlutterDemo` directory.
2. Apply EF migrations:
    ```sh
    dotnet ef database update
    ```
3. Run the backend application:
    ```sh
    dotnet run
    ```

### Setting Up the Frontend

1. Navigate to the `flutter_web_api` directory.
2. Ensure you have an Android emulator created in Android Studio and select this device to use.
3. Run the Flutter application:
    ```sh
    flutter run
    ```

## Project Details

### Backend

The backend is built with .NET 9 and includes the following features:
- Entity Framework Core for database access.
- AutoMapper for object-object mapping.
- Swagger for API documentation.
- Database: SQL Server

### Frontend

The frontend is built with Flutter and includes the following features:
- HTTP package for API calls.
- FormBuilder for form handling and validation.
