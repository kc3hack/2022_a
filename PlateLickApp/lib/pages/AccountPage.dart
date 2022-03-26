import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  var _button1text = "";
  var _text1text = "";
  var auth;
  bool _buttonisenabled = true;
  _AccountPageState() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        setState(() {
          _button1text = '${user.email} is signed in!';
        });
        print('${user.email} is signed in!');
      }
    });
  }

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text('${_text1text}'),
        ElevatedButton(
          style: style,
          onPressed: () {
            loginbutton();
          },
          child: Text('${_button1text}'),
        ),
        ElevatedButton(
          style: style,
          onPressed: () {
            _signOut();
          },
          child: Text('Logout'),
        ),
      ],
    )));
  }

  loginbutton() {
    debugPrint("login button pressed");
    //setState(() {
    //  _buttonisenabled = !_buttonisenabled;
    //});
    CreateAccount("email", "password");
  }

  CreateAccount(var email, var password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");
      debugPrint(userCredential.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _signOut() async {
    await auth.signOut();
  }
}
