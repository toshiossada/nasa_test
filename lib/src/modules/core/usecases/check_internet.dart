import 'dart:io';

/// A use case for checking internet connectivity by performing a
/// lookup operation.
///
/// This class provides a method to determine if the device has an active
/// internet
/// connection by executing a provided lookup function, which should attempt
/// to
/// resolve a set of addresses.
class CheckInternetUsecase {
  CheckInternetUsecase();

  /// Executes the lookup function to determine if there is an active internet
  Future<bool> call() async {
    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
