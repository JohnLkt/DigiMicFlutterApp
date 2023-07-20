// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:async';
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
          const SizedBox(
            height: 10,
          ),
          TextField(
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
                border: OutlineInputBorder(), labelText: 'Enter Brightness'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
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
                border: OutlineInputBorder(), labelText: 'Enter X Position'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
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
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 199, 197, 197)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                labelText: 'Enter Y Position'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
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
                border: OutlineInputBorder(), labelText: 'Enter Z Position'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                espDataState.submitValues();
              },
              child: const Text('Submit Value')),

          ElevatedButton.icon(
              onPressed: (){
                espDataState.resetValue();
              },
              icon: Icon(Icons.refresh),
              label: Text('Reset Value')
          )
        ],
      ),
    );
  }
}
