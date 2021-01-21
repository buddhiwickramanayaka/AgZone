import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Agzone/const/themeColor.dart';
import '../services/crud.dart';

class PlantHome extends StatefulWidget {
  @override
  _PlantHomeState createState() => _PlantHomeState();
}

class _PlantHomeState extends State<PlantHome> {
  String name;
  String plantName;
  String amount;
  String email;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    crudMethods crudObj = new crudMethods();

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 70.0),
              Container(
                color: Colors.white10,
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AddDetails',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 45),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Container(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.url,
                  style: TextStyle(fontFamily: 'Raleway', color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Image Url",
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    this.imageUrl = value;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.text,
                  maxLength: 25,
                  style: TextStyle(fontFamily: 'Raleway', color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Seller Name",
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    this.name = value;
                  },
                ),
              ),
              Container(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.text,
                  maxLength: 15,
                  style: TextStyle(fontFamily: 'Raleway', color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    this.plantName = value;
                  },
                ),
              ),
              Container(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 5,
                  style: TextStyle(fontFamily: 'Raleway', color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Amount",
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    this.amount = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Themes.color,
                    onPressed: () {
                      Map<String, dynamic> restaurantData = {
                        'Name': this.name,
                        'plantName': this.plantName,
                        'amount': this.amount,
                        'imageUrl': this.imageUrl,
                      };
                      crudObj.addData(restaurantData).then((result) {
                        dialogTrigger(context);
                      }).catchError((e) {
                        print(e);
                      });
                    },
                    elevation: 4.0,
                    splashColor: Colors.green,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.of(context)
                            .pushReplacementNamed('\firstpage');
                      }).catchError((e) {
                        print(e);
                      });
                    },
                    elevation: 4.0,
                    splashColor: Colors.red,
                    child: Text(
                      'LogOut',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> dialogTrigger(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('done !', style: TextStyle(fontSize: 22.0)),
          content: Text(
            'Added Successfully',
            style: TextStyle(fontSize: 20.0),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Alright',
                style: TextStyle(fontSize: 18),
              ),
              textColor: Themes.color,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
