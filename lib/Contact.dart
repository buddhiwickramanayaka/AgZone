import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactUs(),
    );
  }
}

class ContactUs extends StatefulWidget {
  ContactUs({Key key}) : super(key: key);
  // final String title = 'Contact Us';

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Future<void> _launched;
  String phoneNumber = '';
  String _launchUrl = 'https://www.doa.gov.lk/index.php/en/';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.green[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 330.0,
              height: 55.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  // side: BorderSide(color: Colors.red, )
                ),
                color: Colors.green[300],
                child: const Text('More Details about Agriculture',
                    style: TextStyle(fontSize: 20)),
                onPressed: () {
                  setState(() {
                    _launched = _launchInBrowser(_launchUrl);
                  });
                },
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 330.0,
              height: 55.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  // side: BorderSide(color: Colors.red)
                ),
                color: Colors.green[300],
                child: const Text('Contact Us on Phone Call',
                    style: TextStyle(fontSize: 20)),
                onPressed: () {
                  setState(() {
                    _launched = _makePhoneCall('tel:0812388331');
                  });
                },
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 330,
              height: 55.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  //side: BorderSide(color: Colors.red)
                ),
                color: Colors.green[300],
                child: const Text('More Details with Videos',
                    style: TextStyle(fontSize: 20)),
                onPressed: () {
                  setState(() {
                    _launched = _launchUniversalLinkIos(
                        'https://www.youtube.com/channel/UCVths0_Dk0LGCSEzDnx9Bsw');
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
