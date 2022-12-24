import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pl/home.dart';

class AuthorizationPage extends StatefulWidget{
  AuthorizationPage({Key, key}): super(key: key);
  @override
  _AuthorizationPageState createState() =>  _AuthorizationPageState();
}

class  _AuthorizationPageState extends State<AuthorizationPage>{

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late String _email;
  late String _password;
  bool showLogin= true;

  @override
  Widget build(BuildContext context) {
    Widget _logo(){
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text('Spotify Rus', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.green),
            )
          )
        )
      );
    }
Widget _input(Icon icon, String hint, TextEditingController controller, bool obscure){
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 3)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 1)
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.green),
                child: icon
              )
            )
          ),
        ),
      );
}

Widget _button(String text, void func()){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
        animationDuration: Duration(milliseconds: 300),
  elevation: 2.0,
  textStyle: TextStyle(color: Colors.green)),

      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Home())),
      child: Text(text),

      );

    }

    Widget _form (String label, void func()){
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input(Icon(Icons.email),"email", _emailController, false)
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(Icon(Icons.lock),"password", _passwordController, true)
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func)
              )
            )
          ],
        ),
      );

    }

    void _buttonAction(){
      _email=_emailController.text;
      _password=_passwordController.text;

      _emailController.clear();
      _passwordController.clear();
    }

    Widget _bottomMave(){
      return Expanded(
        child: Align(
        child: ClipPath(
          child: Container(
            color: Colors.white,
            height: 300,
          ),
          clipper: BottomMaveClipper(),
        ),
        alignment: Alignment.bottomCenter,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
            _logo(),
          SizedBox(height: 100,),
          (
            showLogin
              ? Column(
            children: <Widget>[
              _form('Login', _buttonAction),
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  child: Text('Еще не зарегистрированы? Регистрация', style: TextStyle(fontSize: 20, color: Colors.green)),
                  onTap:(){
                    setState(() {
                      showLogin = false;
                    });
                }
                ),
              )
            ],
          )
            :Column(
              children: <Widget>[
                _form('Register', _buttonAction),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                      child: Text('Зарегистрированы? Войдите', style: TextStyle(fontSize: 20, color: Colors.green)),
                      onTap:(){
                        setState(() {
                          showLogin = true;
                        });
                      }
                  ),
                )
              ],
            )
          ),
_bottomMave()
        ],
      )
    );
  }
}

class BottomMaveClipper extends CustomClipper<Path>{
  
  @override
  Path getClip(Size size){
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height+5);
    var secondControlPoint = Offset(size.width - (size.width/6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx,secondEndPoint.dy);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}