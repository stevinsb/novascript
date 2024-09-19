import 'package:flutter/material.dart';

class Shiftoutsup extends StatefulWidget {
  const Shiftoutsup({super.key});

  @override
  State<Shiftoutsup> createState() => _ShiftoutsupState();
}

class _ShiftoutsupState extends State<Shiftoutsup> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> employees = [
    "Employee 1",
    "Employee 2",
    "Employee 3",
    "Employee 4",
  ]; // You can add more employees here if needed

  @override
  void initState() {
    super.initState();
  
  _tabController = TabController(length: 3, vsync: this);
   _tabController.addListener(() {
      if (_tabController.index == 1) {  // This checks if SHIFT OUT tab is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Shiftoutsup()),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CURRENTLY SUPERVISING",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // ListView to display employee boxes
            Expanded(
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Light grey background
                        borderRadius: BorderRadius.circular(15), // Rounded corners
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[400], // Placeholder for employee avatar
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(employees[index]),
                        subtitle: Text("Description"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
