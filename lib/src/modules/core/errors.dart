/// An abstract class that defines the interface for failure types within the
/// application.
///
/// This class implements [Exception] and provides a contract for custom
/// exception types
/// that can be thrown throughout the application. Each failure type should
///   provide a
/// descriptive message that can be used for error handling and logging.
class Failure implements Exception {
  Failure({required this.message});

  /// A descriptive message about the failure.
  final String? message;
}

/// A custom failure type representing errors that occur during object mapping
/// operations.
///
/// This error is typically thrown when converting between different object
/// representations
/// fails, such as converting a JSON map to a Dart object.
class MapperError extends Failure {
  /// Usage:
  /// ```dart
  /// MapperError(
  ///   message: 'Error occurred while mapping object',
  /// )
  /// ```
  MapperError({super.message});
}
