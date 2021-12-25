import 'package:flutter/material.dart';

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  int _mealsLeft = 21;
  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {
      // set up the buttons
      Widget cancelButton = FlatButton(
        child: Text(
          "Yes",
          style: TextStyle(color: Colors.purple[900]),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      Widget continueButton = FlatButton(
        child: Text(
          "No",
          style: TextStyle(color: Colors.purple[900]),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Cancel Meal"),
        content: Text("Are you sure you want to cancel today's Meal box?"),
        actions: [
          cancelButton,
          continueButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    showAlertDialog1(BuildContext context) {
      // set up the buttons
      Widget cancelButton = FlatButton(
        child: Text(
          "Yes",
          style: TextStyle(color: Colors.purple[900]),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      Widget continueButton = FlatButton(
        child: Text(
          "No",
          style: TextStyle(color: Colors.purple[900]),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Renew Subscription"),
        content: Text("Do you want to renew your subscription"),
        actions: [
          cancelButton,
          continueButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    String art = 'You still have ';
    String artt = ' meal box left';
    String result = art + _mealsLeft.toString() + artt;

    showAlertDialog2(BuildContext context) {
      // set up the button
      Widget okButton = FlatButton(
        child: Text(
          "OK",
          style: TextStyle(
            color: Colors.deepPurple[300],
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Renew Subscription"),
        content: Text(result),
        actions: [
          okButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _mealsLeft.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'MealBox left',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showAlertDialog(context);
                  });
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    'cancel today\'s meal',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  if (_mealsLeft == 0) {
                    showAlertDialog1(context);
                  } else
                    showAlertDialog2(context);
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    'Renew Subscription',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
