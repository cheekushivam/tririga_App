import 'package:flutter/material.dart';
import 'package:tririga_ui/CardItemModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'ContentClass.dart';
import 'ActionContent.dart';
import 'package:tririga_ui/CardsContent/TaskContent.dart';
import 'AssignedActionContent.dart';
import 'CompletedActionContent.dart';
import 'AcceptedActionContent.dart';

class PersonalCard extends StatefulWidget {
  @override
  _PersonalCardState createState() => _PersonalCardState();
}

class _PersonalCardState extends State<PersonalCard> {

  var appColors = [Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(133, 121, 101, 1.0),Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(233, 121, 101, 2.0),Color.fromRGBO(40, 128, 213, 1.0)];
  var position =0;
  var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Notifications", Icons.notifications, 9, 0.83),CardItemModel("Actions", Icons.call_to_action, 12, 0.24),CardItemModel("Task", Icons.group_work, 7, 0.32),CardItemModel("Service Request", Icons.question_answer, 7, 0.32)];
  String currentProfilePic =
      "https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg";
  ContentClass contentClass = new ContentClass();

  Widget get personImage {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(currentProfilePic),
        ),
      ),
    );
  }


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
                        padding: EdgeInsets.only(top: 40.0,left: 30.0),
                        child: personImage
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

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
