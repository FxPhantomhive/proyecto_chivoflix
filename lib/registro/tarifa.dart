import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proyecto_chivoflix/login/login.dart';
import 'package:proyecto_chivoflix/modelos/usuarios.dart';
import 'package:proyecto_chivoflix/registro/targeta.dart';
import 'package:selectable_container/selectable_container.dart';

bool seleccionado1 = false;
bool seleccionado2 = false;
int tarifa = 0;

class TarifaSelect extends StatefulWidget {
  final String correo;
  final String usuario;
  final String password;
  TarifaSelect({
    Key? key,
    required this.correo,
    required this.usuario,
    required this.password,
  }) : super(key: key);

  @override
  State<TarifaSelect> createState() => _TarifaSelectState();
}

class _TarifaSelectState extends State<TarifaSelect> {
  @override
  Widget build(BuildContext context) {
    //print(widget.correo);
    //print(widget.usuario);
    //print(widget.password);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/bannerchivo.png',
                height: 40,
              ),
              SizedBox(
                width: 50,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).shadowColor,
        width: double.infinity,
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              Text(
                "Seleccione la tarifa",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SelectableContainer(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    width: 200,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(171, 77, 77, 77),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15, left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Plan Mensual",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 148, 148, 148),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "\$7.99 USD",
                              style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 197, 197, 197),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                selected: seleccionado1,
                onValueChanged: (seleccionado) {
                  setState(() {
                    seleccionado1 = seleccionado;
                    seleccionado2 = false;
                    tarifa = 1;
                  });
                },
                selectedBackgroundColor: Colors.black,
                unselectedBackgroundColor: Colors.black,
                selectedBorderColor: Color.fromARGB(255, 14, 0, 216),
                unselectedBorderColor: Color.fromARGB(171, 77, 77, 77),
                marginColor: Colors.black,
                iconAlignment: Alignment.topLeft,
              ),
              SizedBox(
                height: 30,
              ),
              SelectableContainer(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    width: 200,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(171, 77, 77, 77),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15, left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Plan Anual",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 148, 148, 148),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "\$84.99 USD",
                              style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 197, 197, 197),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                selected: seleccionado2,
                onValueChanged: (seleccionado_2) {
                  setState(() {
                    seleccionado2 = seleccionado_2;
                    seleccionado1 = false;
                    tarifa = 2;
                  });
                },
                selectedBackgroundColor: Colors.black,
                unselectedBackgroundColor: Colors.black,
                selectedBorderColor: Color.fromARGB(255, 14, 0, 216),
                unselectedBorderColor: Color.fromARGB(171, 77, 77, 77),
                marginColor: Colors.black,
                iconAlignment: Alignment.topLeft,
              ),
              Text(
                "Ahorras: \$10.88 USD al año con este plan",
                style: TextStyle(
                    color: Color.fromARGB(255, 110, 110, 110), fontSize: 12),
              ),
              SizedBox(
                height: 60,
              ),
              FlatButton(
                onPressed: () {
                  if (seleccionado1 || seleccionado2) {
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: RTargeta(
                                correo: widget.correo,
                                usuario: widget.usuario,
                                password: widget.password,
                                tarifa: tarifa),
                            type: PageTransitionType.scale));
                  } else {
                    print("You shall no pass");
                  }
                },
                child: Text(
                  'Pagar Ahora',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                textColor: Colors.white,
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Universidad Tecnologica de El Salvador',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
