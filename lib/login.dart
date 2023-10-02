// ignore_for_file: unused_element, camel_case_types

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:practica/pagina.dart';
import 'package:practica/registro.dart';
import '../services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

  




 final usernameCrtl = TextEditingController();
  final passwordCrtl = TextEditingController();


class loginScreen extends StatelessWidget {
   const loginScreen({super.key});
   


  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/graphql'),
      headers: {
        'Origin': 'http://localhost:9000',
      },
    );

    if (response.statusCode == 200) {
      print("exito uwu");
    } else {
     print("fracaso");
    }
  }
  
  @override
  Widget build(BuildContext context) {
 final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController_pas = TextEditingController();
    String Users="error";
    String Passwords="error";
       var auth_service=Provider.of<AuthService>(context, listen: false);


   
    return Scaffold
      (

        body: Stack(
                 
      children: [
 
   
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 27, 189, 22),
                 Color.fromARGB(255, 27, 189, 22),
            ]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              'Bienvenido',
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
              color: Color.fromARGB(255, 247, 247, 247),
            ),
            height: double.infinity,
            width: double.infinity,
            child:  Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   TextField(
                  controller:  _textEditingController ,
                   onChanged: (value) {
                Users=value;
              },
                    decoration: InputDecoration(
                      label: Text('Usuario',style: TextStyle(


                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 0, 0, 0),
                      ),)
                    ),
                  ),
                   TextField(
                     controller:  _textEditingController_pas ,
                     onChanged: (value) {
                     Passwords=value;
              },
                    decoration: InputDecoration(
                        label: Text('Contraseña',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Color.fromARGB(255, 0, 0, 0),
                        ),)
                    ),
                  ),















                  const SizedBox(height: 20,),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('olvidaste tu contraseña?',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xff281537),
                    ),),
                  ),


                  const SizedBox(height: 70,),
                    ElevatedButton(onPressed:()  async {
                  auth_service.autenticando = true;
                  final loginOk = await auth_service.login(Users, Passwords);
                  auth_service.autenticando = false;
                    if (loginOk){
                    usernameCrtl.clear();
                    passwordCrtl.clear();
                   // ignore: use_build_context_synchronously
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Principal()));
                    }

                    else {
print("error");

                    }
                      
                    },
                     child: Text('continuar')), 
                     
                  const SizedBox(height: 150,),
                  
                  ElevatedButton(onPressed:() async{
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RegScreen()));
                    },
                     child: Text('Crear cuenta ')),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                     
                      
                    ),
                  ),
                   
                ],
              ),
            ),
          ),
        ),
      ],
    
    ));
  }
}
