import 'package:flutter/material.dart';

class SimpleTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabs Demo'),
          bottom: TabBar(
            tabs: <Tab>[
              Tab(icon: Icon(Icons.person),),
              Tab(icon: Icon(Icons.email),)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text('Person')),
            Center(child: Text('Email')),
          ],
        ),
      ),
    );
  }
}

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({Key key}) : super(key: key);
  @override
    State<StatefulWidget> createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage>
  with SingleTickerProviderStateMixin {
    TabController controller;
    @override
      void initState() {
        super.initState();
        controller = TabController(length: 2, vsync: this);
      }
    @override
    Widget build(BuildContext context) {
      return SafeArea(child: Scaffold(
        bottomNavigationBar: Material(
          child: TabBar(
            tabs: <Tab>[
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.email)),
            ],
            controller: controller,
          ),
          color: Colors.blue,
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text('Person'),),
            Center(child: Text('Email'),),
          ],
          controller: controller,
        )
      ),
      );
    }
}