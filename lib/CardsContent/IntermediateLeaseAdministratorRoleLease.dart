import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Leases.dart';
import 'LeaseAdministratorRoleLeases.dart';

class IntermediateLeaseAdmRole extends StatelessWidget {
  static BuildContext contextUse;

  static List<Leases> draftLeaseAccRole = new List<Leases>();
  static List<Leases> activeLeaseAccRole = new List<Leases>();
  static List<Leases> ripLeaseAccRole = new List<Leases>();
  static List<Leases> processingLeaseAccRole = new List<Leases>();
  int i=0;
  static int draftLeaseAccRoleLength = 0;
  static int activeLeaseAccRoleLength = 0;
  static int ripLeaseAccRoleLength = 0;
  static int processingLeaseAccRoleLength = 0;

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
                  color: Color.fromRGBO(19, 55, 23, 1.0),
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
                  color: Color.fromRGBO(19, 55, 23, 1.0),
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
      var Data = dataSnapshot.data.value['LeaseAdministratorLeases']['Draft'];
      var Data1 = dataSnapshot.data.value['LeaseAdministratorLeases']['Active'];
      var Data2 = dataSnapshot.data.value['LeaseAdministratorLeases']['Review In Progress'];
      var Data3 = dataSnapshot.data.value['LeaseAdministratorLeases']['Processing'];

      if(Data != null) {
        draftLeaseAccRole = Data.length;
        while (i < draftLeaseAccRoleLength) {
          Leases lease = new Leases();
          lease.id = Data[i]["id"].toString()!= null ? Data[i]["id"].toString(): "N/A";
          lease.personName = Data[i]["personName"].toString() != null ? Data[i]["personName"].toString():"N/A";
          lease.role = Data[i]["role"].toString() != null ? Data[i]["role"].toString():"N/A";
          lease.status = Data[i]["status"].toString() != null ? Data[i]["status"].toString() : "N/A";
          lease.leaseName = Data[i]["leaseName"].toString() != null ? Data[i]["leaseName"].toString() : "N/A";
          draftLeaseAccRole.add(lease);
          i++;
        }
      }
      i=0;
      if(Data1 != null) {
        activeLeaseAccRoleLength = Data1.length;
        while (i < activeLeaseAccRoleLength) {
          Leases lease = new Leases();
          lease.leaseName = Data1[i]["leaseName"].toString()!= null ? Data1[i]["leaseName"].toString(): "N/A";
          lease.personName = Data1[i]["personName"].toString() != null ? Data1[i]["personName"].toString():"N/A";
          lease.role = Data1[i]["role"].toString() != null ? Data1[i]["role"].toString():"N/A";
          lease.status = Data1[i]["status"].toString() != null ? Data1[i]["status"].toString() : "N/A";
          lease.id = Data1[i]["id"].toString() != null ? Data1[i]["id"].toString() : "N/A";
          activeLeaseAccRole.add(lease);
          i++;
        }
      }
      i=0;
      if(Data2 != null) {
        ripLeaseAccRoleLength = Data2.length;
        while (i < ripLeaseAccRoleLength) {
          Leases lease = new Leases();
          lease.leaseName = Data2[i]["leaseName"].toString()!= null ? Data2[i]["leaseName"].toString(): "N/A";
          lease.personName = Data2[i]["personName"].toString() != null ? Data2[i]["personName"].toString():"N/A";
          lease.role = Data2[i]["role"].toString() != null ? Data2[i]["role"].toString():"N/A";
          lease.status = Data2[i]["status"].toString() != null ? Data2[i]["status"].toString() : "N/A";
          lease.id = Data2[i]["id"].toString() != null ? Data2[i]["id"].toString() : "N/A";
          ripLeaseAccRole.add(lease);
          i++;
        }
      }
      if(Data3 != null) {
        processingLeaseAccRoleLength = Data2.length;
        while (i < processingLeaseAccRoleLength) {
          Leases lease = new Leases();
          lease.leaseName = Data2[i]["cpName"].toString()!= null ? Data2[i]["leaseName"].toString(): "N/A";
          lease.personName = Data2[i]["personName"].toString() != null ? Data2[i]["personName"].toString():"N/A";
          lease.role = Data2[i]["role"].toString() != null ? Data2[i]["role"].toString():"N/A";
          lease.status = Data2[i]["status"].toString() != null ? Data2[i]["status"].toString() : "N/A";
          lease.id = Data2[i]["id"].toString() != null ? Data2[i]["id"].toString() : "N/A";
          processingLeaseAccRole.add(lease);
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
    MaterialPageRoute(builder: (context) => LeaseAdmRoleRoleCard(draftLeaseAccRole: draftLeaseAccRole,activeLeaseAccRole: activeLeaseAccRole,ripLeaseAccRole: ripLeaseAccRole,processingLeaseAccRole: processingLeaseAccRole,)),
    );
  }
}
