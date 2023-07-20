import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ESPdataState extends ChangeNotifier{
  int brightness = 0;
  int xpos = 0;
  int ypos = 0;
  int zpos = 0;
  bool doingTask = false;

   void updateBrightness(int newBrightness) {
    brightness = newBrightness;
    notifyListeners();
  }
  
  void updateXPos(int newXPos) {
    xpos = newXPos;
    notifyListeners();
  }

  void updateYPos(int newYPos) {
    ypos = newYPos;
    notifyListeners();
  }

  void updateZPos(int newZPos) {
    zpos = newZPos;
    notifyListeners();
  }

  void toggleTaskStatus() {
    doingTask = !doingTask;
    notifyListeners();
  }

  Future<void> submitValues() async {
    doingTask = !doingTask;
    notifyListeners();

    final Map data = {
      'brightness': brightness,
      'xpos': xpos,
      'ypos': ypos,
      'zpos': zpos,
    };


    const String url = 'http://esp.local/pos';
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to toggle lock status');
    } else {
      doingTask = !doingTask;
      notifyListeners();
    }
  }
  
   Future<void> resetValue() async {
    doingTask = !doingTask;
    notifyListeners();
      const String url = 'http://esp.local/reset';

      final Map data = {
      'brightness': brightness,
      'xpos': xpos,
      'ypos': ypos,
      'zpos': zpos,
    };
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(data),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to toggle lock status');
      } else {
        doingTask = !doingTask;
        notifyListeners();
      }
    }
}