import 'package:flutter/material.dart';
import 'package:web_demo/Screen/Home_Screen.dart';
import 'package:web_demo/Widget/Strings.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.jpg"), fit: BoxFit.fill),
        ),
        child: mainLayout(),
      ),
    );
  }

  Widget mainLayout() {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: FittedBox(
              child: Text(
                'Welcome',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.19,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    image(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    titleText(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    emailTextField(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    passwordTextField(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    loginButton(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.19,
          ),
        ],
      ),
    );
  }

  Widget image() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 60,
          child: Image.asset('assets/e-commerce.png')),
    );
  }

  Widget titleText() {
    return FittedBox(
      child: Text(
        strings.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      controller: emailController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.people,
          color: Colors.white,
        ),
        border: new OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.white),
        ),
        hintText: strings.email,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (val) {
        if (val.length == 0)
          return "Please enter email";
        else if (!val.contains("@gmail.com"))
          return "Please enter valid email";
        else
          return null;
      },
      onSaved: (val) => _email = val,
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      controller: passwordController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: strings.password,
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Colors.white,
        ),
        border: new OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.white),
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      obscureText: true,
      validator: (val) {
        if (val.length == 0)
          return "Please enter password";
        else if (val.length <= 5)
          return "Your password should be more then 6 char long";
        else
          return null;
      },
      onSaved: (val) => _password = val,
    );
  }

  Widget loginButton() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        submit();
      },
      child: Text(
        strings.login,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home_Page()));
    } else {
      scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text(
            "Your email: $_email and Password: $_password is Wrong",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
