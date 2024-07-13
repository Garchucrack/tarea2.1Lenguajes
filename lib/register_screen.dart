
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final phone = _phoneController.text;
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Las contraseñas no coinciden')));
      } else {
       
        print('Nombre: $name');
        print('Correo: $email');
        print('Teléfono: $phone');
        print('Contraseña: $password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: SingleChildScrollView( 
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  } else if (value.length < 3 || value.length > 10) {
                    return 'El nombre debe tener entre 3 y 10 caracteres';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Correo'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa tu correo';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value) || !value.endsWith('.edu.hn')) {
                    return 'Por favor ingresa un correo válido que termine en .edu.hn';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Teléfono'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa tu teléfono';
                  } else if (!RegExp(r'^[39]\d{7}$').hasMatch(value)) {
                    return 'El teléfono debe comenzar con 3 o 9 y tener exactamente 8 dígitos';
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
                  } else if (value.length < 8 || !RegExp(r'^(?=.*[A-Z])(?=.*\W)').hasMatch(value)) {
                    return 'La contraseña debe tener al menos 8 caracteres, incluyendo una mayúscula y un carácter especial';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor confirma tu contraseña';
                  } else if (value != _passwordController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
