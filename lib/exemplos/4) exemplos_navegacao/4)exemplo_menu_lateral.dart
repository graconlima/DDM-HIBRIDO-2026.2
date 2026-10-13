import 'package:flutter/material.dart';

void main(){
  runApp(MinhaWidget());
}

class MinhaWidget extends StatelessWidget{
  Widget build(BuildContext bc){
    return MaterialApp(
        title: "Ola Mundo!",
        home: Scaffold(
            appBar: AppBar(title: Text("Ola")),
            body: Center(child: Text("Mundo")),
            drawer: Drawer(
                child: ListView(
                    children: [
                      DrawerHeader(child: Text("Menu Lateral"), ),
                      ListTile(tileColor: Color.fromARGB(255, 100, 100, 0), leading: Icon(Icons.ac_unit), title: Text("Menu1"), onTap: (){print("Menu1");} ),
                      ListTile(title: Text("Menu2"), onTap: (){print("Menu2");} ),
                      ListTile(title: Text("Menu3"), onTap: (){print("Menu3");} )
                    ]
                )
            )
        )
    );
  }
}