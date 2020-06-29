import 'package:flutter/material.dart';
import 'package:maxfit/domain/workout.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Max Fitnes',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(
            // ignore: deprecated_member_use
            title: TextStyle(color: Colors.white),
          ),
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Max Fit'),
          leading: Icon(Icons.fitness_center),
        ),
        body: Center(
          child: WorkoutsList(),
        ),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'Test 1',
        author: 'Max 1',
        description: 'Test Workout 1',
        level: 'Beginner'),
    Workout(
        title: 'Test 2',
        author: 'Max 2',
        description: 'Test Workout 2',
        level: 'Intermediate'),
    Workout(
        title: 'Test 3',
        author: 'Max 3',
        description: 'Test Workout 3',
        level: 'Advanced'),
    Workout(
        title: 'Test 4',
        author: 'Max 4',
        description: 'Test Workout 4',
        level: 'Beginner'),
    Workout(
        title: 'Test 5',
        author: 'Max 5',
        description: 'Test Workout 5',
        level: 'Intermediate'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, i) {
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(50, 65, 85, 0.9),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  // ignore: deprecated_member_use
                  leading: Container(
                    padding: EdgeInsets.only(right: 12),
                    // ignore: deprecated_member_use
                    child: Icon(
                      Icons.fitness_center,
                      // ignore: deprecated_member_use
                      color: Theme.of(context).textTheme.title.color,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 1, color: Colors.white24),
                      ),
                    ),
                  ),
                  title: Text(
                    workouts[i].title,
                    style: TextStyle(
                        // ignore: deprecated_member_use
                        color: Theme.of(context).textTheme.title.color,
                        fontWeight: FontWeight.bold),
                  ),
                  // ignore: deprecated_member_use
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Theme.of(context).textTheme.title.color),
                  subtitle: subtitle(context, workouts[i]),
                ),
              ),
            );
          }),
    ));
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          // ignore: deprecated_member_use
          backgroundColor: Theme.of(context).textTheme.title.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 3,
        // ignore: deprecated_member_use
        child: Text(
          workout.level,
          style: TextStyle(
            // ignore: deprecated_member_use
            color: Theme.of(context).textTheme.title.color,
          ),
        ),
      ),
    ],
  ); 
}
