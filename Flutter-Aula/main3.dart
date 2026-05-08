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
      home: MotionDetector(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MotionDetector extends StatefulWidget {
  const MotionDetector({super.key});

  @override
  State<MotionDetector> createState() => _MotionDetectorState();
}

class _MotionDetectorState extends State<MotionDetector> {
  double x = 0, y = 0, z = 0;
  bool movimentoDetectado = false;

  bool get isMobile =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  @override
  void initState() {
    super.initState();

   
    if (isMobile) {
      accelerometerEventStream().listen((event) {
        setState(() {
          x = event.x;
          y = event.y;
          z = event.z;

          _checkMotion();
        });
      });
    }
  }


  void _onMouseMove(PointerEvent event) {
    setState(() {
      x = event.delta.dx;
      y = event.delta.dy;
      z = (event.delta.dx.abs() + event.delta.dy.abs());

      _checkMotion();
    });
  }

  void _checkMotion() {
    if (x.abs() > 8 || y.abs() > 8 || z > 15) {
      movimentoDetectado = true;
    } else {
      movimentoDetectado = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detector de Movimento'),
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

              Text('X: ${x.toStringAsFixed(2)}'),
              Text('Y: ${y.toStringAsFixed(2)}'),
              Text('Z: ${z.toStringAsFixed(2)}'),

              const SizedBox(height: 30),

              Text(
                movimentoDetectado
                    ? ' MOVIMENTO DETECTADO'
                    : ' Sem movimento',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: movimentoDetectado
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}