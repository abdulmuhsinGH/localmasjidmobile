import 'package:flutter/material.dart';
//import 'package:async/async.dart';

import './src/ui/MapView.dart' as MapView;
import './src/ui/ListView.dart' as MasjidListView;
//import './src/blocs/mosque_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locate Masjid',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Locate Masjid'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin  {
  //int _counter = 0;
  final  myTabs = <Tab>[
      Tab(icon:Icon(Icons.location_on)),
      Tab(icon:Icon(Icons.format_list_bulleted)),
    ];

  TabController _tabController;
  //Tab

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    //locateUser();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /* void _incrementCounter() {
    setState(() {
      //_counter++;
    });
  } */

  @override
  Widget build(BuildContext context) {
    //bloc.fetchNearestMosques();
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          MapView.MapView(),
          MasjidListView.MasjidListView()
        ],
      ) 
    );
  }
}

/* class MapView extends State {
  MapView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locate Masjid',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Locate Masjid'),
    );
  }
} */