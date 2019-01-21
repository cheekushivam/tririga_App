import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'TaskContent.dart';
import 'ActiveTask.dart';

class IntermediateTask extends StatelessWidget {
  static BuildContext contextUse;
  static List<TaskContent> activeTask = new List<TaskContent>();
  static List<TaskContent> completedTask = new List<TaskContent>();
  static List<TaskContent> holdForPartsTask = new List<TaskContent>();
  static List<TaskContent> holdForRequestsTask = new List<TaskContent>();
  int i=0,j=0,k=0;
  static int activeTaskLength = 0;
  static int completedTaskLength = 0;
  static int holdForPartsTaskLength = 0;
  static int holdForRequestsTaskLength = 0;

  @override
  Widget build(BuildContext context) {
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
                  color: Color.fromRGBO(233, 121, 101, 2.0),
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

    var bodyAfterProgress = new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            alignment: AlignmentDirectional.center,
            decoration: new BoxDecoration(
              color: Colors.white70,
            ),
            child: new Container(
              decoration: new BoxDecoration(
                  color: Color.fromRGBO(233, 121, 101, 2.0),
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
                        height: 200.0,
                        width: 200.0,
                        child: new MaterialButton(onPressed: _onPressedButton,child: new Text("Press to Continue",style: TextStyle(fontSize: 20.0,color: Colors.black87),),)
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
      body: FutureBuilder<DataSnapshot>(
        future: FirebaseDatabase.instance.reference().child('tririga_Data').child('129208024').once(),
        builder: (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot)
        {
          contextUse = context;
          try{
            if(snapshot.hasData) {
              print(snapshot.data.value);
              _getDataFromFirebase(snapshot);
              return Container(
                child: Center(
                    child: bodyAfterProgress
                ),
              );
            }
            else
            {
              return new Center(
                child: bodyProgress,
              );
            }
          }
          catch(e)
          {
            print(e.toString()+ " Hello");
          }
        },
      ),
    );
  }

  void _getDataFromFirebase(AsyncSnapshot<DataSnapshot> dataSnapshot) {
    try {
      var Data = dataSnapshot.data.value['WorkTask']['Active'];
      var Data1 = dataSnapshot.data.value['WorkTask']['Completed'];
      var Data2 = dataSnapshot.data.value['WorkTask']['Hold For Parts'];
      var Data3 = dataSnapshot.data.value['WorkTask']['Hold For Request'];

      if(Data != null) {
        activeTaskLength = Data.length;
        while (i < activeTaskLength) {
          TaskContent taskContent = new TaskContent();
          taskContent.description = Data[i]["description"].toString()!= null ? Data[i]["description"].toString(): "N/A";
          taskContent.taskId = Data[i]["taskId"].toString()!= null ? Data[i]["taskId"].toString(): "N/A";
          taskContent.taskName = Data[i]["taskName"].toString()!= null ? Data[i]["taskName"].toString(): "N/A";
          taskContent.taskPriority = Data[i]["taskPriority"].toString() != null ? Data[i]["taskPriority"].toString():"N/A";
          taskContent.taskType = Data[i]["taskType"].toString() != null ? Data[i]["taskType"].toString():"N/A";
          taskContent.taskName = Data[i]["taskName"].toString() != null ? Data[i]["taskName"].toString() : "N/A";
          taskContent.resPersonName = Data[i]["resPersonName"].toString()!=null ? Data[i]["resPersonName"].toString() : "N/A";
          taskContent.startDate = Data[i]["startDate"].toString()!=null ? Data[i]["startDate"].toString() : "N/A";
          taskContent.endDate = Data[i]["endDate"].toString()!=null ? Data[i]["endDate"].toString() : "N/A";
          taskContent.assignedTo = Data[i]["assignedTo"].toString()!=null ? Data[i]["assignedTo"].toString() : "N/A";
          taskContent.status = Data[i]["status"].toString()!=null ? Data[i]["status"].toString() : "N/A";
          taskContent.createdBy = Data[i]["createdBy"].toString()!=null ? Data[i]["createdBy"].toString() : "N/A";
          activeTask.add(taskContent);
          i++;
        }
      }
      i=0;
      if(Data1 != null) {
        completedTaskLength = Data1.length;
        while (i < completedTaskLength) {
          TaskContent taskContent = new TaskContent();
          taskContent.description = Data1[i]["description"].toString()!= null ? Data1[i]["description"].toString(): "N/A";
          taskContent.taskId = Data1[i]["taskId"].toString()!= null ? Data1[i]["taskId"].toString(): "N/A";
          taskContent.taskName = Data1[i]["taskName"].toString()!= null ? Data1[i]["taskName"].toString(): "N/A";
          taskContent.taskPriority = Data1[i]["taskPriority"].toString() != null ? Data1[i]["taskPriority"].toString():"N/A";
          taskContent.taskType = Data1[i]["taskType"].toString() != null ? Data1[i]["taskType"].toString():"N/A";
          taskContent.taskName = Data1[i]["taskName"].toString() != null ? Data1[i]["taskName"].toString() : "N/A";
          taskContent.resPersonName = Data1[i]["resPersonName"].toString()!=null ? Data1[i]["resPersonName"].toString() : "N/A";
          taskContent.startDate = Data1[i]["startDate"].toString()!=null ? Data1[i]["startDate"].toString() : "N/A";
          taskContent.endDate = Data1[i]["endDate"].toString()!=null ? Data1[i]["endDate"].toString() : "N/A";
          taskContent.assignedTo = Data1[i]["assignedTo"].toString()!=null ? Data1[i]["assignedTo"].toString() : "N/A";
          taskContent.status = Data1[i]["status"].toString()!=null ? Data1[i]["status"].toString() : "N/A";
          taskContent.createdBy = Data1[i]["createdBy"].toString()!=null ? Data1[i]["createdBy"].toString() : "N/A";
          completedTask.add(taskContent);
          i++;
        }
      }
      i=0;
      if(Data2 != null) {
        holdForPartsTaskLength = Data2.length;
        while (i < holdForPartsTaskLength) {
          TaskContent taskContent = new TaskContent();
          taskContent.description = Data2[i]["description"].toString()!= null ? Data2[i]["description"].toString(): "N/A";
          taskContent.taskId = Data2[i]["taskId"].toString()!= null ? Data2[i]["taskId"].toString(): "N/A";
          taskContent.taskName = Data2[i]["taskName"].toString()!= null ? Data2[i]["taskName"].toString(): "N/A";
          taskContent.taskPriority = Data2[i]["taskPriority"].toString() != null ? Data2[i]["taskPriority"].toString():"N/A";
          taskContent.taskType = Data2[i]["taskType"].toString() != null ? Data2[i]["taskType"].toString():"N/A";
          taskContent.taskName = Data2[i]["taskName"].toString() != null ? Data2[i]["taskName"].toString() : "N/A";
          taskContent.resPersonName = Data2[i]["resPersonName"].toString()!=null ? Data2[i]["resPersonName"].toString() : "N/A";
          taskContent.startDate = Data2[i]["startDate"].toString()!=null ? Data2[i]["startDate"].toString() : "N/A";
          taskContent.endDate = Data2[i]["endDate"].toString()!=null ? Data2[i]["endDate"].toString() : "N/A";
          taskContent.assignedTo = Data2[i]["assignedTo"].toString()!=null ? Data2[i]["assignedTo"].toString() : "N/A";
          taskContent.status = Data2[i]["status"].toString()!=null ? Data2[i]["status"].toString() : "N/A";
          taskContent.createdBy = Data2[i]["createdBy"].toString()!=null ? Data2[i]["createdBy"].toString() : "N/A";
          holdForPartsTask.add(taskContent);
          i++;
        }
      }
      i=0;
      if(Data3 != null) {
        holdForRequestsTaskLength = Data3.length;
        while (i < holdForRequestsTaskLength) {
          TaskContent taskContent = new TaskContent();
          taskContent.description = Data3[i]["description"].toString()!= null ? Data3[i]["description"].toString(): "N/A";
          taskContent.taskId = Data3[i]["taskId"].toString()!= null ? Data3[i]["taskId"].toString(): "N/A";
          taskContent.taskName = Data3[i]["taskName"].toString()!= null ? Data3[i]["taskName"].toString(): "N/A";
          taskContent.taskPriority = Data3[i]["taskPriority"].toString() != null ? Data3[i]["taskPriority"].toString():"N/A";
          taskContent.taskType = Data3[i]["taskType"].toString() != null ? Data3[i]["taskType"].toString():"N/A";
          taskContent.taskName = Data3[i]["taskName"].toString() != null ? Data3[i]["taskName"].toString() : "N/A";
          taskContent.resPersonName = Data3[i]["resPersonName"].toString()!=null ? Data3[i]["resPersonName"].toString() : "N/A";
          taskContent.startDate = Data3[i]["startDate"].toString()!=null ? Data3[i]["startDate"].toString() : "N/A";
          taskContent.endDate = Data3[i]["endDate"].toString()!=null ? Data3[i]["endDate"].toString() : "N/A";
          taskContent.assignedTo = Data3[i]["assignedTo"].toString()!=null ? Data3[i]["assignedTo"].toString() : "N/A";
          taskContent.status = Data3[i]["status"].toString()!=null ? Data3[i]["status"].toString() : "N/A";
          taskContent.createdBy = Data3[i]["createdBy"].toString()!=null ? Data3[i]["createdBy"].toString() : "N/A";
          holdForPartsTask.add(taskContent);
          i++;
        }
      }

    }
    catch(e)
    {
      print(e);
    }
  }

  void _onPressedButton() {
    Navigator.pop(contextUse);
    Navigator.push(
      contextUse,
      MaterialPageRoute(builder: (context) => ActiveTaskCard(activeTask: activeTask,completedTask: completedTask,holdForPartsTask: holdForPartsTask,holdForRequestsTask:holdForRequestsTask)),
    );
  }
}
