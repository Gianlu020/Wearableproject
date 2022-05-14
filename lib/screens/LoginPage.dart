import 'package:flutter/material.dart';
import 'package:wearable_project/screens/HomePage.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'LoginPage';

  Future<String> _loginUser(LoginData data) async {
    if (data.name == 'ciao@ciao.com' && data.password == 'admin') {
      return '';
    } else {
      return 'wrong credentials';
    }
  } // _loginUser
  //commento prova branch

  Future<String> _signUpUser(SignupData data) async {
    return 'To be implemented';
  } // _signUpUseraaaaa

  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  } // _recoverPassword

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'login_flow',
      theme: LoginTheme(primaryColor: Colors.green),
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () {
        //Navigator.of(context).pushReplacementNamed(HomePage.route);
        Navigator.pushNamed(context, 'HomePage', arguments: 'ciao@ciao.com');
      },
    );
  } // build
} // LoginScreen