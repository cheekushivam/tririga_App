import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  bool _validate = false;
  GlobalKey<FormState> _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("Countdown.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child:
                new Container(
                  width: 100.0,
                  height:100.0,
                  child: new Image(
                    image: new AssetImage("tcs-logo.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),
                child: new Form(
                  key: _key,
                  child: new Theme(
                    data: new ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal
                    ),
                    child: new Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 10.0),
                          child: Container(
                            child:  new ListTile(
                              leading: const Icon(Icons.person,size: 35.0,),
                              title: new TextFormField(
                                maxLength: 32,
                                autovalidate: _validate,
                                validator: validateEmail,
                                onSaved: (String value) {
                                  _email = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0),borderSide: BorderSide(color: Colors.white)),
                                    fillColor: Colors.white,
                                    labelText: "UserName"
                                ),
                                keyboardType: TextInputType.numberWithOptions(decimal: false,signed: true),
                              ),
                            ),
                          ),
                        ),

                        Padding(padding: EdgeInsets.only(top: 5.0),
                          child: new Container(
                            child: new ListTile(
                              leading: const Icon(Icons.lock,size: 35.0),
                              title: new TextFormField(
                                maxLength: 16,
                                autovalidate: _validate,
                                validator: validatePassword,
                                onSaved: (String value) {
                                  _password = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0),borderSide: BorderSide(color: Colors.white)),
                                  labelText: "Password",
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                            ),
                          ),),

                        new Padding(
                            padding: EdgeInsets.only(top: 5.0)
                        ),
                        Padding(padding: EdgeInsets.only(left: 60.0,right: 20.0),
                          child: new MaterialButton(
                              height: 50.0,
                              minWidth: MediaQuery.of(context).size.width * 1.0,
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Login",style: TextStyle(fontSize: 20.0),),

                                ],
                              ),
                              splashColor: Colors.white,
                              onPressed: _sendTOServer
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  String validateEmail(String value) {
    if (value.length == 0)
    {
      return "Username is Required";
    }
    else
    {
      Pattern pattern =
          "^[0-9]";
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value))
        return 'Enter Valid UserName';
      else
        return null;
    }

  }
  String validatePassword(String value) {
    if (value.length == 0)
    {
      return "Password is Required";
    }
    else
    {
      Pattern pattern =
          "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})";
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value))
        return 'Enter Valid Password';
      else
        return null;
    }
  }
  callAPI(){
    Post post = Post(
        userName: '14181',
        password: 'Tcs@2019'
    );
    createPost(post).then((response){
      if(response.statusCode > 200)
        print(response.body);
      else
        print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
  }

  Future<http.Response> createPost(Post post) async{
    final response = await http.post('http://14.140.45.246:8005/p/websignon/signon',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: post.postToJson(post)
    );

    return response;
  }

  _sendTOServer()
  {
    callAPI();
    if(_key.currentState.validate())
    {
      _key.currentState.save();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new MyHomePage()),
      );
    }
    else
    {
      setState(() {
        _validate = true;
      });
    }
  }

}
class Post {
  String userName;
  String password;

  Post({
    this.userName, this.password
  });
  String postToJson(Post data) {
    final dyn = data.toJson();
    return json.encode(dyn)*9;
  }
  Map<String, dynamic> toJson() => {
    "userName": userName,
    "password": password
  };


}