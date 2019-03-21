import 'package:flutter/material.dart';
import 'auth.dart';




class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  static String tag = 'Login-Page';
  @override
  _LoginPageState createState() =>  _LoginPageState();

}
enum FormType {
  login,
  register
}

class  _LoginPageState extends State <LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('signed in: $userId');

        } else {
          String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
          print('signed in: $userId');
        }
        widget.onSignedIn();
      }
      catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }


  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold (
        appBar: new AppBar(
          title: new Text('Mkulima Plus'),
        ),
        body: new Container(
            padding: EdgeInsets.all(16.0),
            child: new Form(
              key: formKey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildInputs() + buildSubmitButtons(),
              ),
            )
        )
    );
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email Cannot be Empty' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password Cannot be Empty' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
            onPressed: moveToRegister,
            child: new Text(
                'Create an Account', style: new TextStyle(fontSize: 20.0))
        )
      ];
    } else
      return [
        new RaisedButton(
          child: new Text(
              'Create an Account', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
            onPressed: moveToLogin,
            child: new Text(
                'Have an Account? Login', style: new TextStyle(fontSize: 20.0))
        )
      ];
  }

}
