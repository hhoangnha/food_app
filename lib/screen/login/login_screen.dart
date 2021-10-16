import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'component/input_login.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _email = 'eve.holt@reqres.in', _password = 'cityslicka';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/20945204.jpg"),
              Container(
                width: size.width*0.8,
                child:  TextFieldContainer(
                  text: 'eve.holt@reqres.in',
                  icon: Icon(Icons.email),
                  security: false,
                  setText: (text){
                    setState(() {
                      _email = text;
                    });
                  },
                ),
              ),
              Container(
                width: size.width*0.8,
                child:  TextFieldContainer(
                  text: 'password',
                  icon: Icon(Icons.remove_red_eye),
                  security: true,
                  setText: (text){
                    setState(() {
                      _password = text;
                    });
                  },
                ),
              ),
              Container(
                width: size.width*0.8,
                margin: EdgeInsets.only(top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black54,
                      padding: EdgeInsets.symmetric(vertical: 17)
                    ),
                    onPressed: (){
                      login();
                    },
                    child: Text('LOGIN',style: TextStyle(color:Colors.white),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login() async{
    if (_email.isNotEmpty && _password.isNotEmpty) {
      var response = await http.post(Uri.parse('https://reqres.in/api/login'), body: ({
        'email': _email,
        'password': _password,
      }));
      if(response.statusCode == 200){
         Get.offNamed('/home');
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("login failed"), backgroundColor: Colors.red)
        );
      }
    } else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("missed input form"),backgroundColor: Colors.red)
      );
    }
    
  }
}



