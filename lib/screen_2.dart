import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Score App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'EALLASHOT',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildLiveScoreCard(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: _buildTodayMatchTitle(),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMatchTile('Arsenal', 'Chelsea', '17:00',
                    'assets/arsenal.png', 'assets/chelsea.png'),
                _buildMatchTile('Newcastle', 'Liverpool', '18:30',
                    'assets/newcastle.png', 'assets/liverpool.png'),
                _buildMatchTile('West Ham', 'Brighton', '20:00',
                    'assets/west-ham-united.png', 'assets/brighton.png'),
                _buildMatchTile('Everton', 'Fulham', '23:00',
                    'assets/everton.png', 'assets/Fulham.png'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildLiveScoreCard() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Colors.redAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Premier League - Week 10',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset('assets/manutd.png', width: 50, height: 50),
                    const SizedBox(height: 5),
                    const Text('Man United',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      '4 - 2',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('45+4\'', style: TextStyle(color: Colors.greenAccent)),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/mancity.png', width: 50, height: 50),
                    const SizedBox(height: 5),
                    const Text('Man City',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Old Trafford',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayMatchTitle() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.sports_soccer, color: Colors.purple),
        SizedBox(width: 10),
        Text(
          'Today Match',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMatchTile(String homeTeam, String awayTeam, String time,
      String homeLogo, String awayLogo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Image.asset(homeLogo, width: 40, height: 40),
        title: Text('$homeTeam vs $awayTeam'),
        subtitle: Text(time),
        trailing: Image.asset(awayLogo, width: 40, height: 40),
      ),
    );
  }
}
