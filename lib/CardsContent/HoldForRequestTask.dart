import 'package:flutter/material.dart';
import 'package:tririga_ui/CardItemModel.dart';
import 'package:tririga_ui/CardsContent/TaskContent.dart';
import 'TaskContentCard.dart';
import 'HoldForPartsTask.dart';
import 'ActiveTask.dart';
import 'CompletedTask.dart';

class HoldForRequestTaskCard extends StatefulWidget {

  List<TaskContent> activeTask = new List<TaskContent>();
  List<TaskContent> completedTask = new List<TaskContent>();
  List<TaskContent> holdForPartsTask = new List<TaskContent>();
  List<TaskContent> holdForRequestsTask = new List<TaskContent>();

  HoldForRequestTaskCard({this.activeTask, this.completedTask, this.holdForPartsTask,
    this.holdForRequestsTask});

  @override
  _HoldForRequestTaskCardState createState() => _HoldForRequestTaskCardState(
      this.activeTask,
      this.completedTask,
      this.holdForPartsTask,
      this.holdForRequestsTask
  );
}

class _HoldForRequestTaskCardState extends State<HoldForRequestTaskCard> {

  List<TaskContent> activeTask = new List<TaskContent>();
  List<TaskContent> completedTask = new List<TaskContent>();
  List<TaskContent> holdForPartsTask = new List<TaskContent>();
  List<TaskContent> holdForRequestsTask = new List<TaskContent>();

  _HoldForRequestTaskCardState(this.activeTask, this.completedTask, this.holdForPartsTask,
      this.holdForRequestsTask);

  var appColors = [Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(133, 121, 101, 1.0),Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(233, 121, 101, 2.0),Color.fromRGBO(40, 128, 213, 1.0)];
  var position = 0;
  var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Notifications", Icons.notifications, 9, 0.83),CardItemModel("Actions", Icons.call_to_action, 12, 0.24),CardItemModel("Task", Icons.group_work, 7, 0.32),CardItemModel("Service Request", Icons.question_answer, 7, 0.32)];
  int _currentIndex = 3;
  int i=0;
  void onTabTapped(int index)
  {
    setState(() {
      _currentIndex = index;
    });
    if(_currentIndex == 0)
    {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ActiveTaskCard(activeTask: activeTask,completedTask: completedTask,holdForPartsTask: holdForPartsTask,holdForRequestsTask:holdForRequestsTask))      );
    }
    if(_currentIndex == 1)
    {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CompletedTaskCard(activeTask: activeTask,completedTask: completedTask,holdForPartsTask: holdForPartsTask,holdForRequestsTask:holdForRequestsTask))      );
    }
    if(_currentIndex == 2)
    {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HoldForPartsTaskCard(activeTask: activeTask,completedTask: completedTask,holdForPartsTask: holdForPartsTask,holdForRequestsTask:holdForRequestsTask))      );
    }
    if(_currentIndex == 3)
    {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HoldForRequestTaskCard(activeTask: activeTask,completedTask: completedTask,holdForPartsTask: holdForPartsTask,holdForRequestsTask:holdForRequestsTask))      );
    }
  }

  static final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(233, 121, 101, 2.0),
    title: new Center(
      child: Text("Tasks"),
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
        itemCount: holdForRequestsTask.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              print("Hello");
              i=0;
              TaskContent taskContent = activeTask[index];
              print(taskContent.taskName);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskCardContent(taskContent:taskContent)),
              );
            },
            child: Hero(tag: "taskCard$index",
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
                          holdForRequestsTask[index].taskName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text(holdForPartsTask[index].status, style: TextStyle(color: Colors.blue))
                          ],
                        ),
                      )
                  ),
                )
            ),
          );
        },
      ),
    );

    return Scaffold(
        backgroundColor: Color.fromRGBO(233, 121, 101, 2.0),
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
                  title: new Text("Active"),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.call_to_action),
                  title: new Text("Completed"),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.call_to_action),
                  title: new Text("Hold For Parts"),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.call_to_action),
                  title: new Text("Hold For Request"),
                )
              ],
            )),
        body: makeBody
    );
  }
}



