import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  // Variable to track selected value for first aid adequacy
  String _firstAidAdequacy = 'Satisfactory';

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Data saved successfully!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Status Report on Mitigation of Hazards"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "Jun 10, 2024",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "9:41 AM",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextFieldWidget(label: "1.0 Name of the Section"),
              const TextFieldWidget(label: "2.0 Name of the Supervisor"),
              const TextFieldWidget(label: "3.0 Name of the Sector"),
              const TextFieldWidget(label: "4.0 Status report for the quarter ending on"),
              const SizedBox(height: 20),
              const Text(
                "Details of Principal Hazards",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              for (int i = 1; i <= 4; i++) HazardRow(index: i),
              const SizedBox(height: 20),
              const Text(
                "Other Safety Considerations",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const TextFieldWidget(label: "Important safety works under execution requiring attention of the manager"),
              const TextFieldWidget(label: "Other important matters from the point of view of safety"),
              const SizedBox(height: 20),
              const Text(
                "First Aid Facilities Adequacy",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),

              // Adding Radio buttons for First Aid Adequacy
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text('Satisfactory'),
                    leading: Radio<String>(
                      value: 'Satisfactory',
                      groupValue: _firstAidAdequacy,
                      onChanged: (String? value) {
                        setState(() {
                          _firstAidAdequacy = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Needs Check'),
                    leading: Radio<String>(
                      value: 'Needs Check',
                      groupValue: _firstAidAdequacy,
                      onChanged: (String? value) {
                        setState(() {
                          _firstAidAdequacy = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Excellent'),
                    leading: Radio<String>(
                      value: 'Excellent',
                      groupValue: _firstAidAdequacy,
                      onChanged: (String? value) {
                        setState(() {
                          _firstAidAdequacy = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
         const Text(
          "Environment and Air quality details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10), // Adjust the height spacing
          const TextField(
            maxLines: 5,  // You can adjust the number of lines for the textbox as needed
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter details about environment and air quality...',
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
        ),
        const SizedBox(height: 40),

              
              Center(
                child: ElevatedButton(
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
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String label;
  final double? width;

  const TextFieldWidget({Key? key, required this.label, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: width ?? double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HazardRow extends StatelessWidget {
  final int index;

  const HazardRow({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: TextFieldWidget(label: "$index. List of Principal Hazards identified")),
            const SizedBox(width: 10),
            Expanded(child: TextFieldWidget(label: "Risk Rating")),
          ],
        ),
        Row(
          children: [
            Expanded(child: TextFieldWidget(label: "Control measures")),
            const SizedBox(width: 10),
            Expanded(child: TextFieldWidget(label: "Remarks, if any")),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
