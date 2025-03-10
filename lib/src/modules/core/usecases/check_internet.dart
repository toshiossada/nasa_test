import 'dart:io';

import 'package:flutter/material.dart';

/// A use case for checking internet connectivity by performing a
/// lookup operation.
///
/// This class provides a method to determine if the device has an active
/// internet
/// connection by executing a provided lookup function, which should attempt
/// to
/// resolve a set of addresses.
class CheckInternetUsecase {
  CheckInternetUsecase() : lookup = null;

  @visibleForTesting
  CheckInternetUsecase.test({this.lookup});

  final Future<List> Function()? lookup;

  /// Executes the lookup function to determine if there is an active internet
  Future<bool> call() async {
    try {
      late List result;
      if (lookup != null) {
        result = await lookup!();
      } else {
        result = await InternetAddress.lookup('google.com');
      }

      if (result.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
