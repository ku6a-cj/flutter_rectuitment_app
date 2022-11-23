import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

const List<String> list = <String>['No selected','Man', 'Woman'];
String sex = 'No selected';
double _currentSliderValue = 1;
double _subject1SliderValue = 1;
bool Subject1Extended = false;
double pointsResoult = 0;

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
        title: const Text('Recrutment App'),
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
                const SizedBox(
                  height: 400,
                   child: Expanded(
                      child: SizedBox(
                        child: WebView(
                    initialUrl: "https://www.wojsko-polskie.pl/wat/",
                    javascriptMode: JavascriptMode.unrestricted,),
                      )),
                 ),
              Text(counter.toString()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, 
                  backgroundColor: Colors.amber
                ),
                onPressed: () {
                  setState(() {
                    counter = counter+1;
                  });
                },
                child: const Text('Add to counter'),
                ),
                Text(''),
              Text("My points form last simulation: "+pointsResoult.toString()),
            ],
          ),
        ) : Container(
           color: Color.fromARGB(255, 202, 215, 238),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              const Text('Select your gender'),
              DropdownButtonExample(),
              Text(''),
              const Text('Interview Points'),
              MySlider(),
              Text(''),
              const Text('Matura Points section'),
              const Text(' '),
              Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                const  Text('Matematic'),
                const Text('     '),
                MyCheckBoxSubject1(),
                ],
              ),
              SubjectSlider1(),
              Text("Gender: "+sex + " My points:" +pointsResoult.toString()),
              ElevatedButton(onPressed: (){
                setState(() {
                  sex = sex;
                  if(sex == 'No selected'){
                    Fluttertoast.showToast(
                      msg: "Select your gender!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Color.fromARGB(255, 75, 70, 70),
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  }


                  pointsResoult=_currentSliderValue;
                  if(Subject1Extended){
                    pointsResoult=pointsResoult+_subject1SliderValue*0.45;
                  }else{
                    pointsResoult=pointsResoult+_subject1SliderValue*0.45*0.5;
                  }
                });
              }, child: const Text('Calculate poionts')),
             ]
            )
        )
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




class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
     // icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
           sex = value;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 30,
      divisions: 30,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}





class SubjectSlider1 extends StatefulWidget {
  const SubjectSlider1({super.key});

  @override
  State<SubjectSlider1> createState() => _MySubject1SliderState();
}

class _MySubject1SliderState extends State<SubjectSlider1> {
  

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _subject1SliderValue,
      max: 100,
      divisions: 100,
      label: _subject1SliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _subject1SliderValue = value;
        });
      },
    );
  }
}


class MyCheckBoxSubject1 extends StatefulWidget {
  const MyCheckBoxSubject1({super.key});

  @override
  State<MyCheckBoxSubject1> createState() => _MyCheckBoxSubject1state();
}

class _MyCheckBoxSubject1state extends State<MyCheckBoxSubject1> {


  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: Subject1Extended,
      onChanged: (bool? value) {
        setState(() {
          Subject1Extended = value!;
        });
      },
    );
  }
}
