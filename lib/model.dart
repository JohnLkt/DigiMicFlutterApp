// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'package:digimicapp/staticclass.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ESPdataState extends ChangeNotifier{
  int brightness = 0;
  int xpos = 0;
  int ypos = 0;
  int zpos = 0;
  int currentValue = 0;
  int multiplier = 1;
  bool doingTask = false;
  bool ishoming = false;

  
  void updateValue(int newValue) {
    currentValue = newValue;
    notifyListeners();
  }

  void updateMultiplier(int newMultiplier) {
    multiplier = newMultiplier;
    notifyListeners();
  }

   void updateBrightness(int newBrightness) {
    brightness = newBrightness;
    notifyListeners();
  }
 
  Future<void> incrementValue(TextEditingController controller) async {
    final int currentValue = int.tryParse(controller.text) ?? 0;
    final int newValue = currentValue + Variable.slidervalue;
    controller.text = newValue.toString();
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
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
    final response =  await http.post(
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
    ishoming = !ishoming;
    notifyListeners();
      const String url = 'http://esp.local/reset';

      final Map data = {
    };

      final response = await http.post(
        Uri.parse(url),
        body: json.encode(data),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to toggle lock status');
      } else {
        ishoming = !ishoming;
        notifyListeners();
      }
    }
}