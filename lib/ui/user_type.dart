import 'package:flutter/material.dart';
import 'package:graduation/widgets/main_button.dart';

class UserType extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final MQW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MainButton(width: MQW * 0.8, text: "Company"),
          MainButton(width: MQW * 0.8, text: "Vehcile Owner"),
          MainButton(width: MQW * 0.8, text: "Family"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Have an account?', style: TextStyle(color: Theme.of(context).primaryColor),),
              FlatButton(
                  onPressed: null,
                  child: Text('Sign in', style: TextStyle(color: Theme.of(context).accentColor))
              )
            ],
          ),
          SizedBox(height: 80.0)
        ],
      ),
    );
  }
}
