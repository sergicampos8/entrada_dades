import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Entrada de Datos by Sergi Campos'),
        ),
        body: InputValueWidget(),
      ),
    );
  }
}

class InputValueWidget extends StatefulWidget {
  @override
  _InputValueWidgetState createState() => _InputValueWidgetState();
}

class _InputValueWidgetState extends State<InputValueWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  String inputValue = "";

  void _showDialog(BuildContext context, String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Valor Ingresado'),
          content: Text(value),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(labelText: 'Ingrese un valor'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                inputValue = _textEditingController.text; // Actualiza inputValue con el texto ingresado
              });
              _showDialog(context, inputValue);
            },
            child: const Text('Mostrar Diálogo Alerta'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: const Text('Valor Ingresado'),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(inputValue),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Mostrar Diálogo Simple'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AboutDialog(
                    applicationName: 'Valor Ingresado',
                    applicationVersion: inputValue,
                    children: const <Widget>[
                      Text('Este es el valor ingresado por el usuario.'),
                    ],
                  );
                },
              );
            },
            child: const Text('Mostrar Diálogo Acerca de'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
