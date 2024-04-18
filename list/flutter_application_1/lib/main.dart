import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.red, // تعيين لون الخلفية الأحمر للشريط العلوي
      ),
      drawer: NavigationDrawer(),
      body: Center(
        
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black.withOpacity(0.8),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/profile_image.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'rover',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        '9876543210',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            buildListTileWithArrow(Icons.person, 'Profile'),
            buildListTileWithArrow(Icons.settings, 'Setting'),
            buildListTileWithArrow(Icons.support, 'Support'),
            buildListTileWithArrow(Icons.trip_origin, 'My Trips'),
            buildListTileWithArrow(Icons.local_offer, 'Any Service'),
            buildListTileWithArrow(Icons.security, 'Safety'),
          ],
        ),
      ),
    );
  }

  Widget buildListTileWithArrow(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.red.withOpacity(0.9)),
      title: Text(title, style: TextStyle(color: Colors.white.withOpacity(0.9))),
      trailing: Icon(Icons.arrow_forward, color: Colors.red.withOpacity(0.9)),
      onTap: () {
        // Handle onTap
      },
    );
  }
}
