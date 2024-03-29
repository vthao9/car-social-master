import 'dart:convert';
import 'dart:io';
import 'package:car_social/PostPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:dio/adapter.dart';


class VehicleUploadPage extends StatefulWidget{
  State<StatefulWidget> createState(){
    return _VehicleUploadPageState();
  }
}

class _VehicleUploadPageState extends State<VehicleUploadPage>{
  File selectanimage;
  Future getImage() async{
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectanimage = tempImage;
    });
  }

  Future submitForm() async {
//    String url = 'https://dev.sighthoundapi.com/v1/recognition?objectType=vehicle';
//    var client = new http.Client();
//    try{
//      var uriResponse = await client.post(
//        url,
//        headers: {"X-Access-Token": "dssaFfIwfYow8SS5DX9tHLFq2Pe68MxkQab2"},
//        body: {"image": "https://img.autobytel.com/car-reviews/autobytel/11694-good-looking-sports-cars/2016-Ford-Mustang-GT-burnout-red-tire-smoke.jpg"}
//      );
//      print(await client.get(uriResponse.body));
//    }
//    finally {
//      client.close();
//    }
    var body = "base64Encode(selectanimage.readAsBytesSync())";
    var body1 = jsonEncode("https://img.autobytel.com/car-reviews/autobytel/11694-good-looking-sports-cars/2016-Ford-Mustang-GT-burnout-red-tire-smoke.jpg");
    String url = 'https://dev.sighthoundapi.com/v1/recognition?objectType=vehicle';
    final response = await http.put(url,
      headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "dssaFfIwfYow8SS5DX9tHLFq2Pe68MxkQab2"
    },
    body: {
      "image": body1
//      base64Encode(selectanimage.readAsBytesSync())
    },
    );
    if (response.statusCode == 200){
      var responseBody = response.body;
      print("went through");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Choose an Image"),
      ),
      body: new Center(
        child: selectanimage == null? Text("Select an Image"): enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: getImage, tooltip: "Add Image", child: new Icon(Icons.add_a_photo),),
    );
  }
  Widget enableUpload(){
    return Container(
      child: new Form(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Image.file(selectanimage, width: 550, height: 250,),
            SizedBox(height: 15,),
            RaisedButton(
              elevation: 10,
              child: Text("Add"),
              textColor: Colors.white,
              color: Colors.tealAccent,
              onPressed: submitForm,
            )
          ],
        ),
      ),
    );
  }
}
