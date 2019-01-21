import 'package:flutter/material.dart';
import 'package:tririga_ui/CardsContent/TaskContent.dart';

class TaskCardContent extends StatefulWidget {
  //final Index index;
  TaskContent taskContent = new TaskContent();
  TaskCardContent({@required this.taskContent});

  @override
  _TaskCardContentState createState() => new _TaskCardContentState(
      this.taskContent
  );
}

class _TaskCardContentState extends State<TaskCardContent> {

  TaskContent taskContent = new TaskContent();
  static TaskContent taskContentUse = new TaskContent();
  _TaskCardContentState(this.taskContent);
  double indicatorValue = 0.50;

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Row(
          children: <Widget>[
            Icon(
              Icons.work,
              color: Colors.white,
              size: 40.0,
            ),
            SizedBox(
              width: 12.0,
            ),
            Text(
              taskContent.taskId,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ],
        ),
        Container(
          width: 130.0,
          child: new Divider(color: Colors.yellowAccent),
        ),
        SizedBox(height: 10.0),
        Text(
          taskContent.taskName,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        SizedBox(height: 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(3.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.yellowAccent)
              ),
              child: new Text(" Start Date ",style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              width: 100.0,
            ),
            new Container(
              padding: const EdgeInsets.all(3.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.yellowAccent)
              ),
              child: new Text(" End Date ",style: TextStyle(color: Colors.white)),
            ),
          ],

        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              taskContent.startDate.split("T")[0],
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 100.0,
            ),
            Text(
              taskContent.endDate.split("T")[0],
              style: TextStyle(color: Colors.white),
            )
          ],

        ),
        SizedBox
          (
          height:12.0
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 15.0,left: 20.0),
            child: new Container(
              padding: const EdgeInsets.all(3.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.yellowAccent)
              ),
              child: new Text(" Responsible Person : ${taskContent.resPersonName}",style: TextStyle(color: Colors.white)),
            ),)
          ],

        ),
        SizedBox
          (
            height:20.0
        ),
        Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(3.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.yellowAccent)
              ),
              child: new Text(" Task Priority ",style: TextStyle(color: Colors.white)),
            ),
            SizedBox
              (
                width:100.0
            ),
            new Container(
              padding: const EdgeInsets.all(3.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.yellowAccent)
              ),
              child: new Text(" Task Type ",style: TextStyle(color: Colors.white)),
            )
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 10.0),child: Text(
              taskContent.taskPriority,
              style: TextStyle(color: Colors.white),
            ),),
            SizedBox
              (
                width:100.0
            ),
            Padding(padding: EdgeInsets.only(left: 40.0),child: Text(
              taskContent.taskType,
              style: TextStyle(color: Colors.white),
            ),),
          ],
        )
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("Task.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );



    final bottomContentText = Text(
      taskContent.description,
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
          Text("Task Content", style: TextStyle(color: Colors.white)),
        ));

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );


    final topAppBar = AppBar(
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

    return Scaffold(
      body: Column(
          children: <Widget>[topContent, bottomContent]),
    );
  }
}
