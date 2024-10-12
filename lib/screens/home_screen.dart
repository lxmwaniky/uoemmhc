import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String? _quote;
  String? _author;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDailyQuote();
  }

  Future<void> fetchDailyQuote() async {
    final response = await http.get(Uri.parse('https://zenquotes.io/api/today'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _quote = data[0]['q'];
        _author = data[0]['a'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _quote = 'Failed to load daily quote';
        _author = '';
        _isLoading = false;
      });
    }
  }

  Future<void> fetchRandomQuote() async {
    final response = await http.get(Uri.parse('https://zenquotes.io/api/random'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _quote = data[0]['q'];
        _author = data[0]['a'];
      });
    } else {
      setState(() {
        _quote = 'Failed to load random quote';
        _author = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Mental Health Club(UOEM) - Quotes'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _quote ?? 'You are not alone',
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '- ${_author ?? 'Mental Health Club(UOEM)'}',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: fetchRandomQuote,
                      child: Text(
                        'Get Another Quote',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Text(
      //       '© 2024 University of Embu Mental Health Club.',
      //       textAlign: TextAlign.center,
      //       style: Theme.of(context).textTheme.bodySmall,
      //     ),
      //   ),
      // ),
    );
  }
}
