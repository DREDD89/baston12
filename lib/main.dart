import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teyankanxool',
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
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF6d3acf),
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: const Text(
                'Contactar usuario',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                // Acción al presionar "Contactar usuario"
                Navigator.pop(context); // Cerrar el menú
              },
            ),
            ListTile(
              leading: const Icon(Icons.alarm, color: Colors.blue),
              title: const Text(
                'Hacer sonar el bastón',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                // Acción al presionar "Hacer sonar el bastón"
                Navigator.pop(context); // Cerrar el menú
              },
            ),
            ListTile(
              leading: const Icon(Icons.emergency, color: Colors.blue),
              title: const Text(
                'Llamar emergencia',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                // Acción al presionar "Llamar emergencia"
                Navigator.pop(context); // Cerrar el menú
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Imagen de fondo que simula un mapa
          Center(
            child: Image.asset(
              'assets/mapa_fondo.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Botones inferiores
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // sonar el bastón
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