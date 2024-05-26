import 'package:flutter/material.dart';
import 'package:mygym/src/presentation/pages/workout.details.page.dart';

class MyHomePage extends StatelessWidget {
  static const String HELLO = 'hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My gym'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Sidebar Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/page1');
              },
            ),
            ListTile(
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/page2');
              },
            ),
            ListTile(
              title: const Text('Workout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/workout');
              },
            ),
            ListTile(
              title: const Text('Add exercise'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/add-exercise');
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                SizedBox(width: 20),
                Text(
                  'HELLO',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.star, size: 40, color: Colors.amber),
                title: Text(
                  'Achievements',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('5 Achievements unlocked'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              child: ListTile(
                leading:
                    Icon(Icons.check_circle, size: 40, color: Colors.green),
                title: Text(
                  'Objectives Completed',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('10 Objectives completed'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.access_time, size: 40, color: Colors.blue),
                title: Text(
                  'Time Spent',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('25 hours spent'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Last Workout',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Date: May 17, 2024',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Workout: Cardio Blast',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    const LinearProgressIndicator(
                      value: 0.75,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text('View Details'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WorkoutDetailsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
