import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HybridAccelerometer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HybridAccelerometer extends StatefulWidget {
  const HybridAccelerometer({super.key});

  @override
  State<HybridAccelerometer> createState() => _HybridAccelerometerState();
}

class _HybridAccelerometerState extends State<HybridAccelerometer> {
  double x = 0, y = 0, z = 0;

  @override
  void initState() {
    super.initState();

    // 📱 CELULAR: acelerômetro real
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      accelerometerEventStream().listen((event) {
        setState(() {
          x = event.x;
          y = event.y;
          z = event.z; // ✔ Z REAL aqui
        });
      });
    }
  }

  void _onMouseMove(PointerEvent event) {
    setState(() {
      x = event.delta.dx;
      y = event.delta.dy;

      // 🖱️ SIMULAÇÃO DO Z (intensidade do movimento)
      z = (event.delta.dx.abs() + event.delta.dy.abs());
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile =
        !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    return Scaffold(
      appBar: AppBar(
        title: Text(isMobile
            ? 'Acelerômetro Real'
            : 'Acelerômetro Simulado'),
      ),
      body: Listener(
        onPointerMove: isMobile ? null : _onMouseMove,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isMobile
                    ? 'Incline o celular'
                    : 'Movimente o mouse',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              Text('X: ${x.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 22)),
              Text('Y: ${y.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 22)),
              Text('Z: ${z.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 22)),

              const SizedBox(height: 20),
              Text(
                isMobile
                    ? 'Z real do acelerômetro'
                    : 'Z simulado = intensidade do mouse',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}