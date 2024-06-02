import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/welcome_page_image.png'), // Replace 'background_image.jpg' with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Lift. Train. Excel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 60, // Height of the carousel container
                        child: PageView(
                          children: [
                            // Add your descriptions here
                            _buildDescription('Take control of your workouts and maximize your gains with our intuitive gym planner app.'),
                            _buildDescription('Plan, track, and achieve your fitness goals with our comprehensive gym planner app.'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(true), // Active dot
                          _buildDot(false),
                          _buildDot(false),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/home');
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Next'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 50), // Adjust spacing as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(String text) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : Colors.black87.withOpacity(0.5),
      ),
    );
  }
}
