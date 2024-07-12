import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'register_screen.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      // Replace with your validation logic
      if (email == 'tu_correo@institucional.edu.hn' && password == 'tu_numero_de_cuenta') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(email: email)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('tu correo o contraseña es incorrecto')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('Iniciar tu sesión',style: GoogleFonts.vampiroOne(fontSize: 20),)),
        
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Correo'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Iniciar sesión'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text('Registrate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
