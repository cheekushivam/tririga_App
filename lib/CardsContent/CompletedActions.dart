import 'package:flutter/material.dart';
import 'package:tririga_ui/CardItemModel.dart';
import 'ActionContent.dart';
import 'AssignedActions.dart';
import 'AcceptedActions.dart';
import 'AcceptedActionCardContent.dart';


class CompletedActionCard extends StatefulWidget {

   List<ActionContent> completedActions = new List<ActionContent>();
   List<ActionContent> acceptedActions = new List<ActionContent>();
   List<ActionContent> assignedActions = new List<ActionContent>();
   CompletedActionCard({this.completedActions,this.acceptedActions,this.assignedActions});

   @override
  _CompletedActionCardState createState() => _CompletedActionCardState(
      this.completedActions,
      this.acceptedActions,
      this.assignedActions
  );

}

class _CompletedActionCardState extends State<CompletedActionCard> {

  List<ActionContent> completedActions = new List<ActionContent>();
  List<ActionContent> acceptedActions = new List<ActionContent>();
  List<ActionContent> assignedActions = new List<ActionContent>();
  List<Widget> actionWidgets = List<Widget>();

  _CompletedActionCardState(this.completedActions,this.acceptedActions,this.assignedActions);

  var appColors = [Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(133, 121, 101, 1.0),Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(233, 121, 101, 2.0),Color.fromRGBO(40, 128, 213, 1.0)];
  var position = 2;
  int _currentIndex = 0;
  static int i = 0;
  String name = "";
  var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Notifications", Icons.notifications, 9, 0.83),CardItemModel("Actions", Icons.call_to_action, 12, 0.24),CardItemModel("Task", Icons.group_work, 7, 0.32),CardItemModel("Service Request", Icons.question_answer, 7, 0.32)];

  void onTabTapped(int index)
  {
    setState(() {
      _currentIndex = index;
    }
    );
  }

  static final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(111, 194, 173, 1.0),
    title: new Center(
      child: Text("Completed Actions"),
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

    final makeBodyCompleted = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: completedActions.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              ActionContent actionContent = completedActions[index];
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
                          completedActions[index].action,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text("Completed", style: TextStyle(color: Colors.blue))
                          ],
                        ),
                        trailing:
                        IconButton(icon: Icon(Icons.keyboard_arrow_right,color: Colors.black, size: 30.0), onPressed: (){
                          ActionContent actionContent = completedActions[index];
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
    actionWidgets.add(makeBodyCompleted);

    final makeBodyAssigned = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: assignedActions.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              ActionContent actionContent = assignedActions[index];
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
                          assignedActions[index].action,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text("Assigned", style: TextStyle(color: Colors.blue))
                          ],
                        ),
                        trailing:
                        IconButton(icon: Icon(Icons.keyboard_arrow_right,color: Colors.black, size: 30.0), onPressed: (){
                          ActionContent actionContent = completedActions[index];
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
    actionWidgets.add(makeBodyAssigned);
    final makeBodyAccepted = Container(
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
                          ActionContent actionContent = completedActions[index];
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
    actionWidgets.add(makeBodyAccepted);


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
        body: actionWidgets[_currentIndex]
    );
  }
}



