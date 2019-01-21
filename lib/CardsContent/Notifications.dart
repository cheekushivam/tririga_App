import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'NotificationContent.dart';

class NotificationCard extends StatefulWidget {
  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  static List<NotificationContent> notifications = new List<NotificationContent>();
  int notificationLength = 0;

  static final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(133, 121, 101, 1.0),
    title: new Center(
      child: Text("Notifications"),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );

  @override
  Widget build(BuildContext context) {

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
            },
            child: Hero(
                tag: "ncard$index",
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 8.0,
                  margin:
                  new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.black))),
                          child: Icon(Icons.autorenew, color: Colors.black),
                        ),
                        title: Text(
                          notifications[index].notificationSubject,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            IconButton(
                                icon:
                                Icon(Icons.linear_scale, color: Colors.blue),
                                onPressed: () {}),
                            Text(notifications[index].dateSent.split("T")[0])
                          ],
                        ),
                      )),
                )),
          );
        },
      ),
    );



    var bodyProgress = new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            alignment: AlignmentDirectional.center,
            decoration: new BoxDecoration(
              color: Colors.white70,
            ),
            child: new Container(
              decoration: new BoxDecoration(
                  color: Color.fromRGBO(133, 121, 101, 1.0),
                  borderRadius: new BorderRadius.circular(10.0)),
              width: 300.0,
              height: 200.0,
              alignment: AlignmentDirectional.center,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Center(
                    child: new SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: new CircularProgressIndicator(
                        value: null,
                        strokeWidth: 7.0,
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    child: new Center(
                      child: new Text(
                        "Loading Please wait...",
                        style: new TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
        backgroundColor: Color.fromRGBO(133, 121, 101, 1.0),
        appBar: topAppBar,
        body: FutureBuilder<DataSnapshot>(
          future: FirebaseDatabase.instance
              .reference()
              .child('tririga_Data')
              .child('129208024')
              .once(),
          builder:
              (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
            try {
              if (snapshot.hasData) {
                _getDataFromFirebase(snapshot);
                return makeBody;
              } else {
                return new Center(
                  child: bodyProgress,
                );
              }
            } catch (e) {
              print(e.toString() + " Hello");
            }
          },
        ));
  }

  void _getDataFromFirebase(AsyncSnapshot<DataSnapshot> snapshot) {
    try {
      var Data = snapshot.data.value['Notification'];
      print(Data);
      int i = 0;
      if (Data != null) {
        notificationLength = Data.length;
        while (i < notificationLength) {
          NotificationContent notificationContent = new NotificationContent();
          notificationContent.id = Data[i]["id"].toString() != null
              ? Data[i]["id"].toString()
              : "N/A";
          notificationContent.dateSent = Data[i]["dateSent"].toString() != null
              ? Data[i]["dateSent"].toString()
              : "N/A";
          notificationContent.notificationSubject =
              Data[i]["notificationSubject"].toString() != null
                  ? Data[i]["notificationSubject"].toString()
                  : "N/A";
          notifications.add(notificationContent);
          i++;
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
