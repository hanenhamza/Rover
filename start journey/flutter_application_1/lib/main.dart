import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Gender? _gender;

  @override
  Widget build(BuildContext context) {
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
                'Start Journey',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          actions: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            SizedBox(width: 10.0),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0),
                buildLabelAndTextField('From', Icons.location_on, 'Street no 7, Mahalla,Gharbia'),
                SizedBox(height: 20.0),
                buildLabelAndTextField('To', Icons.location_on, 'Street no 7, Mahalla,Gharbia'),
                SizedBox(height: 20.0),
                buildLabelAndTextField('Salary', Icons.attach_money, '\$2000'),
                SizedBox(height: 20.0),
                buildLabelAndTextField('Time', Icons.access_time, '4:00 am'),
                SizedBox(height: 20.0),
                buildLabelAndTextField('Date', Icons.calendar_today, '20-10-2020'),
                SizedBox(height: 20.0),
                buildCarKindSelection(),
                SizedBox(height: 20.0),
                buildLabelAndTextField('Seats available', Icons.event_seat, '2'),
                SizedBox(height: 20.0),
                buildGenderSelection(),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabelAndTextField(String label, IconData icon, String exampleText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0), // Bold font
        ),
        SizedBox(height: 10.0),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: label,
                hintText: exampleText,
                icon: Icon(icon, color: Colors.red),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCarKindSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Car Kind',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0), // Bold font
        ),
        SizedBox(height: 10.0),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              items: <String>['Marseds', 'Toyota', 'Nissan', 'BMW'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              icon: Icon(Icons.arrow_drop_down, color: Colors.red), // Dropdown icon
              underline: Container( // Remove default underline
                height: 0,
              ),
              isExpanded: true, // Allow the dropdown to occupy the full width
              hint: Text('Select Car Kind'), // Displayed when no value is selected
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0), // Bold font
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            Radio(
              value: Gender.Female,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            Text('Female'),
            Radio(
              value: Gender.Male,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            Text('Male'),
            Radio(
              value: Gender.Other,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            Text('Other'),
          ],
        ),
      ],
    );
  }
}

enum Gender {
  Female,
  Male,
  Other,
}
