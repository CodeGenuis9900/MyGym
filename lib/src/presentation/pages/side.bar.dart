import 'package:flutter/material.dart';
import 'package:mygym/src/utils/app.colors.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[200], // Set the background color for the entire drawer
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.blueV1, // Set header color
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("resources/images/image_avatar.jpg"),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Good Morning, Dude!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.pages),
                  title: const Text('Page 1'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/page1');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.pages),
                  title: const Text('Page 2'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/page2');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.fitness_center),
                  title: const Text('Workout'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/workout');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: const Text('Add Exercise'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/add-exercise');
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    Navigator.pop(context);
                    // Add your logout functionality here
                  },
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
