import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importa el paquete de Google Fonts

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
        textTheme: GoogleFonts.robotoTextTheme(), // Usa Roboto como fuente predeterminada
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
        title: Text(
          widget.title,
          style: GoogleFonts.roboto(), // Aplica Roboto al título del AppBar
        ),
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
              title: Text(
                'Contactar usuario',
                style: GoogleFonts.roboto(color: Colors.blue), // Aplica Roboto al texto
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.alarm, color: Colors.blue),
              title: Text(
                'Hacer sonar el bastón',
                style: GoogleFonts.roboto(color: Colors.blue), // Aplica Roboto al texto
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.emergency, color: Colors.blue),
              title: Text(
                'Llamar emergencia',
                style: GoogleFonts.roboto(color: Colors.blue), // Aplica Roboto al texto
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/mapa_fondo.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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