import 'package:flutter/material.dart';

void main() {
  runApp(const FootballLegendsApp());
}

class FootballLegendsApp extends StatelessWidget {
  const FootballLegendsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Legends',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/teams': (context) => const TeamsScreen(),
        '/players': (context) => const PlayersScreen(),
        '/leagues': (context) => const LeaguesScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Se connecter'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Mot de passe oublié ?'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Principal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMenuButton(
              context,
              'Top 3 des joueurs',
              'assets/images/players.png',
              '/players',
            ),
            _buildMenuButton(
              context,
              'Équipes légendaires',
              'assets/images/teams.png',
              '/teams',
            ),
            _buildMenuButton(
              context,
              'Top 5 des ligues',
              'assets/images/leagues.png',
              '/leagues',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      BuildContext context, String title, String image, String route) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        leading: Image.asset(image, width: 50, height: 50),
        title: Text(title),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> teams = [
      {'name': 'FC Barcelone', 'image': 'assets/images/barcelona.png'},
      {'name': 'Real Madrid', 'image': 'assets/images/real_madrid.webp'},
      {'name': 'Bayern Munich', 'image': 'assets/images/bayern.webp'},
    ];
    return _buildListScreen(context, 'Équipes Légendaires', teams);
  }
}

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> players = [
      {'name': 'Lionel Messi', 'image': 'assets/images/messi.png'},
      {'name': 'Diego Maradona', 'image': 'assets/images/maradona.png'},
      {'name': 'Pelé', 'image': 'assets/images/pele.png'},
    ];
    return _buildListScreen(context, 'Top 3 Joueurs', players);
  }
}

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> leagues = [
      {'name': 'Premier League', 'image': 'assets/images/premier_league.png'},
      {'name': 'Serie A', 'image': 'assets/images/serie_a.png'},
      {'name': 'La Liga', 'image': 'assets/images/la_liga.png'},
    ];
    return _buildListScreen(context, 'Top 5 Ligues', leagues);
  }
}

Widget _buildListScreen(
    BuildContext context, String title, List<Map<String, String>> items) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(items[index]['image']!, width: 50, height: 50),
            title: Text(items[index]['name']!),
          ),
        );
      },
    ),
  );
}
