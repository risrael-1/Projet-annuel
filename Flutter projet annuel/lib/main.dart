import 'package:flutter/material.dart';

import 'home.dart';

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
        primarySwatch: Colors.green,
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
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  child: Image.asset('assets/images/benevold.png', height: 100),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(150, 30, 150, 20),
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
                          padding: EdgeInsets.fromLTRB(150, 10, 150, 20),
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
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.green,
                          child: Text('Valider'),
                          onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage()
                              ));


                          },
                        ),
                      )),
                ),
              ],
            )));
  }
}
