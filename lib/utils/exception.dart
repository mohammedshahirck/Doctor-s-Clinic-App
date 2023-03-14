import 'dart:async';
import 'dart:io';
import 'package:doctor_clinic/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exceptionsfires {
  static void errorHandler(Object e, BuildContext context) {
    if (e is PlatformException) {
      showSnackBar(context, 'Platform Error Occured');
    }
    if (e is SocketException) {
      showSnackBar(context, 'No Internet Connection');
    } else if (e is TimeoutException) {
      showSnackBar(context, 'Connection Timeout');
    } else if (e is MissingPluginException) {
      showSnackBar(context, 'Pluggin error occured');
    } else {
      return showSnackBar(context, e.toString());
    }
  }
}
