import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/const/themeColor.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(60),
              width: 450,
              decoration: new BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: new AssetImage(
                    'assets/foodtukk.png',
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            SizedBox(height: 80),
            Container(
              decoration: BoxDecoration(
                  color: Themes.color,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(blurRadius: 2.0, color: Themes.color)]),
              width: 245,
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.user,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        'Sign in as User',
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signin');
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Themes.color,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(blurRadius: 2.0, color: Themes.color)]),
              width: 245,
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.moped,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Sign in as Seller',
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/rlogin');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
