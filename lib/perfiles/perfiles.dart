import 'package:flutter/material.dart';

class perfiles extends StatefulWidget {
  static const String route = '/perfiles';
  perfiles({Key? key}) : super(key: key);

  @override
  State<perfiles> createState() => _perfilesState();
}

class _perfilesState extends State<perfiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).shadowColor,
        width: double.infinity,
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView(
              children: <Widget>[
                Image.asset('assets/bannerchivo.png',height: 130,),
                  SizedBox(height: 20,),
                
               TextButton(onPressed: (){}, 
               child: Text('SELECCIONA UN PERFIL',
               
                style: TextStyle
                  (
                 color: Colors.white,
                  ),

               ),
               
               ),
              ],
          )
        ),
      )
    );
  }


 


}