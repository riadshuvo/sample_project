
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/bloc_observer.dart';

import 'counter/counter_view.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RouteButton(
                onClick: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          CounterPage()));
                },
                title: 'Counter Bloc'),

            SizedBox(height: 10,),
            RouteButton(
                onClick: (){},
                title: 'Form Validation'),

            SizedBox(height: 10,),
            RouteButton(
                onClick: (){},
                title: 'Counter Bloc'),

            SizedBox(height: 10,),
            RouteButton(
                onClick: (){},
                title: 'Counter Bloc'),

            SizedBox(height: 10,),
            RouteButton(
                onClick: (){},
                title: 'Counter Bloc'),

            SizedBox(height: 10,),
            RouteButton(
                onClick: (){},
                title: 'Counter Bloc'),

            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  const RouteButton({Key? key,
    required this.title, required this.onClick}) : super(key: key);

  final String title;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blue,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Text(title)));
  }
}

