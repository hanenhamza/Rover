import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.red),
            onPressed: () {
              // Handle back button press
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How To Use',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: buildSteps(mediaQuery),
        ),
      ),
    );
  }

  Widget buildSteps(MediaQueryData mediaQuery) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: mediaQuery.size.height / 2), // Add empty space
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Steps',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        buildStep(mediaQuery, '1. The first and last name must not exceed 50 characters.'),
        buildStep(mediaQuery, '2. The email should be in standard format.'),
        buildStep(
            mediaQuery,
            '3. The password must be strong, composed of a combination of letters, numbers, and symbols (ASCII characters only), without diacritical marks or special characters.'),
        buildStep(mediaQuery, '4. Password confirmation is required.'),
        buildStep(
            mediaQuery,
            '5. In case of forgotten password or unauthorized account access, a confirmation code is sent for user verification or account recovery.'),
        buildStep(mediaQuery, '6. Each user is assigned a unique identification number upon data entry.'),
        buildStep(
            mediaQuery,
            '7. During new account creation, the system checks if the email is already registered. If so, a message is sent indicating that the email is already in the database.'),
      ],
    );
  }

  Widget buildStep(MediaQueryData mediaQuery, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32, // Increase the width of the Container for larger bullet points
            height: 32, // Increase the height of the Container for larger bullet points
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red, // Set color of the circle to red
            ),
            child: Center(
              child: Text(
                text.substring(0, 1), // Display the number from the text
                style: TextStyle(fontSize: 18, color: Colors.white), // Increase font size and set color to white
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text.substring(3), // Remove the number from the text
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
