import 'package:flutter/material.dart';
import '../models/validations.dart';

class LogIn extends StatefulWidget {
  static const RouteName = 'login';
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Map<String, String> _authData = {'email':'', 'password':''};
  final landScape = Orientation.landscape;
  final _passwordFocousNode = FocusNode();
  final _loginForm = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    final MQW = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Align(
            alignment: deviceOrientation == landScape? Alignment(0, 1.0):Alignment(0, 0.34),
            child: SingleChildScrollView(
              padding: deviceOrientation == landScape?const EdgeInsets.symmetric(horizontal: 60, vertical: 10): const EdgeInsets.all(15),
              child: Form(
                key: _loginForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Email'),
                    SizedBox(height: 5),
                    TextFormField(
                      onSaved: (value){_authData['email'] = value;},
                      onFieldSubmitted: (_){FocusScope.of(context).requestFocus(_passwordFocousNode);},
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                          contentPadding: const EdgeInsets.all(5)
                      ),
                      validator: (value) => Validations.emailValidation(value) ,
                    ),
                    SizedBox(height: 10),
                    Text('Password'),
                    SizedBox(height: 5),
                    TextFormField(
                      onSaved: (value){_authData['password'] = value;},
                      validator: (value) => Validations.passwordValidation(value),
                      focusNode: _passwordFocousNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                          contentPadding: const EdgeInsets.all(5)
                      ),
                    ),
                    SizedBox(height: 15),

                    _signUp(context),

                    _loginButton(context, MQW),
                  ],
                ),
              ),
            ),
          ),
          isLoading?Center(child: CircularProgressIndicator(strokeWidth: 2, backgroundColor: Theme.of(context).primaryColor,),):Container(),
        ],
      ),
    );
  }

  Widget _signUp(BuildContext context){
    return Row(
      children: <Widget>[
        Text('need an account?', style: TextStyle(color: Theme.of(context).primaryColor),),
        FlatButton(onPressed: null,child: Text('Sign up', style: TextStyle(color: Theme.of(context).accentColor)))
      ],
    );
  }

  Widget _loginButton(BuildContext context,double width){

    return GestureDetector(
      onTap: null,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(12.0),
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Center(child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
      ),
    );
  }

  Future<bool> _saveForm()async{
    final isValid = _loginForm.currentState.validate();
    if(isValid){
      _loginForm.currentState.save();
      // todo
      return true;
    }
    return false;
  }


  bool _showErrorDialog(String message){
    showDialog(context: context, builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      title: Text('An Error occured!'),
      content: Text(message),
      actions: <Widget>[
        FlatButton(child: Text('OK'), onPressed: (){Navigator.pop(context, false);},)
      ],
    ));
    return false;
  }


  @override
  void dispose() {
    _passwordFocousNode.dispose();
    super.dispose();
  }
}