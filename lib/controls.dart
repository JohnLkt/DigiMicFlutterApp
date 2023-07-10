// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.bottomCenter,
          child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
            ElevatedButton(onPressed: (){}, child:
            Text('Create Camera') )
           ],
          ),
        ),
      ),
    );
  }
}