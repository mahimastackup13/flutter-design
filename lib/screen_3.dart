import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MatchDetailScreen(),
    // debugShowCheckedModeBanner: false,
  ));
}

class MatchDetailScreen extends StatelessWidget {
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
            Image.asset('assets/images/manutd.png', width: 40),
            Row(
              children: [
                Text(
                  '4',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.greenAccent),
                  ),
                  child: Text(
                    '45+4\'',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/mancity_1.png', width: 40),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTimelineItem(
              time: '43\'',
              title: 'GOOOL!!!',
              player: 'Frederico Rodrigues Santos',
              assist: 'Goal Assist: Harry Maguire',
              isHighlight: true,
              homeScore: '3',
              awayScore: '2',
              playerImage: 'assets/images/player1.webp',
            ),
            _buildTimelineItem(
              time: '42\'',
              title: 'GOOOL!!!',
              player: 'Ilkay Gündoğan',
              assist: 'Goal Assist: Kevin De Bruyne',
              isHighlight: true,
              homeScore: '2',
              awayScore: '2',
              playerImage: 'assets/images/player2.webp',
            ),
            _buildTimelineItem(
              time: '34\'',
              title: 'Yellow Card',
              player: 'Frederico Rodrigues Santos',
              assist: null,
              isHighlight: false,
              playerImage: 'assets/images/player1.webp',
            ),
            _buildSubstitutionItem(
              time: '25\'',
              inPlayer: 'Bruno Fernandes',
              outPlayer: 'W. Weghorst',
              inPlayerImage: 'assets/images/player3.webp',
              outPlayerImage: 'assets/images/player4.jpg',
            ),
            _buildTimelineItem(
              time: '17\'',
              title: 'Yellow Card',
              player: 'Phil Foden',
              assist: null,
              isHighlight: false,
              playerImage: 'assets/images/player5.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required String time,
    required String title,
    required String player,
    String? assist,
    required bool isHighlight,
    String? homeScore,
    String? awayScore,
    required String playerImage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHighlight ? Colors.purple[900] : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isHighlight ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (homeScore != null && awayScore != null)
                  Row(
                    children: [
                      Image.asset('assets/images/manutd.png', width: 20),
                      Text(
                        ' $homeScore - $awayScore ',
                        style: TextStyle(
                          color: isHighlight ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Image.asset('assets/images/mancity_1.png', width: 20),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player,
                      style: TextStyle(
                        color: isHighlight ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (assist != null)
                      Text(
                        assist,
                        style: TextStyle(
                          color:
                              isHighlight ? Colors.white70 : Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(playerImage),
                  radius: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubstitutionItem({
    required String time,
    required String inPlayer,
    required String outPlayer,
    required String inPlayerImage,
    required String outPlayerImage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Substitution',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'IN',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      inPlayer,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(inPlayerImage),
                  radius: 20,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OUT',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      outPlayer,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(outPlayerImage),
                  radius: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
