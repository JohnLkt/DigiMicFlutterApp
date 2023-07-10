// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:digimicapp/camera.dart';
import 'package:digimicapp/controls.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Example app for Camera Windows plugin.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CameraWindow();
  }

}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [CameraWindow(), ControlPanel()],
    );
  }
}