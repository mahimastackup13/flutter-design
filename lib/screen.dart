import 'package:flutter/material.dart';

void main() {
  runApp(TeamSelectorApp());
}

class TeamSelectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TeamSelectionScreen(),
      theme: ThemeData(fontFamily: 'sans-serif'),
    );
  }
}

class TeamSelectionScreen extends StatefulWidget {
  @override
  _TeamSelectionScreenState createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen> {
  // List of team assets (replace these with actual image paths in your project)
  List<String> teams = [
    'assets/images/arsenal_3.png',
    'assets/images/tottenham.png',
    'assets/images/Chelsea.png',
    'assets/images/liverpool1.png',
    'assets/images/brighton1.png',
    'assets/images/mancity_1.png',
    'assets/images/manchester.png',
    'assets/images/fulhamfc.png',
    'assets/images/psg.png',
    'assets/images/wolver.png',
    'assets/images/everton.png',
    'assets/images/barca.png',
    'assets/images/forrest.png',
    'assets/images/lu-fc.png',
    'assets/images/westham.png',
  ];

  List<bool> selectedTeams = [];

  @override
  void initState() {
    super.initState();
    selectedTeams =
        List.generate(teams.length, (_) => false); // Initially none selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top padding and time display
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 16.0),
          ),
          // Title Text
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              'What is Your Favorite Team?',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Roboto-bold',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Select 3 teams to customize the home feed',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 16),
          // Teams Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 columns
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: teams.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (selectedTeams.where((element) => element).length < 3 ||
                        selectedTeams[index]) {
                      setState(() {
                        selectedTeams[index] = !selectedTeams[index];
                      });
                    }
                  },
                  child: Opacity(
                    opacity:
                        selectedTeams[index] ? 1.0 : 0.3, // Grey out unselected
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Makes the box circular
                        color: selectedTeams[index]
                            ? const Color.fromARGB(255, 167, 14,
                                14) // Background color when selected
                            : Colors
                                .grey[300], // Background color when unselected
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          teams[index],
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain, // Fit the logos in the circle
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Continue Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (selectedTeams.where((element) => element).length == 3) {
                  // Implement the logic after selecting 3 teams
                  print('Continue with selected teams');
                } else {
                  // Show an error if less than 3 teams are selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select exactly 3 teams.'),
                    ),
                  );
                }
              },
              child: Text('CONTINUE', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
                minimumSize: Size(double.infinity, 50), // Full-width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
