import 'package:flutter/material.dart';
import 'package:practica/login.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:practica/pagina.dart';
import 'package:practica/registro.dart';
import '../services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class RegScreen extends StatelessWidget {
  RegScreen({Key? key}) : super(key: key);

  var username = TextEditingController(text: "");
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authService=Provider.of<AuthService>(context, listen: false);

    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 36, 184, 23),
                  Color.fromARGB(255, 7, 86, 190),
                ]),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Crear cuenta ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                height: double.infinity,
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: username,
                        decoration: InputDecoration(
                            label: Text('Nombre de usuario',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color.fromARGB(255, 0, 0, 0),
                            ),)
                        ),
                      ),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                            label: Text('Correo electronico ',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color.fromARGB(255, 0, 0, 0),
                            ),)
                        ),
                      ),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                            label: Text('Contraseña',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color.fromARGB(255, 2, 2, 2),
                            ),)
                        ),
                      ),
                      TextField(
                        controller: confirmPassword,
                        decoration: InputDecoration(
                            label: Text('Repita la contraseña ',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color.fromARGB(255, 7, 7, 7),
                            ),)
                        ),
                      ),

                      const SizedBox(height: 10,),
                      const SizedBox(height: 70,),
                       ElevatedButton(onPressed:() async {
                        await authService.register(email.text, username.text, password.text);
                        print("crear cuenta");
                          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const loginScreen()));
                    },
                     child: Text('Crear cuenta ')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}