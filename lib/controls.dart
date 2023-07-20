// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:circle_button/circle_button.dart';
import 'package:digimicapp/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class newControlPanel extends StatelessWidget {
  const newControlPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final espDataState = Provider.of<ESPdataState>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_left)),
              Expanded(
                child: TextField(
                  onChanged: (newBrightness) {
                    if (newBrightness.trim().isEmpty) {
                      espDataState.updateBrightness(
                          0); // Set a default value when input is empty
                    } else {
                      final brightness = int.tryParse(newBrightness);
                      if (brightness != null) {
                        espDataState.updateBrightness(brightness);
                      }
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'Enter Brightness'),
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_left)),
              Expanded(
                child: TextField(
                  onChanged: (newXPos) {
                    if (newXPos.trim().isEmpty) {
                      espDataState
                          .updateXPos(0); // Set a default value when input is empty
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
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_left)),
              Expanded(
                child: TextField(
                  onChanged: (newYPos) {
                    if (newYPos.trim().isEmpty) {
                      espDataState
                          .updateYPos(0); // Set a default value when input is empty
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
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_left)),
              Expanded(
                child: TextField(
                  onChanged: (newZPos) {
                    if (newZPos.trim().isEmpty) {
                      espDataState
                          .updateZPos(0); // Set a default value when input is empty
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
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right))
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
                    espDataState.resetValue();
                  },
                  child: const Text('Reset Value'))
            ],
          ),
        ],
      ),
    );
  }
}
