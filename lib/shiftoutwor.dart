import 'package:basic_flutter/hackathprelogin.dart';
import 'package:basic_flutter/safetyinwor.dart';
import 'package:basic_flutter/shiftinwor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shiftoutwor extends StatefulWidget {
  const Shiftoutwor({super.key});

  @override
  State<Shiftoutwor> createState() => _ShiftoutworState();
}

class _ShiftoutworState extends State<Shiftoutwor> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedStatus;
  String? outTimeController;
  TextEditingController Name = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController extractController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
       _tabController.addListener(() {
      
       if (_tabController.index == 1) {  // This checks if SAFETY tab is clicked
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Shiftoutwor()),  // Navigate to the Checklist screen
    );
  }
    });
  }
  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Name',Name.text );
    await prefs.setString('out_time', outTimeController ?? '');
    await prefs.setString('area',areaController.text );
    await prefs.setString('extract', extractController.text);
    await prefs.setString('status', selectedStatus ?? '');
    await prefs.setString('notes', notesController.text);
    await prefs.setString('Enter the amount coal collected', amount.text);

    // Show a confirmation message or navigate to another page
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Data saved successfully!'),
    ));
  }

  // @override
  // void dispose() {
  //   _tabController1.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
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
              // OUT TIME Input Field
               Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OUT TIME',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: outTimeController,
                        items: ['2PM','10PM','6AM'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            outTimeController = newValue;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
              // AREA Input Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AREA',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: areaController,
                    decoration: InputDecoration(
                      hintText: 'Value',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          areaController.clear();
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // EXTRACT Input Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EXTRACT',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: extractController,
                    decoration: InputDecoration(
                      hintText: 'Value',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          extractController.clear();
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
                    items: ['In Progress', 'Delayed', 'Completed', 'Suspended']
                        .map((String value) {
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

              // NOTES Input Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NOTES',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      hintText: 'Value',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          notesController.clear();
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ENTER THE AMOUNT OF COAL COLLECTED',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: amount,
                    decoration: InputDecoration(
                      hintText: 'Value',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          amount.clear();
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                   _saveData();// Submit action here
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
                  style: TextStyle(fontSize: 18),
                ),
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
      ),
    );
  }
}
