// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unnecessary_new, must_be_immutable

import 'dart:async';
// import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Flutter Apps'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
    ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FlutterLogo(size: 30)
    );
  }
}
@immutable
class SecondScreen extends StatelessWidget {
  var dataMusic = [
    {
      'title':"Still Loving You",
      'album':"scorpion"
    },
    {
      'title':"Wind Of Change",
      'album':"scorpion"
    },
    {
      'title':"Wind Of Change",
      'album':"scorpion"
    },
    {
      'title':"Wind Of Change",
      'album':"scorpion"
    },
    {
      'title':"Wind Of Change",
      'album':"scorpion"
    },
    {
      'title':"Wind Of Change",
      'album':"scorpion"
    },
    {
      'title':"Wind Of Change",
      'album':"scorpion"
    },
    {
      'title':"Wind Of Change",
      'album':"scorpion"
    },
    {
      'title':"Wind Of Change",
      'album':"scorpion"
    },
    {
      'title':"Wind Of Change",
      'album':"scorpion"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.home), onPressed: null),
        title: Text('My Flutter Apps'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thankyou for clicking the alert...')));
            },
            icon: const Icon(Icons.add_alert)),
        ],
      ),


      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: dataMusic.length,
                itemBuilder: (context, index){
                    return new Card(
                      color: Colors.blue,
                      child: new Column(
                        children: <Widget>[
                          new ListTile(
                            leading: Icon(Icons.album, size: 50),
                            title: Text(dataMusic[index]['title'].toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            subtitle: Text(dataMusic[index]['album'].toString()),
                          )
                       ],
                      ),
                    );
                }
                ),
            )
           ],
          ),
      ),


      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage()));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Booking'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop, color: Colors.blue),
            label: 'Shop')
        ],
      ), 
    );
  }
}

class FormPage extends StatelessWidget{
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Form"),
          actions: <Widget>[
            // IconButton(
            //   onPressed: null, 
            //   icon: Icon(Icons.cancel_outlined, color: Colors.white, size:30)
            // ),
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              icon: Icon(Icons.check, color: Colors.white, size: 30)
            ),
            
          ],
        ),

        body: null,

        // floatingActionButton: FloatingActionButton(child: ,),
      );
  }
}

class CustomCard extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Card(
        child: new Column(
          children: <Widget>[
           new ListTile(
                  leading: Icon(Icons.album, size: 50),
                  title: Text('Wind of Change', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  subtitle: Text('Scorpions'),
            )
          ],
        ),
    );
  }
}
