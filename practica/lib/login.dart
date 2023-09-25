import 'package:flutter/material.dart';
import 'package:practica/pagina.dart';
import 'package:practica/registro.dart';


class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Usuario',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 0, 0, 0),
                      ),)
                    ),
                  ),
                  const TextField(
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
                    ElevatedButton(onPressed:(){
                          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Principal()));
                    },
                     child: Text('continuar')),
                 
                  





          






















































                  
                  const SizedBox(height: 150,),
                  ElevatedButton(onPressed:(){
                          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RegScreen()));
                    },
                     child: Text('Crear cuenta :3')),
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