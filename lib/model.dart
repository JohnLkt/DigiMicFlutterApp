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
  }

  void updateMultiplier(int newMultiplier) {
    multiplier = newMultiplier;
    notifyListeners();
  }

  void movePositiveX() {
    xpos = xpos + multiplier;
    notifyListeners();
  }

  void moveNegativeX() {
    xpos = xpos - multiplier;
    notifyListeners();
  }

  void movePositiveY() {
    ypos = ypos + multiplier;
    notifyListeners();
  }

  void moveNegativeY() {
    ypos = ypos - multiplier;
    notifyListeners();
  }

  void movePositiveZ() {
    zpos = zpos + multiplier;
    notifyListeners();
  }

  void moveNegativeZ() {
    zpos = zpos - multiplier;
    notifyListeners();
  }

  Future<void> sendToMicroscope() async {
    // check if doing task
    if (!doingTask) {
      // do task
      doingTask = !doingTask;
      notifyListeners();

      final Map data = {
        'brightness': brightness,
        'xpos': xpos,
        'ypos': ypos,
        'zpos': zpos,
      };

      const String url = 'http://192.168.4.1/pos';
      // 192.168.4.1 is the default IP address of ESP softAP

      final response =  await http.post(
        Uri.parse(url),
        body: json.encode(data),
      );

      if (response.statusCode != 200) {
        snackBarError = "Failed to send data to microscope, please check your connection and try again";
        notifyListeners();
      } else {
        doingTask = !doingTask;
        notifyListeners();
      }
    }
  }
}