import 'package:flutter/material.dart';
import 'addAdmin.dart';
import 'adminList.dart';
import 'home.dart';
import 'usersVerif.dart';


class AnnounceVerif extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Vérification d\'annonces'),
          leading: Image.asset('assets/images/benevold.png', height: 40),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: 'Accueil',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        HomePage()
                ));
              },
            ),
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
                'Listes des annonces :',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }}