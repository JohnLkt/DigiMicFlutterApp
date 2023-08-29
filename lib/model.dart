// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DigimicState extends ChangeNotifier{
  int brightness = 0;
  int xpos = 0;
  int ypos = 0;
  int zpos = 0;
  int multiplier = 1;
  bool doingTask = false;
  String snackBarError = '';

  void updateBrightness(int newBrightness) {
    brightness = newBrightness;
    notifyListeners();
    sendToMicroscope();
  }

  void updateMultiplier(int newMultiplier) {
    multiplier = newMultiplier;
    notifyListeners();
  }

  void movePositiveX() {
    xpos = xpos + multiplier;
    notifyListeners();
    sendToMicroscope();
  }

  void moveNegativeX() {
    xpos = xpos - multiplier;
    notifyListeners();
    sendToMicroscope();
  }

  void movePositiveY() {
    ypos = ypos + multiplier;
    notifyListeners();
    sendToMicroscope();
  }

  void moveNegativeY() {
    ypos = ypos - multiplier;
    notifyListeners();
    sendToMicroscope();
  }

  void movePositiveZ() {
    zpos = zpos + multiplier;
    notifyListeners();
    sendToMicroscope();
  }

  void moveNegativeZ() {
    zpos = zpos - multiplier;
    notifyListeners();
    sendToMicroscope();
  }
Future<void> sendToMicroscope() async {
    // check if doing task
    if (!doingTask) {
      // do task
      doingTask = true;
      notifyListeners();

      final Map data = {
        'brightness': brightness,
        'xpos': xpos,
        'ypos': ypos,
        'zpos': zpos,
      };

      const String url = 'http://192.168.4.1/pos';

      try {

        final response = await http.post(
          Uri.parse(url),
          body: json.encode(data),
        ).timeout(const Duration(seconds: 10)); // Set a timeout of 10 seconds

        if (response.statusCode != 200) {
          snackBarError = "Failed to send data to microscope, please check your connection and try again";
        } else {
          snackBarError = ""; // Reset the error if successful response
        }

      } catch (e) {

        snackBarError = "Failed to send data to microscope, please check your connection and try again";

      } finally {

        doingTask = false;
        notifyListeners();

      }
    }
  }
}