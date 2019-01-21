import 'package:flutter/material.dart';
import 'AssignedActionContent.dart';

class AssignedActionCardContent extends StatefulWidget {
  //final Index index;
  AssignedActionContent assignedActionContent = new AssignedActionContent();
  AssignedActionCardContent({@required this.assignedActionContent});

  @override
  _AssignedActionCardContentState createState() => new _AssignedActionCardContentState(
      this.assignedActionContent
  );
}

class _AssignedActionCardContentState extends State<AssignedActionCardContent> {

  AssignedActionContent assignedActionContent = new AssignedActionContent();
  static AssignedActionContent assignedActionContentUse = new AssignedActionContent();
  _AssignedActionCardContentState(this.assignedActionContent);
  double indicatorValue = 0.33;

  @override
  Widget build(BuildContext context) {

    String startDate = "N/A";
    String endDate = "N/A";
    if(assignedActionContent.startDate != null)
      startDate = assignedActionContent.startDate;
    if(assignedActionContent.endDate != null)
      endDate = assignedActionContent.endDate;

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50.0),
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
              assignedActionContent.taskId,
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
          assignedActionContent.action,
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        SizedBox(height: 30.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(3.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.yellowAccent)
              ),
              child: new Text("Due Date",style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              width: 120.0,
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
              startDate,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 120.0,
            ),
            Text(
              endDate,
              style: TextStyle(color: Colors.white),
            )
          ],

        ),

      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("Task.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
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
      "This part is just a demo of description of particular Task. Here we will display Description of Particular Task",
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
          Text(assignedActionContent.taskLabel, style: TextStyle(color: Colors.white)),
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


    return Scaffold(
      body: Column(
          children: <Widget>[topContent, bottomContent]),
    );
  }
}
