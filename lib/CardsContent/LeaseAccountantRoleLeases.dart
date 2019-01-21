import 'package:flutter/material.dart';
import 'package:tririga_ui/CardItemModel.dart';
import 'Leases.dart';
import 'LeaseAccountantRoleCardContent.dart';

class LeaseAccRoleRoleCard extends StatefulWidget {

  List<Leases> draftLeaseAccRole = new List<Leases>();
  List<Leases> activeLeaseAccRole = new List<Leases>();
  List<Leases> ripLeaseAccRole = new List<Leases>();
  List<Leases> processingLeaseAccRole = new List<Leases>();

  LeaseAccRoleRoleCard({this.draftLeaseAccRole, this.activeLeaseAccRole,
    this.ripLeaseAccRole, this.processingLeaseAccRole});

  @override
  _LeaseAccRoleRoleCardState createState() => _LeaseAccRoleRoleCardState(
      this.draftLeaseAccRole, this.activeLeaseAccRole,
      this.ripLeaseAccRole, this.processingLeaseAccRole
  );
}

class _LeaseAccRoleRoleCardState extends State<LeaseAccRoleRoleCard> {
  List<Widget> larWidgets = new List<Widget>();

  List<Leases> draftLeaseAccRole = new List<Leases>();
  List<Leases> activeLeaseAccRole = new List<Leases>();
  List<Leases> ripLeaseAccRole = new List<Leases>();
  List<Leases> processingLeaseAccRole = new List<Leases>();


  _LeaseAccRoleRoleCardState(this.draftLeaseAccRole,
      this.activeLeaseAccRole, this.ripLeaseAccRole,
      this.processingLeaseAccRole);

  var appColors = [Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(133, 121, 101, 1.0),Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(233, 121, 101, 2.0),Color.fromRGBO(40, 128, 213, 1.0)];
  var position = 0;
  var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Notifications", Icons.notifications, 9, 0.83),CardItemModel("Actions", Icons.call_to_action, 12, 0.24),CardItemModel("Task", Icons.group_work, 7, 0.32),CardItemModel("Service Request", Icons.question_answer, 7, 0.32)];
  int _currentIndex = 0;
  int i=0;

  void onTabTapped(int index)
  {
    setState(() {
      _currentIndex = index;
    });

  }
  static final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(129, 148, 123, 2.0),
    title: new Center(
      child: Text("Lease Accountant Leases"),
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

    final makeBodyDraft = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: draftLeaseAccRole.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              print("Hello");
              i=0;
              Leases lease = draftLeaseAccRole[index];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LaccRoleCardContent(lease:lease,)),
              );
            },
            child: Hero(tag: "larCard$index",
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
                          draftLeaseAccRole[index].leaseName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text(draftLeaseAccRole[index].status, style: TextStyle(color: Colors.blue))
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
    larWidgets.add(makeBodyDraft);

    final makeBodyActive= Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: activeLeaseAccRole.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              print("Hello");
              i=0;
              Leases lease = activeLeaseAccRole[index];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LaccRoleCardContent(lease:lease,)),
              );
            },
            child: Hero(tag: "larCard$index",
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
                          activeLeaseAccRole[index].leaseName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text(activeLeaseAccRole[index].status, style: TextStyle(color: Colors.blue))
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
    larWidgets.add(makeBodyActive);

    final makeBodyRIP = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: ripLeaseAccRole.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              print("Hello");
              i=0;
              Leases lease = ripLeaseAccRole[index];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LaccRoleCardContent(lease:lease,)),
              );
            },
            child: Hero(tag: "cprCard$index",
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
                          ripLeaseAccRole[index].leaseName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text(ripLeaseAccRole[index].status, style: TextStyle(color: Colors.blue))
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
    larWidgets.add(makeBodyRIP);

    final makeBodyProcessing = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: processingLeaseAccRole.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              print("Hello");
              i=0;
              Leases lease = processingLeaseAccRole[index];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LaccRoleCardContent(lease:lease,)),
              );
            },
            child: Hero(tag: "cprCard$index",
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
                          processingLeaseAccRole[index].leaseName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text(processingLeaseAccRole[index].status, style: TextStyle(color: Colors.blue))
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
    larWidgets.add(makeBodyProcessing);

    return Scaffold(
        backgroundColor: Color.fromRGBO(129, 148, 123, 2.0),
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
                  title: new Text("Draft"),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.call_to_action),
                  title: new Text("Template"),
                ),

              ],
            )),
        body: larWidgets[_currentIndex]
    );
  }
}



