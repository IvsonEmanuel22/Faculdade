import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const MaterialApp(home: CameraPermissionScreen()));

class CameraPermissionScreen extends StatelessWidget {
  const CameraPermissionScreen({super.key});

  Future<void> _requestCameraPermission(BuildContext context) async {
    
    var status = await Permission.camera.status;

    if (status.isGranted) {
      _showMessage(context, "Permissão já concedida!");
    } else {
  
      var result = await Permission.camera.request();

      if (result.isGranted) {
        _showMessage(context, "Acesso permitido!");
      } else if (result.isPermanentlyDenied) {
      
        openAppSettings();
      } else {
        _showMessage(context, "Acesso negado.");
      }
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Permissão de Câmera")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _requestCameraPermission(context),
          child: const Text("Pedir Acesso à Câmera"),
        ),
      ),
    );
  }
}