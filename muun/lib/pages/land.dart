import 'package:flutter/material.dart';

class Land extends StatelessWidget {
  const Land({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top navigation bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'WhereToStream',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Home',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(width: 15),
                        Text(
                          'New',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Popular',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Tracking',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                // Center content
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Find movies & TV shows',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Discover where and how to stream movies and TV shows',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    // Search bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          hintText: 'What are you looking for?',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Streaming platforms
                    Wrap(
                      spacing: 20,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildPlatformIcon('assets/apple_tv.png', 'Apple TV'),
                        _buildPlatformIcon('assets/netflix.png', 'Netflix'),
                        _buildPlatformIcon('assets/paramount.png', 'Paramount+'),
                        _buildPlatformIcon('assets/hbomax.png', 'HBO Max'),
                        _buildPlatformIcon('assets/prime_video.png', 'Prime Video'),
                        _buildPlatformIcon('assets/hulu.png', 'Hulu'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // CTA Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: const Text(
                        'See availability',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for streaming platforms
  Widget _buildPlatformIcon(String imagePath, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 25,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
