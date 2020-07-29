import 'package:flutter/material.dart';

import '../models/validations.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Map<String, String> _authData = {'email':'', 'password':''};
  Map<String, String> _userData = {'name':'', 'phone':'', 'device_id':''};
  final landScape = Orientation.landscape;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _mobileFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _deviceIdFocusNode = FocusNode();
  TextEditingController _deviceIdController = TextEditingController();
  final _patientSignupForm = GlobalKey<FormState>();
  bool isLoading = false;
  String _password;
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _mobileFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _deviceIdFocusNode.dispose();
    _deviceIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    final MQW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        centerTitle: true,
        title: Text('SIGN UP'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          SingleChildScrollView(
            padding: deviceOrientation == landScape? const EdgeInsets.symmetric(horizontal: 60, vertical: 30) : const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Form(
              key: _patientSignupForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Owner Name'),
                  SizedBox(height: 5),
                  TextFormField(
                    onSaved: (value){_userData['name'] = value;},
                    validator: (value) => Validations.nameValidation(value),
                    onFieldSubmitted: (_){FocusScope.of(context).requestFocus(_emailFocusNode);},
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    enableSuggestions: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                        contentPadding: const EdgeInsets.all(5)
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Email'),
                  SizedBox(height: 5),
                  TextFormField(
                    onSaved: (value){_authData['email'] = value;},
                    validator: (value) => Validations.emailValidation(value),
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocusNode,
                    onFieldSubmitted: (_){FocusScope.of(context).requestFocus(_mobileFocusNode);},
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                        contentPadding: const EdgeInsets.all(5)
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Mobile Number'),
                  SizedBox(height: 5),
                  TextFormField(
                    onSaved: (value){_userData['phone'] = value;},
                    validator: (value) => Validations.mobileValidation(value),
                    textInputAction: TextInputAction.next,
                    focusNode: _mobileFocusNode,
                    onFieldSubmitted: (_){FocusScope.of(context).requestFocus(_deviceIdFocusNode);},
                    keyboardType: TextInputType.phone,
                    enableSuggestions: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                        contentPadding: const EdgeInsets.all(5)
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Device ID'),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _deviceIdController,
                          onSaved: (value){_userData['device_id'] = value;},
                          //validator: (value) => Validations.mobileValidation(value),
                          textInputAction: TextInputAction.next,
                          focusNode: _deviceIdFocusNode,
                          onFieldSubmitted: (_){FocusScope.of(context).requestFocus(_passwordFocusNode);},
                          keyboardType: TextInputType.phone,
                          enableSuggestions: true,
                          autocorrect: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                              contentPadding: const EdgeInsets.all(5)
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      GestureDetector(
                          child: Icon(Icons.camera_alt),
                          onTap: _scanQR,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Password'),
                  SizedBox(height: 5),
                  TextFormField(
                    onSaved: (value){_authData['password'] = value;},
                    validator: (value) => Validations.passwordValidation(value),
                    textInputAction: TextInputAction.next,
                    focusNode: _passwordFocusNode,
                    onChanged: (value){_password = value;},
                    onFieldSubmitted: (_){FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);},
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                        contentPadding: const EdgeInsets.all(5)
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Confirm Password'),
                  SizedBox(height: 5),
                  TextFormField(
                    validator: (value) => Validations.confirmPasswordValidation(value, _password),
                    textInputAction: TextInputAction.done,
                    focusNode: _confirmPasswordFocusNode,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                        contentPadding: const EdgeInsets.all(5)
                    ),
                  ),

                  _signIn(context),
                  _signupButton(context, MQW),
                ],
              ),
            ),
          ),
          isLoading?Center(child: CircularProgressIndicator(strokeWidth: 3, backgroundColor: Theme.of(context).primaryColor,),):Container()
        ],
      ),
    );
  }

  Widget _signIn(BuildContext context){
    return Row(
      children: <Widget>[
        Text('have an account?', style: TextStyle(color: Theme.of(context).primaryColor),),
        FlatButton(onPressed: null,child: Text('Sign in', style: TextStyle(color: Theme.of(context).accentColor)))
      ],
    );
  }

  Widget _signupButton(BuildContext context,double width){
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
        child: Center(child: Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),

      ),
    );
  }

  Future<bool> _saveForm()async{

    final isValid = _patientSignupForm.currentState.validate();
    if(isValid){
      // todo
      _patientSignupForm.currentState.save();
      try{
        // saving data
      }catch(e){
        //error
        _showErrorDialog(e.toString());
      }
      return true;
    }
    return false;
  }

  Future _scanQR()async{

  }

  Future _showErrorDialog(String message)async{
    await showDialog(context: context, builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      title: Text('An Error occured!'),
      content: Text(message),
      actions: <Widget>[
        FlatButton(child: Text('OK'), onPressed: (){Navigator.of(ctx).pop(false);},)
      ],
    ));
  }
}
