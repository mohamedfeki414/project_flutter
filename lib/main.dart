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
        primarySwatch: Colors.blue,
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/players');
              },
              child: const Text('Top 3 des joueurs'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/teams');
              },
              child: const Text('Équipes légendaires'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/leagues');
              },
              child: const Text('Top 5 des ligues'),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> teams = ['FC Barcelone', 'Real Madrid', 'Bayern Munich'];
    return Scaffold(
      appBar: AppBar(title: const Text('Équipes Légendaires')),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(teams[index]),
          );
        },
      ),
    );
  }
}

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> players = ['Lionel Messi', 'Diego Maradona', 'Pelé'];
    return Scaffold(
      appBar: AppBar(title: const Text('Top 3 Joueurs')),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(players[index]),
          );
        },
      ),
    );
  }
}

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> leagues = ['Premier League', 'Serie A', 'La Liga'];
    return Scaffold(
      appBar: AppBar(title: const Text('Top 5 Ligues')),
      body: ListView.builder(
        itemCount: leagues.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(leagues[index]),
          );
        },
      ),
    );
  }
}
