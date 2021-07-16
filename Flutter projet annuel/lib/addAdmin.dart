import 'package:flutter/material.dart';
import 'adminList.dart';
import 'home.dart';
import 'usersVerif.dart';


class AddAdmin extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Administration'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Retour',
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    ListAdmin()
            ));
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                'Ajout d\'un admin :',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
              ),
            ),
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
                        labelText: 'Nom d\'utilisateur',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(150, 30, 150, 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Vous devez entrer une adresse mail';
                        }
                        return null;
                      },
                      controller: mailController,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adresse mail',
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
                    color: Color(0xff113945),
                    child: Text('Valider'),
                    onPressed: () async {


                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }}