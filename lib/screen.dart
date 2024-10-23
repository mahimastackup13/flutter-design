import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FavoriteTeamScreen(),
    );
  }
}

class FavoriteTeamScreen extends StatefulWidget {
  const FavoriteTeamScreen({super.key});

  @override
  _FavoriteTeamScreenState createState() => _FavoriteTeamScreenState();
}

class _FavoriteTeamScreenState extends State<FavoriteTeamScreen> {
  List<String> teamLogos = [
    'assets/images/arsenal_2.png',
    'assets/images/tottenham.png',
    'assets/images/Chelsea.png',
    'assets/images/liverpool.png',
    'assets/images/brighton.png',
    'assets/images/mancity.png',
    'assets/images/manutd.png',
    'assets/images/Fulham.png',
    'assets/images/crystal palace.png',
    'assets/images/wolverhampton.png',
    'assets/images/AFC.png',
    'assets/images/brentford.png',
    'assets/images/forest.png',
    'assets/images/lufc.png',
    'assets/images/west-ham-united.png',
  ];

  List<bool> isSelected = List.generate(20, (index) => false);
  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('What is Your Favorite Team?',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'assets/fonts/Sans Serif Font Family/Roboto-Bold.ttf',
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              'Select 3 teams to customize the home feed',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                itemCount: teamLogos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedCount < 3 || isSelected[index]) {
                          isSelected[index] = !isSelected[index];
                          selectedCount += isSelected[index] ? 1 : -1;
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: isSelected[index]
                          ? Colors.red[700]
                          : Colors.grey[300],
                      child: Image.asset(teamLogos[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: selectedCount == 3 ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              ),
              child: const Text(
                'CONTINUE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamSelectionScreen extends StatefulWidget {
  const TeamSelectionScreen({super.key});

  @override
  _TeamSelectionScreenState createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen> {
  late List<bool> selectedTeams;

  @override
  void initState() {
    super.initState();
    // Initialize the list to track selected teams
    selectedTeams = List.generate(teams.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(16),
          children: List.generate(teams.length, (index) {
            bool isSelected = selectedTeams[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTeams[index] = !selectedTeams[index];
                });
              },
              child: Stack(
                children: [
                  // Circle Background with Grey or Red color
                  ClipOval(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.red : Colors.grey[400],
                      ),
                    ),
                  ),
                  // Team Logo
                  Center(
                    child: SizedBox(
                      width: 60, // Adjust logo size here
                      height: 60,
                      child: Image.asset(
                        teams[index].logoPath,
                        fit: BoxFit
                            .contain, // Keep the logos contained in the same size
                        color: isSelected
                            ? null
                            : Colors.grey, // Apply grey color if not selected
                        colorBlendMode: isSelected ? null : BlendMode.modulate,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Continue button action
          },
          child: const Text("CONTINUE"),
        ),
      ),
    );
  }
}

// Sample team data
class Team {
  final String name;
  final String logoPath;
  Team(this.name, this.logoPath);
}

// List of teams (replace with your image paths)
List<Team> teams = [
  Team('Arsenal', 'assets/arsenal_2png'),
  Team('Tottenham', 'assets/tottenham.png'),
  Team('Chelsea', 'assets/chelsea.png'),
  // Add more teams as necessary...
];
