import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ali Siraj',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 71, 235, 202),
      ),
      home: const MyHomePage(title: 'WhatsApp'),
    );
  }
}

class User {
  final String name;
  final String email;
  final String imageUrl;

  User({required this.name, required this.email, required this.imageUrl});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ChatsScreen(),
    StatusScreen(),
    CallsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            label: 'Updates',
            icon: Icon(Icons.circle_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF075E54),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPU6zF7UD-FZUj2NRfVJxgG5lbSxsY_zaLGQ&s'),
              ),
              accountName: Text("AliSiraj"),
              accountEmail: Text("Alisiraj1020@gmail.com"),
              decoration: BoxDecoration(color: Color.fromARGB(255, 27, 41, 53)),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.abc_outlined, color: Colors.white),
              title: Text('About', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Ali',
      'message': 'Assalam o Alaikum',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRJCpjXAkgZTcUEMJzIojN4D9x2hlHSmbgAA&s',
      'time': '10:30 AM',
    },
    {
      'name': 'Siraj',
      'message': 'call me',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsZBVLzCNEWIPOv-p3sDy7G5QAnzHVoFlhwg&s',
      'time': 'Yesterday',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              return Card(
                color: const Color.fromARGB(255, 23, 39, 39),
                child: ListTile(
                  leading: user['imageUrl'] != null && user['imageUrl'].isNotEmpty
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(user['imageUrl']),
                        )
                      : CircleAvatar(
                          child: Text(
                            user['name'][0],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 7, 0, 0),
                            ),
                          ),
                          backgroundColor: const Color.fromARGB(255, 255, 222, 133),
                        ),
                  title: Text(user['name']),
                  subtitle: Text(user['message']),
                  trailing: Text(
                    user['time'],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class StatusScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Ahmed',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmpYl91mPsP6c1QFvPVWePnZs0B0lO3Ik2Dw&s',
      'time': 'just now',
    },
    {
      'name': 'Hamza',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeZJHfe65ileJaDpjPxFtJSZvZfKFh_4sM9A&s',
      'time': '2 min ago',
    },
    {
      'name': 'Salman',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2gzqD9puDYlRGb0EoHEQ-oMrOjgIXQM0hig&s',
      'time': 'Yesterday, 09:30 AM',
    },
    {
      'name': 'Ali',
      'imageUrl': '',
      'time': '10 minutes ago',
    },
    {
      'name': 'Siraj',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTadSAgMa0Si3aeLKU9sPJ24i1IZX3nKOVLnA&s',
      'time': 'April 30,9:15 AM',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            var user = users[index];
            return Card(
              color: const Color.fromARGB(255, 23, 39, 39),
              child: ListTile(
                leading: user['imageUrl'] != null && user['imageUrl'].isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(user['imageUrl']),
                      )
                    : CircleAvatar(
                        child: Text(
                          user['name'][0],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 7, 0, 0),
                          ),
                        ),
                        backgroundColor: const Color.fromARGB(255, 255, 222, 133),
                      ),
                title: Text(user['name']),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        user['time'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CallsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Ahmed',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmpYl91mPsP6c1QFvPVWePnZs0B0lO3Ik2Dw&s',
      'time': '2 hours ago',
    },
    {
      'name': 'Hamza',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeZJHfe65ileJaDpjPxFtJSZvZfKFh_4sM9A&s',
      'time': '2 min ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        var user = users[index];
        return Card(
          color: const Color.fromARGB(255, 23, 39, 39),
          child: ListTile(
            leading: user['imageUrl'] != null && user['imageUrl'].isNotEmpty
                ? CircleAvatar(
                    backgroundImage: NetworkImage(user['imageUrl']),
                  )
                : CircleAvatar(
                    child: Text(
                      user['name'][0],
                      style: const TextStyle(
                        color: Color.fromARGB(255, 7, 0, 0),
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 222, 133),
                  ),
            title: Text(user['name']),
            subtitle: Text(user['time']),
          ),
        );
      },
    );
  }
}