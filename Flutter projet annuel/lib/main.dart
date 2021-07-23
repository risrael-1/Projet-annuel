import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'services/apiService.dart';


var loginUser;

void main() {
  runApp(MyApp());
}

void displayDialog(BuildContext context, String title, String text) =>
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
              title: Text(title),
              content: Text(text)
          ),
    );

Future<String> attemptLogIn(String email, String password) async {
  var res = await http.post(
      Uri.parse("https://benevold.herokuapp.com/flutter/signin/admin"),
      body: {
        "email": email,
        "password": password
      }
  );
  if(res.statusCode == 200) return res.body;
    return null;
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/signin',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/signin': (_) => MyHomePage(),
      },
      title: 'BenevOld',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFFC7EAF6),
      ),
      home: MyHomePage(title: 'BenevOld'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BenevOld')),
          automaticallyImplyLeading: false
        ),
        body: Padding(
            padding: EdgeInsets.all(50),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Connexion',
                      style: TextStyle(
                          color: Color(0xff113945),
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  child: Image.asset('assets/images/LOGO_BENEVOLD.png', height: 100),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(400, 30, 400, 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Vous devez entrer un votre pseudo';
                              }
                              return null;
                            },
                            controller: nameController,

                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nom d\'utilisateur / Adresse e-mail',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(400, 10, 400, 20),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Vous devez entrer un mot de passe';
                              }
                              if (input.length < 3) {
                                return 'Votre mot de passe est trop petit';
                              } else if (input.length > 18) {
                                return 'Votre mot de passe est trop grand';
                              }
                              return null;
                            },
                            obscureText: true,
                            controller: passwordController,

                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Mot de passe',
                            ),
                          ),
                        )
                      ],
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Center(
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blueGrey,
                          child: Text('Valider'),
                          onPressed: () async {
                            if(nameController.text == "" || passwordController.text == ""){
                              Fluttertoast.showToast(
                                msg: "Veuillez renseigner tous les champs",
                                timeInSecForIosWeb: 2,
                              );
                            }
                            else {
                              loginUser = nameController.text;
                              ApiServices.login(
                                  nameController.text, passwordController.text
                              );


                              String A = "Connexion échouée veuillez verifier vos identifiants" ;
                              String B = "Connexion réussie" ;

                              Timer(Duration(seconds: 1), () {

                                var logsuccess = ApiServices.loginsuccess;

                                // false pour tester avec des id bidons
                                if (logsuccess){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(userToken: null, userAdmin: null)
                                  ));
                                  Fluttertoast.showToast(
                                    msg: B ,
                                    timeInSecForIosWeb: 2,
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: A ,
                                    timeInSecForIosWeb: 2,
                                  );
                                }


                              });

                            }
                            //logIn(context, nameController, passwordController);

                          },
                        ),
                      )),
                ),
              ],
            )));
  }
}
