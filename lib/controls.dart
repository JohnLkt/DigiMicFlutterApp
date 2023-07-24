// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields

import 'dart:async';
import 'package:circle_button/circle_button.dart';
import 'package:digimicapp/model.dart';
import 'package:digimicapp/staticclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'component/slide.dart';

class newControlPanel extends StatefulWidget {
  const newControlPanel({
    super.key,
  });

  @override
  State<newControlPanel> createState() => _newControlPanelState();
}

class _newControlPanelState extends State<newControlPanel> {
  int indexTop = 0;
  double valueBottom = 20;
  TextEditingController _brightnessController = TextEditingController();
  TextEditingController _xposController = TextEditingController();
  TextEditingController _yposController = TextEditingController();
  TextEditingController _zposController = TextEditingController();

  void _incrementValue(TextEditingController controller) {
    final int currentValue = int.tryParse(controller.text) ?? 0;
    final int newValue = currentValue + Variable.slidervalue;
    controller.text = newValue.toString();
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  void _incrementValueMin(TextEditingController controller) {
    final int currentValue = int.tryParse(controller.text) ?? 0;
    final int newValue = currentValue - Variable.slidervalue;
    controller.text = newValue.toString();
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final espDataState = Provider.of<ESPdataState>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SliderLabelWidget(
            indexTop: indexTop,
            onTopSliderChanged: (value) {
              setState(() {
                indexTop = value.toInt();
              });
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    _incrementValueMin(_brightnessController);
                  },
                  icon: Icon(Icons.arrow_left)),
              Expanded(
                child: TextField(
                  controller: _brightnessController,
                  onChanged: (newBrightness) {},
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'Enter Brightness'),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _incrementValue(_brightnessController);
                  },
                  icon: Icon(Icons.arrow_right))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    _incrementValueMin(_xposController);
                  },
                  icon: Icon(Icons.arrow_left)),
              Expanded(
                child: TextField(
                  controller: _xposController,
                  onChanged: (newXPos) {
                    if (newXPos.trim().isEmpty) {
                      espDataState.updateXPos(
                          0); // Set a default value when input is empty
                    } else {
                      final xpos = int.tryParse(newXPos);
                      if (xpos != null) {
                        espDataState.updateXPos(xpos);
                      }
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'Enter X Position'),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _incrementValue(_xposController);
                  },
                  icon: Icon(Icons.arrow_right))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    _incrementValueMin(_yposController);
                  },
                  icon: Icon(Icons.arrow_left)),
              Expanded(
                child: TextField(
                  controller: _yposController,
                  onChanged: (newYPos) {
                    if (newYPos.trim().isEmpty) {
                      espDataState.updateYPos(
                          0); // Set a default value when input is empty
                    } else {
                      final ypos = int.tryParse(newYPos);
                      if (ypos != null) {
                        espDataState.updateYPos(ypos);
                      }
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'Enter Y Position'),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _incrementValue(_yposController);
                  },
                  icon: Icon(Icons.arrow_right))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    _incrementValue(_zposController);
                  },
                  icon: Icon(Icons.arrow_left)),
              Expanded(
                child: TextField(
                  controller: _zposController,
                  onChanged: (newZPos) {
                    if (newZPos.trim().isEmpty) {
                      espDataState.updateZPos(
                          0); // Set a default value when input is empty
                    } else {
                      final zpos = int.tryParse(newZPos);
                      if (zpos != null) {
                        espDataState.updateZPos(zpos);
                      }
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'Enter Z Position'),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _incrementValueMin(_zposController);
                  },
                  icon: Icon(Icons.arrow_right))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    espDataState.submitValues();
                  },
                  child: const Text('Submit Value')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    _brightnessController.clear();
                    _xposController.clear();
                    _yposController.clear();
                    _zposController.clear();
                    espDataState.resetValue();
                  },
                  child: const Text('Reset Value')),
            ],
          ),
        ],
      ),
    );
  }
}
