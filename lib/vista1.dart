import 'package:flutter/material.dart';

class vista1 extends StatefulWidget {
  const vista1({super.key});

  @override
  State<vista1> createState() => _vista1State();
}

class _vista1State extends State<vista1> {

  final txtCan=TextEditingController();
  final txtPre=TextEditingController();

  late double can,pre;
  double sub=0.0, igv=0.0, total=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Trabajando con setState'),
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
                hintText: 'Ingrese Cantidad',
                labelText: 'Cantidad: ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            
            TextFormField(
              controller: txtPre,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingrese Precio',
                labelText: 'Precio: ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent)
                      ),
                      onPressed: (){
                        can=double.parse(txtCan.text);
                        pre=double.parse(txtPre.text);

                        setState(() {
                          sub=can*pre;
                          igv=sub*0.18;
                          total=sub+igv;
                        });

                      },
                      child: Text('Calcular Compra',style:
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),)
                    )
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Text('Subtotal: $sub',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),),

            SizedBox(
              height: 20,
            ),

            Text('Igv: $igv',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),),

            SizedBox(
              height: 20,
            ),

            Text('Total: $total',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),),



          ],
        ),
      ),

    );
  }
}












