import 'package:flutter/material.dart';
import 'package:tririga_ui/CardItemModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'ActionContent.dart';
import 'CompletedActions.dart';
import 'AssignedActions.dart';
import 'AcceptedActionCardContent.dart';


class AcceptedActionCard extends StatefulWidget {

  List<ActionContent> completedActions = new List<ActionContent>();
  List<ActionContent> acceptedActions = new List<ActionContent>();
  List<ActionContent> assignedActions = new List<ActionContent>();
  AcceptedActionCard({this.completedActions,this.acceptedActions,this.assignedActions});

  @override
  _AcceptedActionCardState createState() => _AcceptedActionCardState(
    this.completedActions,
    this.acceptedActions,
    this.assignedActions
  );
}

class _AcceptedActionCardState extends State<AcceptedActionCard> {

  List<ActionContent> completedActions = new List<ActionContent>();
  List<ActionContent> acceptedActions = new List<ActionContent>();
  List<ActionContent> assignedActions = new List<ActionContent>();

  _AcceptedActionCardState(this.completedActions,this.acceptedActions,this.assignedActions);

  var appColors = [Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(133, 121, 101, 1.0),Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(233, 121, 101, 2.0),Color.fromRGBO(40, 128, 213, 1.0)];
  var position = 2;
  int _currentIndex = 2;
  static int i = 0;
  var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Notifications", Icons.notifications, 9, 0.83),CardItemModel("Actions", Icons.call_to_action, 12, 0.24),CardItemModel("Task", Icons.group_work, 7, 0.32),CardItemModel("Service Request", Icons.question_answer, 7, 0.32)];

  void onTabTapped(int index)
  {
    setState(() {
      _currentIndex = index;
    });
    if(_currentIndex == 0)
    {
      print("inside accepted");
      print(completedActions.length);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new CompletedActionCard(completedActions: completedActions,acceptedActions: acceptedActions,assignedActions: assignedActions)),
      );
    }
    if(_currentIndex == 1)
    {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new AssignedActionCard(completedActions: completedActions,acceptedActions: acceptedActions,assignedActions: assignedActions)),
      );
    }
    if(_currentIndex == 2)
    {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new AcceptedActionCard(completedActions: completedActions,acceptedActions: acceptedActions,assignedActions: assignedActions)),
      );
    }

  }

//  void _getDataFromFirebase(AsyncSnapshot<DataSnapshot> dataSnapshot)
//  {
//    var Data = dataSnapshot.data.value['ActionItems']['Accepted'];
//    try {
//      acceptedActionsLength = dataSnapshot.data.value.length;
//      print(acceptedActionsLength);
//      while(i<acceptedActionsLength)
//      {
//        ActionContent actionContent = new ActionContent();
//        actionContent.assignedTo = dataSnapshot.data.value[i]["assignedTo"].toString()!= null ? dataSnapshot.data.value[i]["assignedTo"].toString(): "N/A";
//        actionContent.assignedBy = dataSnapshot.data.value[i]["assignedBy"].toString() != null ? dataSnapshot.data.value[i]["assignedBy"].toString():"N/A";
//        actionContent.action = dataSnapshot.data.value[i]["action"].toString() != null ? dataSnapshot.data.value[i]["action"].toString():"N/A";
//        actionContent.dueDate = dataSnapshot.data.value[i]["dueDate"].toString() != null ? dataSnapshot.data.value[i]["dueDate"].toString() : "N/A";
//        actionContent.status = dataSnapshot.data.value[i]["status"].toString()!=null ? dataSnapshot.data.value[i]["status"].toString() : "N/A";
//        actionContent.businessObject = dataSnapshot.data.value[i]["businessObject"].toString()!=null ? dataSnapshot.data.value[i]["businessObject"].toString() : "N/A";
//        actionContent.taskId = Data[i]["taskId"].toString()!=null ? Data[i]["taskId"].toString() : "N/A";
//        actionContent.record = Data[i]["record"].toString()!=null ? Data[i]["record"].toString() : "N/A";
//        actionContent.description = Data[i]["description"].toString()!=null ? Data[i]["description"].toString() : " Description N/A";
//        actionContent.assignedPersonName = dataSnapshot.data.value['name'];
//        acceptedActions.add(actionContent);
//        i++;
//      }
//    }
//    catch(e)
//    {
//      print(e);
//    }
//  }


  static final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(111, 194, 173, 1.0),
    title: new Center(
      child: Text("Accepted Actions"),
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
        itemCount: acceptedActions.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              ActionContent actionContent = acceptedActions[index];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AcceptedActionCardContent(actionContent:actionContent)),
              );
            },
            child: Hero(tag: "acceptedActionCard$index",
                child:Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
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
                          acceptedActions[index].action,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text("Accepted", style: TextStyle(color: Colors.blue))
                          ],
                        ),
                        trailing:
                        IconButton(icon: Icon(Icons.keyboard_arrow_right,color: Colors.black, size: 30.0), onPressed: (){
                          ActionContent actionContent = acceptedActions[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AcceptedActionCardContent(actionContent:actionContent)),
                          );
                        }),
                      )
                  ),
                )
            ),
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
                  color: Color.fromRGBO(111, 194, 173, 1.0),
                  borderRadius: new BorderRadius.circular(10.0)
              ),
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
                        style: new TextStyle(
                            color: Colors.white
                        ),
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
        backgroundColor: Color.fromRGBO(111, 194, 173, 1.0),
        appBar: topAppBar,
        bottomNavigationBar:new Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
                canvasColor: Color.fromRGBO(111, 194, 173, 1.0),
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Colors.red,
                textTheme: Theme
                    .of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.black))), // sets the inactive color of the `BottomNavigationBar`
            child: new BottomNavigationBar(
              onTap: onTabTapped,
              fixedColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              items: [
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.call_to_action),
                  title: new Text("Completed"),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.call_to_action),
                  title: new Text("Assigned"),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.call_to_action),
                  title: new Text("Accepted"),
                )
              ],
            )),

        body: makeBody
//        FutureBuilder<DataSnapshot>(
//          future: FirebaseDatabase.instance.reference().child('tririga_Data').child('129208024').once(),
//          builder: (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot)
//          {
//            print("Yaha PE");
//            print(snapshot.data.value);
//            try{
//              if(snapshot.hasData) {
//                //_getDataFromFirebase(snapshot);
//                print(snapshot.data.value);
//                return Container(
//                    child: Center(
//                      child: new Text("Hello"),
//                    ));
//              }
//              else
//              {
//                return new Center(
//                  child: bodyProgress,
//                );
//              }
//            }
//            catch(e)
//            {
//              print(e.toString()+ " Hello");
//            }
//          },
//        )
    );
  }
}



