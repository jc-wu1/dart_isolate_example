import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Compute can only take a top-level function, but not instance or static methods.
/// handle the isolated task
Future<String> performBackgroundTask() async {
  return compute(performTimeConsumingTask, 10);
}

/// the heavy function like "findPrimeNumber" or just this
String performTimeConsumingTask(int number) {
  int val = 0;
  for (int i = 0; i < 9999999; i++) {
    val = val + (number * i);
  }
  return 'Task completed! val is $val';
}

class ExampleOnePage extends StatefulWidget {
  const ExampleOnePage({super.key});

  @override
  ExampleOnePageState createState() => ExampleOnePageState();
}

class ExampleOnePageState extends State<ExampleOnePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final x = await performBackgroundTask();
                setState(() {
                  result = x;
                });
              },
              child: const Text('Run Task'),
            ),
            const SizedBox(height: 16),
            Text('Result: $result'),
          ],
        ),
      ),
    );
  }
}
