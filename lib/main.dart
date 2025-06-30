import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/pages/DiscussionPage.dart';
import 'package:flutter_project/pages/NewReleasespage.dart';
import 'package:flutter_project/pages/homepage.dart';
import 'package:flutter_project/pages/settings.dart';
import 'package:flutter_project/pages/help&faq.dart';
import 'package:flutter_project/pages/contactsupport.dart';
import 'package:flutter_project/pages/account.dart';
import 'package:flutter_project/loginpages/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_project/pages/SearchPage.dart';
import 'package:flutter_project/pages/BookListPage.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyDWxb7WMIg92UxC4kyRv8fVS337XT1o31s",
        appId: "1:184626401841:web:2c178f2f118adce052fb10",
        messagingSenderId: "184626401841",
        projectId: "book-list-2ef47"));
  }
  else{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BookList",
      theme: ThemeData(primarySwatch: Colors.teal),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyBookList",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        titleSpacing: 05.5,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.teal[400],
        actions: [
          IconButton(
              onPressed: () {
                mysnackbar("Web", context);
              },
              icon: const Icon(Icons.cloud_rounded),
              color: Colors.white),
          IconButton(
              onPressed: () {
                mysnackbar("Notification", context);
              },
              icon: const Icon(Icons.notifications),
              color: Colors.white),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded),
            label: 'Discussion',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases_rounded),
            label: 'New Releases',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            label: "My List",
            backgroundColor: Colors.teal,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      drawer: Drawer(
        child:
        ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Waresur Rahman"),
              accountEmail: Text("xyz@example.com"),
              currentAccountPicture: CircleAvatar(
                radius: 60,
                backgroundImage:
                NetworkImage("https://live.staticflickr.com/65535/52259221868_53dae692b6_h.jpg"),
                foregroundImage:
                NetworkImage("https://static.vecteezy.com/system/resources/previews/016/724/121/non_2x/pain-tendo-akatsuki-free-vector.jpg"),

              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(image:
                NetworkImage("https://live.staticflickr.com/65535/52259221868_53dae692b6_h.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  colorFilter: ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Account'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Account()));
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              title: const Text('Help/FAQ'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpFAQPage()));
              },
            ),
            ListTile(
              title: const Text('Contact Support'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactSupportPage()));

              },
            ),
            Expanded(child: Container()), // This will push the logout tile to the bottom
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome())
                );
                // Implement logout functionality
              },
            ),
          ],
        ),
      ),
      body: _buildScenario(_selectedIndex),
    );
  }

  Widget _buildScenario(int index) {
    switch (index) {
      case 0:
        return _buildHomeScenario();
      case 1:
        return _buildDiscussionScenario();
      case 2:
        return _buildSearchScenario();
      case 3:
        return _buildNewReleasesScenario();
      case 4:
        return _buildMyListScenario();
      default:
        return _buildHomeScenario();
    }
  }

  Widget _buildHomeScenario() {
    return Scaffold(
      body: homepage(),
    );
  }

  Widget _buildDiscussionScenario() {
    return Scaffold(
      body: Discussionpage(),
    );
  }

  Widget _buildSearchScenario() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: SearchPage(),
    );
  }


  Widget _buildNewReleasesScenario() {
    return Scaffold(
      body: Newreleasespage(),
    );
  }



}
Widget _buildMyListScenario() {
  return Scaffold(
    body: BookListPage(),
  );
}


void mysnackbar(message, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
