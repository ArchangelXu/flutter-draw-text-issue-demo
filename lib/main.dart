import 'package:draw_text_issue/bar.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draw Text Issue Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Draw Text Issue Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyProgressBar(
                progress: _progress,
                labelBuilder: (progress) =>
                    sprintf("%.2f%% Completed", [progress * 100]),
              ),
              const SizedBox(height: 16),
              Slider(
                value: _progress,
                onChanged: (value) => setState(() {
                  _progress = value;
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
