import 'package:flutter/material.dart';
import 'screen_3.dart';

class FootballApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FootballHomeScreen(),
    );
  }
}

class FootballHomeScreen extends StatelessWidget {
  get child => null;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MatchDetailScreen()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/lion.png', // Replace with your image path
                            width: 40,
                            height: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                              width:
                                  8), // Optional spacing between image and text
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
                      SizedBox(height: 4),
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
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/manutd.png', // Replace with your image path
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                'Man United',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 16),
                                      Container(
                                        width: 40, // Adjust the size as needed
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors
                                              .grey, // Background color for the circle
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0,
                                                  0), // Adjust shadow position
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'vs',
                                          style: TextStyle(
                                            color: Colors.white, // Text color
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8), // Optional spacing
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.green),
                                        ),
                                        child: Text(
                                          '45+4\'',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12), // Spacing
                                      Text(
                                        'Old Trafford',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/mancity_1.png', // Replace with your image path
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                'Man City',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
              MatchCard(
                  team1: 'Arsenal',
                  team2: 'Chelsea',
                  time: '17:00',
                  venue: 'Emirates',
                  logo1: 'assets/images/arsenal_3.png',
                  logo2: 'assets/images/Chelsea.png'),
              MatchCard(
                  team1: 'Newcastle',
                  team2: 'Liverpool',
                  time: '18:30',
                  venue: 'Anfield',
                  logo1: 'assets/images/psg.png',
                  logo2: 'assets/images/liverpool1.png'),
              MatchCard(
                  team1: 'West Ham',
                  team2: 'Brighton',
                  time: '20:00',
                  venue: 'Villa Park',
                  logo1: 'assets/images/westham.png',
                  logo2: 'assets/images/brighton1.png'),
              MatchCard(
                  team1: 'Everton',
                  team2: 'Fulham',
                  time: '23:00',
                  venue: 'Goodison Park',
                  logo1: 'assets/images/everton.png',
                  logo2: 'assets/images/fulhamfc.png'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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

  MatchCard(
      {required this.team1,
      required this.team2,
      required this.time,
      required this.venue,
      required this.logo1,
      required this.logo2});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(logo1, width: 40),
        title: Text('$team1 vs $team2'),
        subtitle: Text('$venue • $time'),
        trailing: Image.asset(logo2, width: 40),
      ),
    );
  }
}
