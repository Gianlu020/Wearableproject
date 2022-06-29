import 'package:flutter/material.dart';
//import 'package:wearable_project/screens/HomePage.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    //Check if the user is already logged in before rendering the login page
    _checkLogin();
  } //initState

  void _checkLogin() async {
    //Get the SharedPreference instance and check if the value of the 'username' filed is set or not
    final sp = await SharedPreferences.getInstance();
    if (sp.getString('username') != null) {
      //If 'username is set, push the HomePage
      Navigator.pushNamed(context, 'HomePage', arguments: 'mario_rossi');
    } //if
  } //_checkLogin

  Future<String> _loginUser(LoginData data) async {
    if (data.name == 'mario_rossi@gmail.com' && data.password == 'admin') {
      final sp = await SharedPreferences.getInstance();
      sp.setString('username', data.name);
      String? userId = await FitbitConnector.authorize(
          context: context,
          clientID: '238C6C',
          clientSecret: 'd1e8a025414a71fcec5d0b2d306aac9c',
          redirectUri: 'example://fitbit/auth',
          callbackUrlScheme: 'example');

      return '';
    } else {
      return 'Wrong credentials';
    }
  }
  // _loginUser

  Future<String> _signUpUser(SignupData data) async {
    return 'To be implemented';
  }

  // _signUpUser
  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  }
  // _recoverPassword

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'login_flow',
      theme: LoginTheme(
        primaryColor: const Color.fromARGB(255, 0, 74, 173),
        //  buttonTheme: ButtonStyle(backgroundColo),
      ),
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () {
        //Navigator.of(context).pushReplacementNamed(HomePage.route);
        Navigator.pushNamed(context, 'HomePage', arguments: 'mario_rossi');
      },
    );
  }
} // LoginScreen