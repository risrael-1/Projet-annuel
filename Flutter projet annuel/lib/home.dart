import 'package:flutter/material.dart';
import 'package:flutter_projet_annuel/addAdmin.dart';
import 'adminList.dart';
import 'anounceVerif.dart';
import 'main.dart';
import 'usersVerif.dart';


class HomePage extends StatelessWidget {
  @override

Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Accueil'),
          leading: Image.asset('assets/images/benevold.png', height: 20),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.admin_panel_settings),
              tooltip: 'Liste des admins',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        ListAdmin()
                ));
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_box),
              tooltip: 'Vérifier les utilisateurs',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        AccountVerif()
                ));
              },
            ),
            IconButton(
              icon: const Icon(Icons.analytics_sharp),
              tooltip: 'Vérifier les annonces',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        AnnounceVerif()
                ));

              },
            ),
            IconButton(
              icon: const Icon(Icons.settings_power),
              tooltip: 'Déconnexion',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signin');
              },
            )
          ]
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                'Tableau de bord :',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(40),
            child: Table(
              defaultColumnWidth: FixedColumnWidth(120.0),
              border: TableBorder.all(
                color: Colors.green,
                style: BorderStyle.solid,
                width: 2
              ),
              children: [
                TableRow(
                  children: [
                    Column(children: [Text("Nouveau utilisateurs", style: TextStyle(fontSize: 20.0))]),
                    Column(children: [Text("Prestataire", style: TextStyle(fontSize: 20.0))]),
                    Column(children: [Text("Client", style: TextStyle(fontSize: 20.0))]),
                    Column(children: [Text("Nombre d'annonces", style: TextStyle(fontSize: 20.0))]),
                    Column(children: [Text("Nombre de presta réussi", style: TextStyle(fontSize: 20.0))]),
                  ]
                ),
                TableRow(
                    children: [
                      Column(children: [Text("42")]),
                      Column(children: [Text("23")]),
                      Column(children: [Text("19")]),
                      Column(children: [Text("35")]),
                      Column(children: [Text("10")]),
                    ]
                )
              ],
            ),
          )
        ],
      ),
    );
  }}