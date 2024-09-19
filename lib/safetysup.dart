import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Safetysup extends StatefulWidget {
  const Safetysup({super.key});

  @override
  State<Safetysup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Safetysup> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Variables to store checklist values
  bool wearingPPE = false;
  bool fireExtinguisher = false;
  bool firstAidKit = false;
  bool safetyTraining = false;
  bool equipmentInspected = false;

  bool hazardousMaterialDisposal = false;
  bool wasteManagement = false;
  bool energyEfficient = false;
  bool emissionControls = false;
  bool waterConservation = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
     _tabController.addListener(() {
      // if (_tabController.index == 2) {  // This checks if SHIFT OUT tab is clicked
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => Safetysup()),
      //   );
      // }
    });
  }

  // Function to save checklist data (you can extend this to store the values in SharedPreferences)
  Future<void> _submitChecklist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('wearingPPE', wearingPPE);
    await prefs.setBool('fireExtinguisher', fireExtinguisher);
    await prefs.setBool('firstAidKit', firstAidKit);
    await prefs.setBool('safetyTraining', safetyTraining);
    await prefs.setBool('equipmentInspected', equipmentInspected);

    await prefs.setBool('hazardousMaterialDisposal', hazardousMaterialDisposal);
    await prefs.setBool('wasteManagement', wasteManagement);
    await prefs.setBool('energyEfficient', energyEfficient);
    await prefs.setBool('emissionControls', emissionControls);
    await prefs.setBool('waterConservation', waterConservation);

    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Checklist submitted successfully!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              Text(
                'Workplace Safety Checklist',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              // Workplace Safety Checklist
              CheckboxListTile(
                title: Text('Wearing proper personal protective equipment (PPE)'),
                value: wearingPPE,
                onChanged: (newValue) {
                  setState(() {
                    wearingPPE = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Fire extinguisher is accessible and functional'),
                value: fireExtinguisher,
                onChanged: (newValue) {
                  setState(() {
                    fireExtinguisher = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('First-aid kit is available and stocked'),
                value: firstAidKit,
                onChanged: (newValue) {
                  setState(() {
                    firstAidKit = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Completed safety training and emergency procedures'),
                value: safetyTraining,
                onChanged: (newValue) {
                  setState(() {
                    safetyTraining = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('All equipment has been inspected before use'),
                value: equipmentInspected,
                onChanged: (newValue) {
                  setState(() {
                    equipmentInspected = newValue ?? false;
                  });
                },
              ),

              SizedBox(height: 20),

              Text(
                'Environmental Safety Checklist',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              // Environmental Safety Checklist
              CheckboxListTile(
                title: Text('Proper disposal of hazardous materials'),
                value: hazardousMaterialDisposal,
                onChanged: (newValue) {
                  setState(() {
                    hazardousMaterialDisposal = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Waste management practices are followed'),
                value: wasteManagement,
                onChanged: (newValue) {
                  setState(() {
                    wasteManagement = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Energy-efficient practices are in place'),
                value: energyEfficient,
                onChanged: (newValue) {
                  setState(() {
                    energyEfficient = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Emission controls and limits are adhered to'),
                value: emissionControls,
                onChanged: (newValue) {
                  setState(() {
                    emissionControls = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Water conservation measures are in effect'),
                value: waterConservation,
                onChanged: (newValue) {
                  setState(() {
                    waterConservation = newValue ?? false;
                  });
                },
              ),

              SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  _submitChecklist(); // Save the checklist data when pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'SUBMIT CHECKLIST',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
