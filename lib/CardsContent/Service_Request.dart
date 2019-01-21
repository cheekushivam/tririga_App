import 'package:flutter/material.dart';
import 'package:tririga_ui/CardItemModel.dart';

class SRCard extends StatefulWidget {
  @override
  _SRCardState createState() => _SRCardState();
}

class _SRCardState extends State<SRCard> {
  var appColors = [Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(133, 121, 101, 1.0),Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(233, 121, 101, 2.0),Color.fromRGBO(40, 128, 213, 1.0)];

  var position = 4;
  var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Notifications", Icons.notifications, 9, 0.83),CardItemModel("Actions", Icons.call_to_action, 12, 0.24),CardItemModel("Task", Icons.group_work, 7, 0.32),CardItemModel("Service Request", Icons.question_answer, 7, 0.32)];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: Card(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 15.0),child: Icon(Icons.arrow_back, color: appColors[position],),),
                      Padding(padding: EdgeInsets.only(right: 15.0),child: Icon(Icons.more_vert, color: appColors[position],))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 40.0,left: 30.0),child: Icon(cardsList[position].icon, color: appColors[position],size: 50.0,),
                      )

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0,left: 40.0),
                        child: Text("${cardsList[position].tasksRemaining} Service Request Generated" ,style: TextStyle(color: Colors.grey,fontSize: 25.0),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
        ),
      ),
    );
  }
}
