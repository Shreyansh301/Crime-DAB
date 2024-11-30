import 'package:firebase_auth/firebase_auth.dart';
import 'package:crime_dap/auth.dart';
import 'package:flutter/material.dart';
import 'crime_alert_page.dart';
import 'crime_report_page.dart';
import 'post_feed_page.dart';
import 'account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  int _selectedIndex = 0; // Keep track of selected tab

  // List of pages for navigation
  static const List<Widget> _pages = <Widget>[
    CrimeAlertPage(),
    CrimeReportPage(),
    PostFeedPage(),
    AccountPage(),
  ];

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crime DAB'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                _userUid(),
                _signOutButton(),
              ],
            ),
          ),
          // Display the page corresponding to the selected index
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Crime Alert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Crime Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Post Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle tab change
        selectedItemColor: Colors.blue, // Set color for selected item
        unselectedItemColor: Colors.black, // Set color for unselected items
      ),
    );
  }
}
