import 'dart:math';
import 'package:digimicapp/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({
    super.key,
  });

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  

  @override
  Widget build(BuildContext context) {

    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          CoordinateDisplay(),
          SizedBox(height: 40),
          Dpads(),
          SizedBox(height: 40),
          BrightnessSlider(),
          MultiplierSlider()
        ],
      ),
    );
  }
}

class CoordinateDisplay extends StatelessWidget {
  const CoordinateDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final digimicState = Provider.of<DigimicState>(context);
    return Wrap(
      spacing: 20,
      children: [
        Text("X Position: ${digimicState.xpos}"),
        Text("Y Position: ${digimicState.ypos}"),
        Text("Z Position: ${digimicState.zpos}"),
      ],
    );
  }
}

class Dpads extends StatefulWidget {
  const Dpads({super.key});

  @override
  State<Dpads> createState() => _DpadsState();
}

class _DpadsState extends State<Dpads> {
  @override
  Widget build(BuildContext context) {
    final digimicState = Provider.of<DigimicState>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // vertical Dpads
        Column(
          children: [
            IconButton(
              iconSize: 60,
              tooltip: '+Z',
              onPressed: () {
                if (digimicState.doingTask) {
                  null;
                } else {
                  digimicState.movePositiveZ();
                }
              }, 
              icon: const Icon(Icons.arrow_drop_up)
            ),
            const SizedBox(
              height: 60,
              width: 60,
            ),
            IconButton(
              iconSize: 60,
              tooltip: '-Z',
              onPressed: () {
                if (digimicState.doingTask) {
                  null;
                } else {
                  digimicState.moveNegativeZ();
                }
              }, 
              icon: const Icon(Icons.arrow_drop_down)
            ),
          ],
        ),
        // horizontal Dpads
        Row(
          children: [
            Column(
              children: [
                IconButton(
                  iconSize: 60,
                  tooltip: '-X',
                  onPressed: () {
                    if (digimicState.doingTask) {
                      null;
                    } else {
                      digimicState.moveNegativeX();
                    }
                  },  
                  icon: const Icon(Icons.arrow_left)
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  iconSize: 60,
                  tooltip: '+Y',
                  onPressed: () {
                    if (digimicState.doingTask) {
                      null;
                    } else {
                      digimicState.movePositiveY();
                    }
                  },  
                  icon: const Icon(Icons.arrow_drop_up)
                ),
                const SizedBox(
                  height: 60,
                  width: 60,
                ),
                IconButton(
                  iconSize: 60,
                  tooltip: '-Y',
                  onPressed: () {
                    if (digimicState.doingTask) {
                      null;
                    } else {
                      digimicState.moveNegativeY();
                    }
                  },  
                  icon: const Icon(Icons.arrow_drop_down)
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  iconSize: 60,
                  tooltip: '+X',
                  onPressed: () {
                    if (digimicState.doingTask) {
                      null;
                    } else {
                      digimicState.movePositiveX();
                    }
                  },  
                  icon: const Icon(Icons.arrow_right)
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class BrightnessSlider extends StatefulWidget {
  const BrightnessSlider({super.key});

  @override
  State<BrightnessSlider> createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  double currentSliderBrightness = 0;
  @override
  Widget build(BuildContext context) {
    final digimicState = Provider.of<DigimicState>(context);
    return Column(
      children: [
        Text("Brightness: ${digimicState.brightness}"),
        Slider(
          value: currentSliderBrightness, 
          max: 255,
          label: currentSliderBrightness.round().toString(),
          onChanged: (double value) {
            // update label value locally
            setState(() {
              currentSliderBrightness = value;
            });
            // update global state value
            digimicState.updateBrightness(value.round());
          }
        ),
      ],
    );
  }
}

class MultiplierSlider extends StatefulWidget {
  const MultiplierSlider({super.key});

  @override
  State<MultiplierSlider> createState() => _MultiplierSliderState();
}

class _MultiplierSliderState extends State<MultiplierSlider> {
  double currentSliderMultiplier = 0;
  @override
  Widget build(BuildContext context) {
    final digimicState = Provider.of<DigimicState>(context);
    return Column(
      children: [
        Text("Multiplier: ${digimicState.multiplier}"),
        Slider(
          value: currentSliderMultiplier, 
          max: 3,
          divisions: 3,
          label: pow(10, currentSliderMultiplier.round()).toString(),
          onChanged: (double value) {
            // update label value locally
            setState(() {
              currentSliderMultiplier = value;
            });
            // update global state value
            digimicState.updateMultiplier(pow(10, currentSliderMultiplier.round()).round());
          }
        ),
      ],
    );
  }
}