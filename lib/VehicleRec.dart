import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:car_social/VehicleUpload.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:car_social/Authen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'CarEvent.dart';
import 'HelpPage.dart';
import 'PostPage.dart';
import 'SalesPage.dart';
import 'upload.dart';
import 'package:car_social/Posts.dart';
import 'package:car_social/Comment.dart';

class VehicleRecPage extends StatefulWidget{
  VehicleRecPage({
    this.auth,
    this.ifLogout,
  });
  final Authentication auth;
  final VoidCallback ifLogout;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VehicleRecPageState();
  }
}

class _VehicleRecPageState extends State<VehicleRecPage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _logout()async{
    try{
      await widget.auth.SignOut();
      widget.ifLogout();
    }
    catch(a){
      print("Error = " + a.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Car Recognition'),
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('CarSocial Menu'),
              decoration: BoxDecoration(
                color: Colors.tealAccent,
              ),
            ),
            ListTile(
              title: Text('CarFlex Forum'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return new PostPage();
                    })
                );
              },
            ),
            ListTile(
              title: Text('Event Forum'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return new EventPage();
                    })
                );
              },
            ),
            ListTile(
              title: Text('Sales Forum'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return new SalesPage();
                    })
                );
              },
            ),
            ListTile(
              title: Text('Help Forum'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return new HelpPage();
                    })
                );
              },
            ),
            ListTile(
              title: Text('Car Recognition'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return new VehicleRecPage();
                    })
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.teal,
        child: new Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.directions_car),
                  iconSize: 50.0,
                  color: Colors.white,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return new VehicleUploadPage();
                        })
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}