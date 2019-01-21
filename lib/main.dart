import 'package:flutter/material.dart';
import 'dart:math';
import 'CardItemModel.dart';
import 'CardsContent/Personal.dart';
import 'CardsContent/Notifications.dart';
import 'LoginPage.dart';
import 'package:tririga_ui/CardsContent/IntermediateSRPage.dart';
import 'CardsContent/IntermediateActionPage.dart';
import 'package:tririga_ui/CardsContent/IntermediateTaskPage.dart';
import 'CardsContent/IntermediateCPR.dart';
import 'CardsContent/IntermediateLeaseAccountantLeases.dart';
import 'CardsContent/IntermediateLeaseAdministratorRoleLease.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tririga App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () =>
                onPageSelected(index)
              ,
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  int _value = 0;
  BuildContext contextUse;
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);


  final _pages = List<Widget>.generate(
  8,
  (i) => new ConstrainedBox(
  constraints: const BoxConstraints.expand(),
  child: returnCard(appColors, cardsList,i)
  )
  );


  static var appColors = [Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(133, 121, 101, 1.0),Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(233, 121, 101, 2.0),Color.fromRGBO(140, 120, 113, 4.0),Color.fromRGBO(149, 133, 123, 2.0),Color.fromRGBO(129, 148, 123, 2.0),Color.fromRGBO(19, 55, 23, 1.0)];
  String currentProfilePic =
      "https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg";

  var currentColor = Color.fromRGBO(99, 138, 223, 1.0);

  static var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Notifications", Icons.notifications, 9, 0.83),CardItemModel("Actions", Icons.call_to_action, 12, 0.24),CardItemModel("WorkTask", Icons.group_work, 7, 0.32),CardItemModel("Service Request", Icons.question_answer, 7, 0.32),CardItemModel("Capital Projects", Icons.home, 9, 0.83),CardItemModel("Lease Accountant Projects", Icons.account_box, 9, 0.83),CardItemModel("Lease Administrator Projects", Icons.perm_identity, 9, 0.83)];

  Widget get personImage {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(currentProfilePic),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    contextUse = context;
    return new Scaffold(
      backgroundColor: appColors[_value],
      appBar: new AppBar(
        title: new Text("Tririga Application", style: TextStyle(fontSize: 20.0),),
        backgroundColor: appColors[_value],
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          ),
        ],
        elevation: 0.0,
      ),
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 5.0),
              child: Text("TCS INTERNAL", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.white),textAlign: TextAlign.center,),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 18.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: personImage,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
                      child: Text("Hello, Shivam", style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w400),),
                    ),
                    Text("Looks like feel good.", style: TextStyle(color: Colors.white),),
                    Text("You have 3 tasks to do today.", style: TextStyle(color: Colors.white,),),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
                  child: Text("TODAY : JUL 21, 2018", style: TextStyle(color: Colors.white),),
                ),
                Padding(padding: EdgeInsets.all(30.0),
                  child: Container(
                      child: new PageView.builder(
                        physics: new AlwaysScrollableScrollPhysics(),
                        controller: _controller,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0),
                            child: GestureDetector(
                                child: _pages[index % _pages.length],
                                onTap: ()=>
                                    openCard(index)
                            ),);
                        },
                        onPageChanged: handleClick,
                      ),
                      height: 150.0,
                      width: 400.0
                  ),
                ),
                new Container(
                  color: Colors.grey[800].withOpacity(0.5),
                  padding: const EdgeInsets.all(6.0),
                  child: new Center(
                    child: new DotsIndicator(
                      controller: _controller,
                      itemCount: _pages.length,
                      onPageSelected: (int page) {
                        _controller.animateToPage(
                          page,
                          duration: _kDuration,
                          curve: _kCurve,
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }

  static Widget returnCard(appColors,cardList,position) {
    return Card(
      child: Container(
        width: 230.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(cardsList[position].icon, color: appColors[position],),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Text("${cardsList[position].tasksRemaining} Tasks", style: TextStyle(color: Colors.grey),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Text("${cardsList[position].cardTitle}", style: TextStyle(fontSize: 15.0),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(value: cardsList[position].taskCompletion,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }

  void handleClick(int value) {

    setState(() {
      if(value>7)
        _value = 0;
      else
      _value = value;
    });
  }
  openCard(int value) {
    if (value == 0) {

    }
    else if (value == 1) {
      Navigator.push(
        contextUse,
        MaterialPageRoute(
            builder: (context) => new NotificationCard()),
      );
    }
    else if (value == 2) {
      Navigator.push(
        contextUse,
        MaterialPageRoute(
            builder: (context) => new IntermediateAction()),
      );
    }
    else if (value == 3) {
      Navigator.push(
        contextUse,
        MaterialPageRoute(
            builder: (context) => new IntermediateTask()),
      );
    }
    else if (value == 4) {
      Navigator.push(
        contextUse,
        MaterialPageRoute(
            builder: (context) => new IntermediateSR()),
      );
    }
    else if (value == 5) {
      Navigator.push(
        contextUse,
        MaterialPageRoute(
            builder: (context) => new IntermediateCPR()),
      );
    }
    else if (value == 6) {
      Navigator.push(
        contextUse,
        MaterialPageRoute(
            builder: (context) => new IntermediateLeaseAccRole()),
      );
    }
    else if (value == 7) {
      Navigator.push(
        contextUse,
        MaterialPageRoute(
            builder: (context) => new IntermediateLeaseAdmRole()),
      );
    }
    else {
      if (value > 7) {

      }
    }
  }
}













//import 'package:flutter/material.dart';
//import 'CardItemModel.dart';

//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Flutter Demo',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: LoginPage(),
//      debugShowCheckedModeBanner: false,
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
//
//  var appColors = [Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(133, 121, 101, 1.0),Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(233, 121, 101, 2.0),Color.fromRGBO(40, 128, 213, 1.0),Color.fromRGBO(49, 138, 223, 1.0),Color.fromRGBO(59, 138, 223, 1.0),Color.fromRGBO(69, 138, 223, 1.0)];
//  String currentProfilePic =
//      "https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg";
//  var cardIndex = 0;
//  ScrollController scrollController;
//  var currentColor = Color.fromRGBO(99, 138, 223, 1.0);
//
//  var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Notifications", Icons.notifications, 9, 0.83),CardItemModel("Actions", Icons.call_to_action, 12, 0.24),CardItemModel("WorkTask", Icons.group_work, 7, 0.32),CardItemModel("Service Request", Icons.question_answer, 7, 0.32),CardItemModel("Capital Projects", Icons.home, 9, 0.83),CardItemModel("Lease Accountant Projects", Icons.account_box, 9, 0.83),CardItemModel("Lease Administrator Projects", Icons.perm_identity, 9, 0.83)];
//
//  AnimationController animationController;
//  ColorTween colorTween;
//  CurvedAnimation curvedAnimation;
//
//  @override
//  void initState() {
//    super.initState();
//    scrollController = new ScrollController();
//  }
//  Widget get personImage {
//    return Container(
//      width: 60.0,
//      height: 60.0,
//      decoration: BoxDecoration(
//        shape: BoxShape.circle,
//        image: DecorationImage(
//          fit: BoxFit.cover,
//          image: NetworkImage(currentProfilePic),
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      backgroundColor: currentColor,
//      appBar: new AppBar(
//        title: new Text("Tririga Application", style: TextStyle(fontSize: 20.0),),
//        backgroundColor: currentColor,
//        centerTitle: true,
//        actions: <Widget>[
//          Padding(
//            padding: const EdgeInsets.only(right: 16.0),
//            child: Icon(Icons.search),
//          ),
//        ],
//        elevation: 0.0,
//      ),
//      body: new Center(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Row(),
//            Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 5.0),
//              child: Text("TCS INTERNAL", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.white),textAlign: TextAlign.center,),
//            ),
//
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
//              child: Container(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.symmetric(vertical: 10.0),
//                      child: personImage,
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
//                      child: Text("Hello, Shivam", style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w400),),
//                    ),
//                    Text("Looks like feel good.", style: TextStyle(color: Colors.white),),
//                    Text("You have 3 tasks to do today.", style: TextStyle(color: Colors.white,),),
//                  ],
//                ),
//              ),
//            ),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
//                  child: Text("TODAY : JUL 21, 2018", style: TextStyle(color: Colors.white),),
//                ),
//                Container(
//                  height: 155.0,
//                  child:
//                  ListView.builder(
//                    itemCount: cardsList.length,
//                    controller: scrollController,
//                    scrollDirection: Axis.horizontal,
//                    itemBuilder: (context, position) {
//                      return GestureDetector(
//                        child: Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Card(
//                            child: Container(
//                              width: 230.0,
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: Row(
//                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                      children: <Widget>[
//                                        Icon(cardsList[position].icon, color: appColors[position],),
//                                      ],
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: Column(
//                                      crossAxisAlignment: CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Padding(
//                                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                                          child: Text("${cardsList[position].tasksRemaining} Tasks", style: TextStyle(color: Colors.grey),),
//                                        ),
//                                        Padding(
//                                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                                          child: Text("${cardsList[position].cardTitle}", style: TextStyle(fontSize: 15.0),),
//                                        ),
//                                        Padding(
//                                          padding: const EdgeInsets.all(8.0),
//                                          child: LinearProgressIndicator(value: cardsList[position].taskCompletion,),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(10.0)
//                            ),
//                          ),
//                        ),
//                        onTap: ()
//                        {
//                          if(cardIndex == 0) {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => new PersonalCard()),
//                            );
//                          }
//                          else if(cardIndex == 2) {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => new IntermediateAction()),
//                            );
//                          }
//                          else if(cardIndex == 1) {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => new NotificationCard()),
//                            );
//                          }
//                          else if(cardIndex == 3) {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => new IntermediateTask()),
//                            );
//                          }
//                          else
//                            {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => IntermediateSR()),
//                              );
//                            }
//
//                        },
//                        onVerticalDragStart: (details)
//                        {
//
//                        },
//                        onHorizontalDragEnd: (details) {
//                          animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
//                          curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
//                          animationController.addListener(() {
//                            setState(() {
//                              currentColor = colorTween.evaluate(curvedAnimation);
//                            });
//                          });
//                          print(details.velocity.pixelsPerSecond.dx);
//                          if(details.velocity.pixelsPerSecond.dx > 0) {
//                            if(cardIndex>0) {
//                              print("up $cardIndex");
//                              cardIndex--;
//                              colorTween = ColorTween(begin:currentColor,end:appColors[cardIndex]);
//                            }
//                          }else {
//                            if(cardIndex<5) {
//                              print("down $cardIndex");
//                              cardIndex++;
//                              if(cardIndex >= 5) {
//                                print("greter $cardIndex");
//                                cardIndex = 4;
//                              }
//                              colorTween = ColorTween(begin: currentColor,
//                                  end: appColors[cardIndex]);
//                            }
//
//                          }
//                          setState(() {
//                            scrollController.animateTo((cardIndex)*200.0, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
//                            print("called");
//                          });
//
//                          colorTween.animate(curvedAnimation);
//
//                          animationController.forward( );
//
//                        },
//                      );
//                    },
//                  ),
//                ),
//              ],
//            )
//          ],
//        ),
//      ),
//      drawer: Drawer(),
//    );
//  }
//}