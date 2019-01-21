import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'CompletedActions.dart';
import 'AcceptedActions.dart';
import 'ActionContent.dart';

class IntermediateAction extends StatelessWidget {
  static BuildContext contextUse;
  static List<ActionContent> completedActions = new List<ActionContent>();
  static List<ActionContent> acceptedActions = new List<ActionContent>();
  static List<ActionContent> assignedActions = new List<ActionContent>();
  int i=0,j=0,k=0;
  static int completedActionsLength = 0;
  static int assignedActionsLength = 0;
  static int acceptedActionsLength = 0;

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
      var Data = dataSnapshot.data.value['ActionItems']['Completed'];
      var Data1 = dataSnapshot.data.value['ActionItems']['Accepted'];
      print("Accepted:$Data1");
      var Data2 = dataSnapshot.data.value['ActionItems']['Assigned'];

      if(Data != null) {
        completedActionsLength = Data.length;
        while (i < completedActionsLength) {
          print("completed aaaya");
          ActionContent actionContent = new ActionContent();
          actionContent.assignedTo =
          Data[i]["assignedTo"].toString() != null ? Data[i]["assignedTo"]
              .toString() : "N/A";
          actionContent.assignedBy =
          Data[i]["assignedBy"].toString() != null ? Data[i]["assignedBy"]
              .toString() : "N/A";
          actionContent.action = Data[i]["action"].toString() != null
              ? Data[i]["action"].toString()
              : "N/A";
          actionContent.dueDate = Data[i]["dueDate"].toString() != null
              ? Data[i]["dueDate"].toString()
              : "N/A";
          actionContent.status = Data[i]["status"].toString() != null
              ? Data[i]["status"].toString()
              : "N/A";
          actionContent.businessObject =
          Data[i]["businessObject"].toString() != null
              ? Data[i]["businessObject"].toString()
              : "N/A";
          actionContent.taskId = Data[i]["taskId"].toString() != null
              ? Data[i]["taskId"].toString()
              : "N/A";
          actionContent.record = Data[i]["record"].toString() != null
              ? Data[i]["record"].toString()
              : "N/A";
          actionContent.description =
          Data[i]["description"].toString() != null ? Data[i]["description"]
              .toString() : " Description N/A";
          actionContent.assignedPersonName = dataSnapshot.data.value['name'];
          completedActions.add(actionContent);
          i++;
        }
      }
      if(Data2 != null) {
        assignedActionsLength = Data2.length;
        while (j < assignedActionsLength) {
          print("assigned aaaya");
          ActionContent actionContent = new ActionContent();
          actionContent.assignedTo =
          Data2[j]["assignedTo"].toString() != null ? Data2[j]["assignedTo"]
              .toString() : "N/A";
          actionContent.assignedBy =
          Data2[j]["assignedBy"].toString() != null ? Data2[j]["assignedBy"]
              .toString() : "N/A";
          actionContent.action = Data2[j]["action"].toString() != null
              ? Data2[j]["action"].toString()
              : "N/A";
          actionContent.dueDate =
          Data2[j]["dueDate"].toString() != null ? Data2[j]["dueDate"]
              .toString() : "N/A";
          actionContent.status = Data2[j]["status"].toString() != null
              ? Data2[j]["status"].toString()
              : "N/A";
          actionContent.businessObject =
          Data2[j]["businessObject"].toString() != null
              ? Data2[j]["businessObject"].toString()
              : "N/A";
          actionContent.taskId = Data2[j]["taskId"].toString() != null
              ? Data2[j]["taskId"].toString()
              : "N/A";
          actionContent.record = Data2[j]["record"].toString() != null
              ? Data2[j]["record"].toString()
              : "N/A";
          actionContent.description =
          Data2[j]["description"].toString() != null ? Data2[j]["description"]
              .toString() : " Description N/A";
          actionContent.assignedPersonName = dataSnapshot.data.value['name'];
          assignedActions.add(actionContent);
          j++;
        }
      }
      if(Data1 != null) {
        acceptedActionsLength = Data1.length;
        while (k < acceptedActionsLength) {
          print("accepted aaaya");
          ActionContent actionContent = new ActionContent();
          actionContent.assignedTo =
          Data1[k]["assignedTo"].toString() != null ? Data1[k]["assignedTo"]
              .toString() : "N/A";
          actionContent.assignedBy =
          Data1[k]["assignedBy"].toString() != null ? Data1[k]["assignedBy"]
              .toString() : "N/A";
          actionContent.action = Data1[k]["action"].toString() != null
              ? Data1[k]["action"].toString()
              : "N/A";
          actionContent.dueDate =
          Data1[k]["dueDate"].toString() != null ? Data1[k]["dueDate"]
              .toString() : "N/A";
          actionContent.status = Data1[k]["status"].toString() != null
              ? Data1[k]["status"].toString()
              : "N/A";
          actionContent.businessObject =
          Data1[k]["businessObject"].toString() != null
              ? Data1[k]["businessObject"].toString()
              : "N/A";
          actionContent.taskId = Data1[k]["taskId"].toString() != null
              ? Data1[k]["taskId"].toString()
              : "N/A";
          actionContent.record = Data1[k]["record"].toString() != null
              ? Data1[k]["record"].toString()
              : "N/A";
          actionContent.description =
          Data1[k]["description"].toString() != null ? Data1[k]["description"]
              .toString() : " Description N/A";
          actionContent.assignedPersonName = dataSnapshot.data.value['name'];
          acceptedActions.add(actionContent);
          k++;
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
      MaterialPageRoute(builder: (context) => CompletedActionCard(completedActions: completedActions,acceptedActions: acceptedActions,assignedActions: assignedActions,)),
    );
  }
}
