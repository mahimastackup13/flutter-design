import 'package:flutter/material.dart';
import 'screen_2.dart';

void main() {
  runApp(TeamSelectorApp());
}

class TeamSelectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TeamSelectionScreen(),
      theme: ThemeData(fontFamily: 'sans-serif'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TeamSelectionScreen extends StatefulWidget {
  @override
  _TeamSelectionScreenState createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen> {
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
    selectedTeams = List.generate(teams.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 16.0),
          ),
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
              'Select 2 teams to customize the home feed',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 16),

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
                    opacity: selectedTeams[index] ? 1.0 : 0.3,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedTeams[index]
                            ? const Color.fromARGB(255, 203, 78, 20)
                            : Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ColorFiltered(
                          colorFilter: selectedTeams[index]
                              ? ColorFilter.mode(
                                  Colors.transparent, BlendMode.multiply)
                              : ColorFilter.matrix(<double>[
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  1,
                                  0,
                                ]),
                          child: Image.asset(
                            teams[index],
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
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
              onPressed: selectedTeams.where((element) => element).length == 2
                  ? () {
                      // Collect selected team images
                      List<String> selectedTeamImages = [];
                      for (int i = 0; i < teams.length; i++) {
                        if (selectedTeams[i]) {
                          selectedTeamImages.add(teams[i]);
                        }
                      }

                      // Navigate to FootballHomeScreen with selected teams
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FootballHomeScreen(
                              // selectedTeamImages: selectedTeamImages,
                              ),
                        ),
                      );
                    }
                  : null,
              child: Text('CONTINUE', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
                minimumSize: Size(double.infinity, 50),
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

// class FootballHomeScreen extends StatelessWidget {
//   final List<String> selectedTeamImages;

//   FootballHomeScreen({required this.selectedTeamImages});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Selected Teams')),
//       body: ListView.builder(
//         itemCount: selectedTeamImages.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Image.asset(selectedTeamImages[index]),
//             title: Text('Team ${index + 1}'),
//           );
//         },
//       ),
//     );
//   }
// }
