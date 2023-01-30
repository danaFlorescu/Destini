import 'package:flutter/material.dart';
import 'story_brain.dart';

StoryBrain myStoryBrainObj = StoryBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Destini(),
    );
  }
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DestiniClass(),
    );
  }
}

class DestiniClass extends StatefulWidget {
  const DestiniClass({Key? key}) : super(key: key);

  @override
  State<DestiniClass> createState() => _DestiniClassState();
}

class _DestiniClassState extends State<DestiniClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    myStoryBrainObj.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      myStoryBrainObj.nextStory(1);
                    });
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text(
                    myStoryBrainObj.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: myStoryBrainObj.buttonShouldBeVisible(),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        myStoryBrainObj.nextStory(2);
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    child: Text(
                      myStoryBrainObj.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
