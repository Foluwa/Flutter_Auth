import 'package:flutter/material.dart';
import 'package:flutter_login_page/pages/Auth/LoginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding:
            EdgeInsets.only(top: 80.0, right: 20.0, left: 20.0, bottom: 10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Fantasy',
                style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Create your Account",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 25.0,
              ),
              buildTextField("First Name"),
              SizedBox(
                height: 20.0,
              ),
              buildTextField("Last Name"),
              SizedBox(
                height: 20.0,
              ),
              buildTextField("Email"),
              SizedBox(
                height: 20.0,
              ),
              buildTextField("Password"),
              SizedBox(
                height: 20.0,
              ),
              buildTextField("Confirm Password"),
              SizedBox(height: 40.0),
              buildRegisterBtn(),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account? "),
                      SizedBox(
                        width: 10.0,
                      ),
                      InkWell(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: hintText == "Email"
            ? Icon(Icons.email)
            : hintText == "Password"
                ? Icon(Icons.lock)
                : hintText == "Confirm Password"
                    ? Icon(Icons.lock)
                    : hintText == "First Name" || hintText == "Last Name"
                        ? Icon(Icons.person)
                        : null,
        suffixIcon: hintText == "Password" || hintText == "Confirm Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget buildRegisterBtn() {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.0),
        gradient: LinearGradient(colors: [
          Color(0xFFFB415B),
          Color(0xFFEE5623),
        ], begin: Alignment.centerRight, end: Alignment.centerLeft),
      ),
      child: RaisedButton(
        color: Color(0xFFFB415B),
        elevation: 3.0,
        onPressed: () {
          print('SIGN UP BUTTON');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
