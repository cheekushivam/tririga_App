import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'ServiceRequestContent.dart';
import 'IssuedSR.dart';

class IntermediateSR extends StatelessWidget {
  static BuildContext contextUse;
  static List<SRContent> issuedSR = new List<SRContent>();
  static List<SRContent> completedSR = new List<SRContent>();
  static List<SRContent> draftSR = new List<SRContent>();
  int i=0;
  static int issuedSRLength = 0;
  static int completedSRLength = 0;
  static int draftSRLength = 0;

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
                  color: Color.fromRGBO(140, 120, 113, 4.0),
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
                  color: Color.fromRGBO(140, 120, 113, 4.0),
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
        future: FirebaseDatabase.instance.reference().child('tririga_Data').child('129207925').once(),
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

      var Data =  dataSnapshot.data.value['ServiceRequests']['Issued'];
      var Data1 = dataSnapshot.data.value['ServiceRequests']['Completed'];
      var Data2 = dataSnapshot.data.value['ServiceRequests']['Draft'];

      print("print");
      print(Data1.length);
      print(Data.length);

      if(Data != null) {
        issuedSRLength = Data.length;
        while (i < issuedSRLength) {
          SRContent srContent = new SRContent();
          srContent.createdDate =
          Data[i]["createdDate"].toString() != null ? Data[i]["createdDate"]
              .toString() : "N/A";
          srContent.description =
          Data[i]["description"].toString() != null ? Data[i]["description"]
              .toString() : "N/A";
          srContent.requestClassification = Data[i]["requestClassification"].toString() != null
              ? Data[i]["requestClassification"].toString()
              : "N/A";
          srContent.status = Data[i]["status"].toString() != null
              ? Data[i]["status"].toString()
              : "N/A";
          srContent.requestId = Data[i]["requestId"].toString() != null
              ? Data[i]["requestId"].toString()
              : "N/A";
          srContent.submittedBy =
          Data[i]["submittedBy"].toString() != null
              ? Data[i]["submittedBy"].toString()
              : "N/A";
          issuedSR.add(srContent);
          i++;
        }
      }
      i=0;
      if(Data1 != null) {
        completedSRLength = Data1.length;
        while (i < completedSRLength) {
          SRContent srContent = new SRContent();
          srContent.createdDate =
          Data1[i]["createdDate"].toString() != null ? Data1[i]["createdDate"]
              .toString() : "N/A";
          srContent.description =
          Data1[i]["description"].toString() != null ? Data1[i]["description"]
              .toString() : "N/A";
          srContent.requestClassification = Data1[i]["requestClassification"].toString() != null
              ? Data1[i]["requestClassification"].toString()
              : "N/A";
          srContent.status = Data1[i]["status"].toString() != null
              ? Data1[i]["status"].toString()
              : "N/A";
          srContent.requestId = Data1[i]["requestId"].toString() != null
              ? Data1[i]["requestId"].toString()
              : "N/A";
          srContent.submittedBy =
          Data1[i]["submittedBy"].toString() != null
              ? Data1[i]["submittedBy"].toString()
              : "N/A";
          completedSR.add(srContent);
          i++;
        }
      }
      i=0;
      if(Data2 != null) {
        draftSRLength = Data2.length;
        while (i < draftSRLength) {
          SRContent srContent = new SRContent();
          srContent.createdDate =
          Data2[i]["createdDate"].toString() != null ? Data2[i]["createdDate"]
              .toString() : "N/A";
          srContent.description =
          Data2[i]["description"].toString() != null ? Data2[i]["description"]
              .toString() : "N/A";
          srContent.requestClassification = Data2[i]["requestClassification"].toString() != null
              ? Data2[i]["requestClassification"].toString()
              : "N/A";
          srContent.status = Data2[i]["status"].toString() != null
              ? Data2[i]["status"].toString()
              : "N/A";
          srContent.requestId = Data2[i]["requestId"].toString() != null
              ? Data2[i]["requestId"].toString()
              : "N/A";
          srContent.submittedBy =
          Data2[i]["submittedBy"].toString() != null
              ? Data2[i]["submittedBy"].toString()
              : "N/A";
          draftSR.add(srContent);
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
      MaterialPageRoute(builder: (context) => IssuedSRCard(issuedSR: issuedSR,completedSR: completedSR,draftSR: draftSR,)),
    );
  }
}
