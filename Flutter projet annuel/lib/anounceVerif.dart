import 'package:flutter/material.dart';
import 'addAdmin.dart';
import 'adminList.dart';
import 'annonceItems.dart';
import 'class/annonces.dart';
import 'home.dart';
import 'services/apiService.dart';
import 'usersVerif.dart';
import 'verifCateg.dart';


class AnnounceVerif extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Vérification d\'annonces'),
          leading: Image.asset('assets/images/LOGO_BENEVOLD.png', height: 40),
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
              icon: const Icon(Icons.amp_stories_rounded),
              tooltip: 'Vérifier les categories',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        ListCateg()
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
                'Toutes les annonces :',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
              ),
            ),
          ),
          FutureBuilder(
            future: ApiServices.getAnnonces(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  }
                  if (snapshot.hasData) {
                    final List<Annonce> annonces = snapshot.data;
                    if (annonces.isEmpty) {
                      return Center(
                        child: Text("Empty list"),
                      );
                    }
                    return SizedBox(
                      height: 1000,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(500, 50, 500, 0),
                        child: ListView.builder(
                          itemCount: annonces.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnnonceItems(
                              annonce: annonces[index],
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("No data"),
                    );
                  }
                  break;
                default:
                  return Container();
                  break;
              }
            },
          )
        ],
      ),
    );
  }}