import 'package:flutter/material.dart';
import 'package:food_delivery/Application/controller.dart';
import 'package:food_delivery/Application/model/form.dart';
import 'package:food_delivery/main.dart';

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController cropTypeController = TextEditingController();
  TextEditingController landAreaController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      FeedbackForm feedbackForm = FeedbackForm(
        emailController.text,
        mobileNoController.text,
        cropTypeController.text,
        landAreaController.text,
        discriptionController.text,
      );

      FormController formController = FormController((String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          //
          _showSnackbar("Request Submitted");
        } else {
          _showSnackbar("Error Occurred!");
        }
      });

      _showSnackbar("Submitting Request");

      // Submit 'feedbackForm' and save it in Google Sheet

      formController.submitForm(feedbackForm);
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Valid Email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    TextFormField(
                      controller: mobileNoController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Valid Phone Number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Phone Number"),
                    ),
                    TextFormField(
                      controller: cropTypeController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Valid Crop Type";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Crop Type"),
                    ),
                    TextFormField(
                      controller: landAreaController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Valid Land Area";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Land Area"),
                    ),
                    TextFormField(
                      controller: discriptionController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Valid Discription";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Discription"),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: _submitForm,
                          child: Text('Submit Order'),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text(
                            "Cancel",
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Home();
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}