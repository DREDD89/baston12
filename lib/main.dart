import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bastón Inteligente',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6d3acf)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bastón Inteligente'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isBotonBastonPressed = false;
  bool _isBotonEmergenciaPressed = false;

  void _toggleBotonBaston() {
    setState(() {
      _isBotonBastonPressed = !_isBotonBastonPressed;
    });
  }

  void _toggleBotonEmergencia() {
    setState(() {
      _isBotonEmergenciaPressed = !_isBotonEmergenciaPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6d3acf),
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          // Imagen de fondo que simula un mapa
          Center(
            child: Image.asset(
              'assets/mapa_fondo.jpg', // Cambia esto por la ruta de tu imagen
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Botones en la parte inferior
          Positioned(
            bottom: 50, // Margen inferior
            left: 20, // Margen izquierdo
            right: 20, // Margen derecho
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botón para hacer sonar el bastón
                GestureDetector(
                  onTap: _toggleBotonBaston,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.volume_up,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                ),
                // Botón de emergencia
                GestureDetector(
                  onTap: _toggleBotonEmergencia,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.contacts,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}