import 'package:flutter/material.dart';
import 'screen_3.dart'; // Make sure 'screen_3.dart' contains the FavoritesScreen or required screen
import 'screen.dart'; // Make sure 'screen.dart' contains the correct screen

class FootballApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FootballHomeScreen(),
    );
  }
}

class FootballHomeScreen extends StatefulWidget {
  @override
  _FootballHomeScreenState createState() => _FootballHomeScreenState();
}

class _FootballHomeScreenState extends State<FootballHomeScreen> {
  int selectedIndex = 0; // Track the selected index for the BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Update the selected tab
    });

    // Optionally, you can navigate to the corresponding screen
    if (index == 4) {
      // Index 4 corresponds to the 'Favorites' tab
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TeamSelectionScreen()), // Make sure FavoritesScreen is correctly defined
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'EALLASHOT',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'sans-serif Italic',
              ),
            ),
            Icon(Icons.search, color: Colors.black),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MatchDetailScreen()),
              );
            },
            child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.blue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Image.asset(
                            'assets/images/lion.png', // Replace with your image path
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Premier League',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Week 10',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/manutd.png',
                                width: 90,
                                height: 90,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Man United',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Vertically center all children
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Horizontally center the scores and 'vs'
                                children: [
                                  Text(
                                    '4', // Team 1 score
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          15), // Space between the score and 'vs'
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'vs',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          15), // Space between 'vs' and the next score
                                  Text(
                                    '2', // Team 2 score
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      0.1), // Space between the score and time/venue
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Text(
                                  '45+4\'', // Time
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Old Trafford',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/mancity_1.png',
                                    width: 90,
                                    height: 90,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Man City',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          SizedBox(height: 16),
          Text(
            'Today Match',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          // Adding MatchCard widgets here
          MatchCard(
            team1: 'Arsenal',
            team2: 'Chelsea',
            time: '17:00',
            venue: 'Emirates',
            logo1: 'assets/images/arsenal_3.png',
            logo2: 'assets/images/Chelsea.png',
          ),
          MatchCard(
            team1: 'Newcastle',
            team2: 'Liverpool',
            time: '18:30',
            venue: 'Anfield',
            logo1: 'assets/images/psg.png',
            logo2: 'assets/images/liverpool1.png',
          ),
          MatchCard(
            team1: 'West Ham',
            team2: 'Brighton',
            time: '20:00',
            venue: 'Villa Park',
            logo1: 'assets/images/westham.png',
            logo2: 'assets/images/brighton1.png',
          ),
          MatchCard(
            team1: 'Everton',
            team2: 'Fulham',
            time: '23:00',
            venue: 'Goodison Park',
            logo1: 'assets/images/everton.png',
            logo2: 'assets/images/fulhamfc.png',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final String team1;
  final String team2;
  final String time;
  final String venue;
  final String logo1;
  final String logo2;

  MatchCard({
    required this.team1,
    required this.team2,
    required this.time,
    required this.venue,
    required this.logo1,
    required this.logo2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Team 1 details
          Row(
            children: [
              Image.asset(
                logo1,
                width: 40,
                height: 40,
              ),
              SizedBox(width: 8),
              Text(
                team1,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Time and Venue
          Column(
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                venue,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          // Team 2 details
          Row(
            children: [
              Text(
                team2,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Image.asset(
                logo2,
                width: 40,
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
