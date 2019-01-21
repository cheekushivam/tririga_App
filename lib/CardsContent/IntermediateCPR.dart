import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'CapitalProjectRoleContent.dart';
import 'CapitalProjectRole.dart';
class IntermediateCPR extends StatelessWidget {
  static BuildContext contextUse;

  static List<CapitalProjectRoleContent> draftCPR = new List<CapitalProjectRoleContent>();
  static List<CapitalProjectRoleContent> activeCPR = new List<CapitalProjectRoleContent>();
  static List<CapitalProjectRoleContent> templateCPR = new List<CapitalProjectRoleContent>();
  int i=0;
  static int draftCPRLength = 0;
  static int templateCPRLength = 0;
  static int activeCPRLength = 0;

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
                  color: Color.fromRGBO(149, 133, 123, 2.0),
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
                  color: Color.fromRGBO(149, 133, 123, 2.0),
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
      var Data1 = dataSnapshot.data.value['CapitalProjectRole']['ACtive'];
      var Data = dataSnapshot.data.value['CapitalProjectRole']['Draft'];
      var Data2 = dataSnapshot.data.value['CapitalProjectRole']['template'];
      print("Data2: $Data2");

      if(Data != null) {
        draftCPRLength = Data.length;
        while (i < draftCPRLength) {
          CapitalProjectRoleContent capitalProjectRoleContent = new CapitalProjectRoleContent();
          capitalProjectRoleContent.cpName = Data[i]["cpName"].toString()!= null ? Data[i]["cpName"].toString(): "N/A";
          capitalProjectRoleContent.personName = Data[i]["personName"].toString() != null ? Data[i]["personName"].toString():"N/A";
          capitalProjectRoleContent.role = Data[i]["role"].toString() != null ? Data[i]["role"].toString():"N/A";
          capitalProjectRoleContent.status = Data[i]["status"].toString() != null ? Data[i]["status"].toString() : "N/A";
          capitalProjectRoleContent.id = Data[i]["id"].toString() != null ? Data[i]["id"].toString() : "N/A";
          draftCPR.add(capitalProjectRoleContent);
          i++;
        }
      }
      i=0;
      if(Data1 != null) {
        activeCPRLength = Data1.length;
        while (i < activeCPRLength) {
          CapitalProjectRoleContent capitalProjectRoleContent = new CapitalProjectRoleContent();
          capitalProjectRoleContent.cpName = Data1[i]["cpName"].toString()!= null ? Data1[i]["cpName"].toString(): "N/A";
          capitalProjectRoleContent.personName = Data1[i]["personName"].toString() != null ? Data1[i]["personName"].toString():"N/A";
          capitalProjectRoleContent.role = Data1[i]["role"].toString() != null ? Data1[i]["role"].toString():"N/A";
          capitalProjectRoleContent.status = Data1[i]["status"].toString() != null ? Data1[i]["status"].toString() : "N/A";
          capitalProjectRoleContent.id = Data1[i]["id"].toString() != null ? Data1[i]["id"].toString() : "N/A";
          activeCPR.add(capitalProjectRoleContent);
          i++;
        }
      }
      i=0;
      if(Data2 != null) {
        templateCPRLength = Data2.length;
        print(templateCPRLength);
        while (i < templateCPRLength) {
          CapitalProjectRoleContent capitalProjectRoleContent = new CapitalProjectRoleContent();
          capitalProjectRoleContent.cpName = Data2[i]["cpName"].toString()!= null ? Data2[i]["cpName"].toString(): "N/A";
          capitalProjectRoleContent.personName = Data2[i]["personName"].toString() != null ? Data2[i]["personName"].toString():"N/A";
          capitalProjectRoleContent.role = Data2[i]["role"].toString() != null ? Data2[i]["role"].toString():"N/A";
          capitalProjectRoleContent.status = Data2[i]["status"].toString() != null ? Data2[i]["status"].toString() : "N/A";
          capitalProjectRoleContent.id = Data2[i]["id"].toString() != null ? Data2[i]["id"].toString() : "N/A";
          templateCPR.add(capitalProjectRoleContent);
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
      MaterialPageRoute(builder: (context) => CapitalProjectRoleCard(draftCPR: draftCPR,activeCPR: activeCPR,templateCPR: templateCPR,)),
    );
  }
}
