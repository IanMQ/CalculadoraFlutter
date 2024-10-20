import 'package:flutter/material.dart';
import 'dart:math';

class vista1 extends StatefulWidget {
  const vista1({super.key});

  @override
  State<vista1> createState() => _vista1State();
}

class _vista1State extends State<vista1> {

  final txtCan = TextEditingController();
  final txtPre = TextEditingController();
  final txtPotencia = TextEditingController();

  late double can, pre;
  double resultado = 0.0;

  void calcularPotencia() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ingrese la potencia'),
          content: TextField(
            controller: txtPotencia,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Potencia',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  double potencia = double.parse(txtPotencia.text);
                  resultado = pow(double.parse(txtCan.text), potencia) as double;
                });
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controles de Formulario'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: txtCan,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingrese número 1',
                labelText: 'Número 1: ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: txtPre,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingrese número 2',
                labelText: 'Número 2: ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                    ),
                    onPressed: () {
                      can = double.parse(txtCan.text);
                      pre = double.parse(txtPre.text);

                      setState(() {
                        resultado = can + pre;
                      });
                    },
                    child: Text(
                      'Sumar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                    ),
                    onPressed: () {
                      can = double.parse(txtCan.text);
                      pre = double.parse(txtPre.text);

                      setState(() {
                        resultado = can - pre;
                      });
                    },
                    child: Text(
                      'Restar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                    ),
                    onPressed: () {
                      can = double.parse(txtCan.text);
                      pre = double.parse(txtPre.text);

                      setState(() {
                        resultado = can * pre;
                      });
                    },
                    child: Text(
                      'Multiplicar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                    ),
                    onPressed: () {
                      can = double.parse(txtCan.text);
                      pre = double.parse(txtPre.text);

                      setState(() {
                        resultado = can / pre;
                      });
                    },
                    child: Text(
                      'Dividir',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
              ),
              onPressed: calcularPotencia,
              child: Text(
                'Potencia',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $resultado',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}