import 'package:flutter/material.dart';import 'package:flutter/material.dart';

void main() {
  runApp(ButtonNavigationBar());
}

class ButtonNavigationBar extends StatefulWidget {
  @override
  _ButtonNavigationBarState createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
  @override
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("prueba"),
        ),
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
            builder: (context) =>
                Container(
                    color: Colors.blue, child: Center(child: Text("Account"))));
      case "Settings":
        return MaterialPageRoute(
            builder: (context) =>
                Container(
                    color: Colors.green,
                    child: Center(child: Text("Settings"))));
      default:
        return MaterialPageRoute(
            builder: (context) =>
                Container(
                    color: Colors.white, child: Center(child: Text("Home"))));
    }
  }
}
