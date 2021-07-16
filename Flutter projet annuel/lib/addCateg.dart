import 'package:flutter/material.dart';
import 'verifCateg.dart';


class AddCateg extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Categories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Retour',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    ListCateg()
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
                'Ajouter une categorie :',
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
                          return 'Entrer le nom de votre categorie';
                        }
                        return null;
                      },
                      controller: nameController,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Entrer le nom de votre categorie',
                      ),
                    ),
                  ),
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