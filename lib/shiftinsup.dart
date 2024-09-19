import 'package:basic_flutter/hackathprelogin.dart';
import 'package:basic_flutter/reportpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define your other pages
import 'shiftoutsup.dart';  // Ensure this is imported correctly
import 'safetysup.dart';    // Ensure this is imported correctly

class Shiftinsup extends StatefulWidget {
  const Shiftinsup({super.key});

  @override
  State<Shiftinsup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Shiftinsup> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedSector;
  String? selectedSetNo;
  TextEditingController empnoController = TextEditingController();
  String? selectedStatus;
  String? selectedMachine;
  TextEditingController inTimeController = TextEditingController();
  TextEditingController outTimeController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('sector', selectedSector ?? '');
    await prefs.setString('set_no', selectedSetNo ?? '');
    await prefs.setString('emp_no', empnoController.text);
    await prefs.setString('status', selectedStatus ?? '');
    await prefs.setString('machine', selectedMachine ?? '');
    await prefs.setString('Shift in', inTimeController.text);
    await prefs.setString('Shift out', outTimeController.text);

    // Show a confirmation message
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
            Tab(text: 'INFO'),
            Tab(text: 'EMPLOYEE'),
            Tab(text: 'SAFETY'),
          ],
          indicatorColor: Colors.white,
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildInfoTab(),
          Shiftoutsup(),  // Replace with the actual widget for the EMPLOYEE tab
          Safetysup(),    // Replace with the actual widget for the SAFETY tab
        ],
      ),
    );
  }

  Widget _buildInfoTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                  items: ['North', 'East', 'South', 'West'].map((String value) {
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
                  items: ['Set1', 'Set2'].map((String value) {
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

            // EMP NO Input Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EMP NO',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: empnoController,
                  decoration: InputDecoration(
                    hintText: 'Value',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        empnoController.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // STATUS Dropdown Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STATUS',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: selectedStatus,
                  items: ['In Progress', 'Delayed', 'Completed', 'Suspended'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedStatus = newValue;
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
                  'MACHINE IN USE',
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

            // SHIFT IN Input Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SHIFT IN',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: inTimeController,
                  decoration: InputDecoration(
                    hintText: 'Value',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        inTimeController.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // SHIFT OUT Input Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SHIFT OUT',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: outTimeController,
                  decoration: InputDecoration(
                    hintText: 'Value',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        outTimeController.clear();
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
            mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
            children: [
            ElevatedButton(
                onPressed: () {
                _saveData(); // Submit action here
              },
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Set the background color
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
             child: const Text(
            'SUBMIT',
            style: TextStyle(fontSize: 18),
          ),
          ),
    
    const SizedBox(width: 20), // Add space between buttons

    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReportPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Set the background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      child: const Text(
        'REPORT',
        style: TextStyle(fontSize: 18),
      ),
    ),
  ],
),
const SizedBox(height: 20),
 ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Hackathprelogin()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Set the background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      child: const Text(
        'LOGOUT',
        style: TextStyle(fontSize: 18),
      ),
    ),
          ],
        ),
      ),
    );
  }
}
