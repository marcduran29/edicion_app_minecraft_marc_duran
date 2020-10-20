import 'package:flutter/material.dart';
import 'dart:async';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minecraft Mobs',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Minecraft Mobs',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog(
        'Zombie',
        'Health: 20',
        'Can yo see with  Iron Sword, Iron Shovel or Random Armor).',
        'https://static.wikia.nocookie.net/minecraft_es_gamepedia/images/c/c3/Zombie.png/revision/latest?cb=20130119023110'))
    ..add(Dog(
        'Skeleton',
        'Health: 20',
        'Natural equipment: Bow (right hand: 89%; left hand: 11%).',
        'https://i.pinimg.com/originals/f4/45/be/f445be6a0cc4d005f316ca5843fd30f9.png'))
    ..add(Dog(
        'Creeper',
        'Health 50',
        'Max normal 64.5 Health / Max Charged 127.5 Health',
        'https://assets.stickpng.com/images/580b57fcd9996e24bc43c2f7.png'))
    ..add(Dog('Spider', 'Health 16', 'Have the unique ability to climb walls',
        'https://static.wikia.nocookie.net/minecraft/images/c/cb/New_Spider_Texture.png/revision/latest/scale-to-width-down/340?cb=20190713102143'))
    ..add(Dog('Enderman', 'Health 40', 'Have the ability to teleport.', 'https://vignette.wikia.nocookie.net/minecraft-realm-factions/images/2/28/Enderman.png/revision/latest/top-crop/width/360/height/450?cb=20180724175501&path-prefix=es'));

  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDogFormPage();
    }));
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                .1,
                .5,
                .7,
                .9
              ],
                  colors: [
                Colors.yellow[200],
                Colors.red[300],
                Colors.orange[300],
                Colors.indigo[300]
              ])),
          child: new Center(
            child: new DogList(initialDoggos),
          )),
    );
  }
}
