import 'package:flutter/material.dart';
import 'package:tririga_ui/CardItemModel.dart';
import 'CapitalProjectRoleContent.dart';
import 'CapitalProjectRoleContentCard.dart';

class CapitalProjectRoleCard extends StatefulWidget {

  List<CapitalProjectRoleContent> draftCPR = new List<CapitalProjectRoleContent>();
  List<CapitalProjectRoleContent> activeCPR = new List<CapitalProjectRoleContent>();
  List<CapitalProjectRoleContent> templateCPR = new List<CapitalProjectRoleContent>();


  CapitalProjectRoleCard({this.draftCPR, this.activeCPR, this.templateCPR});

  @override
  _CapitalProjectRoleCardState createState() => _CapitalProjectRoleCardState(
      this.draftCPR, this.activeCPR, this.templateCPR
  );
}

class _CapitalProjectRoleCardState extends State<CapitalProjectRoleCard> {
  List<Widget> cprWidgets = new List<Widget>();

  List<CapitalProjectRoleContent> draftCPR = new List<CapitalProjectRoleContent>();
  List<CapitalProjectRoleContent> activeCPR = new List<CapitalProjectRoleContent>();
  List<CapitalProjectRoleContent> templateCPR = new List<CapitalProjectRoleContent>();


  _CapitalProjectRoleCardState(this.draftCPR, this.activeCPR, this.templateCPR);

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
    backgroundColor: Color.fromRGBO(149, 133, 123, 2.0),
    title: new Center(
      child: Text("Capital Projects"),
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

    final makeBodyActive = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: activeCPR.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              i=0;
              CapitalProjectRoleContent capitalProjectRoleContent = activeCPR[index];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CapitalProjectRoleCardContent(capitalProjectRoleContent: capitalProjectRoleContent,) ),
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
                          activeCPR[index].cpName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text(activeCPR[index].status, style: TextStyle(color: Colors.blue))
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
    cprWidgets.add(makeBodyActive);

    final makeBodyDraft= Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: draftCPR.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              i=0;
              CapitalProjectRoleContent capitalProjectRoleContent = draftCPR[index];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CapitalProjectRoleCardContent(capitalProjectRoleContent: capitalProjectRoleContent,) ),
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
                          draftCPR[index].cpName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text(draftCPR[index].status, style: TextStyle(color: Colors.blue))
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
    cprWidgets.add(makeBodyDraft);

    final makeBodyTemplate = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: templateCPR.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              print(index);
              CapitalProjectRoleContent capitalProjectRoleContent = templateCPR[index];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CapitalProjectRoleCardContent(capitalProjectRoleContent: capitalProjectRoleContent,) ),
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
                          templateCPR[index].cpName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text(templateCPR[index].status, style: TextStyle(color: Colors.blue))
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
    cprWidgets.add(makeBodyTemplate);


    return Scaffold(
        backgroundColor: Color.fromRGBO(149, 133, 123, 2.0),
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
        body: cprWidgets[_currentIndex]
    );
  }
}



