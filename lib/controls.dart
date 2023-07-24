import 'package:digimicapp/model.dart';
import 'package:digimicapp/staticclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'component/slide.dart';

class newControlPanel extends StatefulWidget {
  const newControlPanel({super.key});

  @override
  State<newControlPanel> createState() => _newControlPanelState();
}

class _newControlPanelState extends State<newControlPanel> {
  int indexTop = 0;
  double valueBottom = 20;
  TextEditingController _brightnessController =
      TextEditingController(text: '0');
  TextEditingController _xposController = TextEditingController(text: '0');
  TextEditingController _yposController = TextEditingController(text: '0');
  TextEditingController _zposController = TextEditingController(text: '0');

  void _incrementValue(TextEditingController controller, int maxValue) {
    final int currentValue = int.tryParse(controller.text) ?? 0;
    final int newValue = currentValue + Variable.slidervalue;
    if (newValue <= maxValue) {
      controller.text = newValue.toString();
    } else {
      controller.text = maxValue.toString();
    }
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  void _incrementValueMin(TextEditingController controller, int minValue) {
    final int currentValue = int.tryParse(controller.text) ?? 0;
    final int newValue = currentValue - Variable.slidervalue;
    if (newValue >= minValue) {
      controller.text = newValue.toString();
    } else {
      controller.text = minValue.toString();
    }
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
                  _incrementValueMin(_brightnessController, 0);
                  final brightness = int.tryParse(_brightnessController.text);
                  if (brightness != null) {
                    espDataState.updateBrightness(brightness);
                  }
                },
                icon: Icon(Icons.arrow_left),
              ),
              Expanded(
                child: TextField(
                  controller: _brightnessController,
                  onChanged: (newBrightness) {
                    if (newBrightness.trim().isEmpty) {
                      espDataState.updateBrightness(0);
                    } else {
                      final brightness = int.tryParse(newBrightness);
                      if (brightness != null) {
                        espDataState.updateBrightness(brightness);
                      }
                    }
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Enter Brightness',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _incrementValue(_brightnessController,
                      255); // Replace 100 with your max value
                  final brightness = int.tryParse(_brightnessController.text);
                  if (brightness != null) {
                    espDataState.updateBrightness(brightness);
                  }
                },
                icon: Icon(Icons.arrow_right),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _incrementValueMin(_xposController, 0);
                  espDataState
                      .updateXPos(int.tryParse(_xposController.text) ?? 0);
                },
                icon: Icon(Icons.arrow_left),
              ),
              Expanded(
                child: TextField(
                  controller: _xposController,
                  onChanged: (newXPos) {
                    if (newXPos.trim().isEmpty) {
                      espDataState.updateXPos(0);
                    } else {
                      final xpos = int.tryParse(newXPos);
                      if (xpos != null) {
                        espDataState.updateXPos(xpos);
                      }
                    }
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Enter X Position',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _incrementValue(
                      _xposController, 6000); // Replace 100 with your max value
                  espDataState
                      .updateXPos(int.tryParse(_xposController.text) ?? 0);
                },
                icon: Icon(Icons.arrow_right),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _incrementValueMin(_yposController, 0);
                  espDataState
                      .updateYPos(int.tryParse(_yposController.text) ?? 0);
                },
                icon: Icon(Icons.arrow_left),
              ),
              Expanded(
                child: TextField(
                  controller: _yposController,
                  onChanged: (newYPos) {
                    if (newYPos.trim().isEmpty) {
                      espDataState.updateYPos(0);
                    } else {
                      final ypos = int.tryParse(newYPos);
                      if (ypos != null) {
                        espDataState.updateYPos(ypos);
                      }
                    }
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Enter Y Position',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _incrementValue(
                      _yposController, 6000); // Replace 100 with your max value
                  espDataState
                      .updateYPos(int.tryParse(_yposController.text) ?? 0);
                },
                icon: Icon(Icons.arrow_right),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _incrementValueMin(_zposController, 0);
                  espDataState
                      .updateZPos(int.tryParse(_zposController.text) ?? 0);
                },
                icon: Icon(Icons.arrow_left),
              ),
              Expanded(
                child: TextField(
                  controller: _zposController,
                  onChanged: (newZPos) {
                    if (newZPos.trim().isEmpty) {
                      espDataState.updateZPos(0);
                    } else {
                      final zpos = int.tryParse(newZPos);
                      if (zpos != null) {
                        espDataState.updateZPos(zpos);
                      }
                    }
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Enter Z Position',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _incrementValue(
                      _zposController, 6000); // Replace 100 with your max value
                  espDataState
                      .updateZPos(int.tryParse(_zposController.text) ?? 0);
                },
                icon: Icon(Icons.arrow_right),
              ),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  espDataState.submitValues();
                },
                child: const Text('Submit Value'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _brightnessController.clear();
                  _xposController.clear();
                  _yposController.clear();
                  _zposController.clear();
                  espDataState.resetValue();
                },
                child: const Text('Reset Value'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
