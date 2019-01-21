import 'package:flutter/material.dart';
import 'package:tririga_ui/CardItemModel.dart';
import 'ServiceRequestContent.dart';
import 'IssuedSR.dart';
import 'CompletedSR.dart';
import 'SRCardContent.dart';

class DraftSRCard extends StatefulWidget {

  List<SRContent> issuedSR = new List<SRContent>();
  List<SRContent> completedSR = new List<SRContent>();
  List<SRContent> draftSR = new List<SRContent>();


  DraftSRCard({this.issuedSR, this.completedSR, this.draftSR});

  @override
  _DraftSRCardState createState() => _DraftSRCardState(
      this.issuedSR, this.completedSR, this.draftSR
  );
}

class _DraftSRCardState extends State<DraftSRCard> {

  List<SRContent> issuedSR = new List<SRContent>();
  List<SRContent> completedSR = new List<SRContent>();
  List<SRContent> draftSR = new List<SRContent>();

  _DraftSRCardState(this.issuedSR, this.completedSR, this.draftSR);

  var appColors = [Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(133, 121, 101, 1.0),Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(233, 121, 101, 2.0),Color.fromRGBO(40, 128, 213, 1.0)];
  var position = 0;
  var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Notifications", Icons.notifications, 9, 0.83),CardItemModel("Actions", Icons.call_to_action, 12, 0.24),CardItemModel("Task", Icons.group_work, 7, 0.32),CardItemModel("Service Request", Icons.question_answer, 7, 0.32)];
  int _currentIndex = 1;
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
              builder: (context) => IssuedSRCard(issuedSR: issuedSR,completedSR: completedSR,draftSR: draftSR,))      );
    }
    if(_currentIndex == 1)
    {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CompletedSRCard(issuedSR: issuedSR,completedSR: completedSR,draftSR: draftSR,))      );
    }
    if(_currentIndex == 2)
    {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DraftSRCard(issuedSR: issuedSR,completedSR: completedSR,draftSR: draftSR,))      );
    }
  }

  static final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(233, 121, 101, 2.0),
    title: new Center(
      child: Text("Draft SR"),
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
        itemCount: draftSR.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              i=0;
              SRContent srContent = draftSR[index];
              print(srContent.description);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SRCardContent(srContent:srContent)),
              );
            },
            child: Hero(tag: "SRCard$index",
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
                          draftSR[index].requestClassification,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.linear_scale,color: Colors.blue), onPressed:(){

                            }),
                            Text(draftSR[index].status, style: TextStyle(color: Colors.blue))
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
                  title: new Text("Issued"),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.call_to_action),
                  title: new Text("Completed"),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.call_to_action),
                  title: new Text("Draft"),
                ),

              ],
            )),
        body: makeBody
    );
  }
}



