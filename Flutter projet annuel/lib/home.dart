import 'package:flutter/material.dart';
import 'package:flutter_projet_annuel/class/message.dart';
import 'package:flutter_projet_annuel/services/apiService.dart';
import 'adminList.dart';
import 'anounceVerif.dart';
import 'class/user.dart';
import 'message.dart';
import 'usersVerif.dart';
import 'verifCateg.dart';


class HomePage extends StatelessWidget {
  final User userAdmin;
  final Message message;
  final String userToken;

  const HomePage({Key key, this.userAdmin,this.message, this.userToken}) : super(key: key);
  @override

Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Accueil'),
          leading: Image.asset('assets/images/LOGO_BENEVOLD.png', height: 20),
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
                'Tableau de bord',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
              ),
            ),
          ),
          FutureBuilder(
            future: ApiServices.getMessage(),
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
                    final String message = snapshot.data;
                    if (message == null) {
                      return Center(
                        child: Text("Empty list"),
                      );
                    }
                    return Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                            child: Text(
                              message,
                              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
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
          ),

          IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Modifier le message du jour',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        UpdateMessage()
                ));
              }
          ),
          Container(
            margin: EdgeInsets.all(40),
            child: Table(
              defaultColumnWidth: FixedColumnWidth(120.0),
              border: TableBorder.all(
                color: Color(0xff113945),
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
                      Column(children: [Text("3")]),
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


// FutureBuilder(
// future: ApiServices.getNewUsers(),
// builder: (BuildContext context, AsyncSnapshot snapshot) {
// switch (snapshot.connectionState) {
// case ConnectionState.waiting:
// return Center(
// child: CircularProgressIndicator(),
// );
// break;
// case ConnectionState.done:
// if (snapshot.hasError) {
// return Column(
// children: [Text("Error: ${snapshot.error}")],
// );
// }
// if (snapshot.hasData) {
// print(snapshot.data);
// final int newUsers = snapshot.data;
// print(newUsers)
// return Column(
// children: [Text(newUsers.toString())]
// );
// } else {
// return Column(
// children: [Text("No data")],
// );
// }
// break;
// default:
// return Container();
// break;
// }
// },
// ),