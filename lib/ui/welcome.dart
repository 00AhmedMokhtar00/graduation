import 'package:flutter/material.dart';
import '../widgets/main_button.dart';


class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final MQW = MediaQuery.of(context).size.width;
    final MQH = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Welcome in ABC APP!", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                SizedBox(height: MQH * 0.2),
                MainButton(text: "Sign up", width: MQW * 0.8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Have an account?', style: TextStyle(color: Theme.of(context).primaryColor),),
                    FlatButton(
                        onPressed: null,
                        child: Text('Sign in', style: TextStyle(color: Theme.of(context).accentColor))
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
