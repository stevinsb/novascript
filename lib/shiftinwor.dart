import 'package:basic_flutter/hackathlogin.dart';
import 'package:basic_flutter/safetyinwor.dart';
import 'package:basic_flutter/shiftoutwor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shiftinwor extends StatefulWidget {
  const Shiftinwor({super.key});

  @override
  State<Shiftinwor> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Shiftinwor> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isMultiline = false;
  TextEditingController Name = TextEditingController();
  String? selectedSector;
  String? selectedSetNo;
  String? selectedMachine;
  String? selectedwork;
  String? inTimeController;
  TextEditingController supervisor_id = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    // Create TabController with 3 tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Name',Name.text );
    await prefs.setString('in_time', inTimeController ?? '');
    await prefs.setString('work', selectedwork ?? '');
    await prefs.setString('sector', selectedSector ?? '');
    await prefs.setString('set_no', selectedSetNo ?? '');
    await prefs.setString('machine', selectedMachine ?? '');
    await prefs.setString('supervisor_id', supervisor_id.text);

    // Show a confirmation message or navigate to another page
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Data saved successfully!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shift Management'),
        backgroundColor: Colors.purple,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Jun 10, 2024\n9:41 AM",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'SHIFT IN'),
            Tab(text: 'SHIFT OUT'),
            Tab(text: 'SAFETY'),
          ],
          indicatorColor: Colors.white,
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // First Tab Content (SHIFT IN)
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FULL NAME',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: Name,
                    decoration: InputDecoration(
                      hintText: 'Value',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          Name.clear();
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
                  // IN TIME Input Field
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IN TIME',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: inTimeController,
                        items: ['6AM','2PM','10PM'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            inTimeController = newValue;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // WORK Input Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WORK',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: selectedwork,
                        items: ['Open Coast', 'Underground'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedwork = newValue;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // SECTOR Dropdown Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SECTOR',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: selectedSector,
                        items: ['North Zone', 'East Zone', 'South Zone', 'West Zone'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedSector = newValue;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // SET NO Dropdown Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SET NO',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: selectedSetNo,
                        items: ['Set 01', 'Set 02'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedSetNo = newValue;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // MACHINE Dropdown Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MACHINE',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: selectedMachine,
                        items: ['Dragline', 'Shovel', 'Dumper', 'Dozer', 'Drill'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedMachine = newValue;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SUPERVISOR ID',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: supervisor_id,
                        decoration: InputDecoration(
                          hintText: 'Value',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              supervisor_id.clear();
                            },
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),


                  // Submit Button
                 Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,  // Align the buttons with space between them
  children: [
    // My Location Icon Button
    IconButton(
      onPressed: () {
        // Add your location button functionality here
      },
      icon: Icon(Icons.my_location, color: Colors.blue),  // Set the icon and color
      iconSize: 30,  // Adjust the icon size if needed
    ),

    // Submit Button
    ElevatedButton(
      onPressed: () {
        _saveData(); // Submit action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Set the background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      child: Text(
        'SUBMIT',
        style: TextStyle(fontSize: 18, color: Colors.white),  // Set font size and color
      ),
    ),
  ],
),

                ],
              ),
            ),
          ),
          
          // Second Tab Content (SHIFT OUT)
          Shiftoutwor(),  // Content or Widget of the Shift Out page
          
          // Third Tab Content (SAFETY)
          Safetyinwor(),  // Content or Widget of the Safety page
        ],
      ),
    );
  }
}
