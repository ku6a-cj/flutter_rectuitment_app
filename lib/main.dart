import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int currentIndex = 0;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recruter App'),
      ),
      body: Center(
        child: currentIndex == 0 ? Container(
          color: Colors.blueAccent,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(counter.toString()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red, 
                  backgroundColor: Colors.amber
                ),
                onPressed: () {
                  setState(() {
                    counter = counter+1;
                  });
                },
                child: const Text('Add to counter'),
                ),
            ],
          ),
        ) : Container()
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(
            label: 'Main Page',
            icon: Icon(
              Icons.home)
            ),
          BottomNavigationBarItem(
            label: 'Calculator',
            icon: Icon(Icons.calculate)
      )
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex=index;
          });
        },
      ),
    );
  }
}