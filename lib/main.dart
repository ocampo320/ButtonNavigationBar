import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationBar(title: 'Flutter Demo Home Page'),
    );
  }
}

class NavigationBar extends StatefulWidget {
  NavigationBar({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  // This navigator state will be used to navigate different pages
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("Account");
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed("Settings");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text("Account")),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Settings"),
        )
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Account":
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.blue, child: Center(child: Text("Account"))));
      case "Settings":
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.green, child: Center(child: Text("Settings"))));
      default:
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.white, child: Center(child: Text("Home"))));
    }
  }
}
