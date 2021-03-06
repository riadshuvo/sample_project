
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/bloc_observer.dart';
import 'package:equatable/equatable.dart';
import 'alphabet_scrolable_list/view/MyAlphabetList.dart';
import 'az_list_view/page.dart';
import 'counter/counter_view.dart';
import 'form_validation/view/form_vaidation_view.dart';
import 'logIn/authentication/authentication_repository.dart';
import 'logIn/repository/user_repository.dart';
import 'logIn/widgets/app_login.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  EquatableConfig.stringify = kDebugMode;
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
                onClick: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          FormValidationView()));
                },
                title: 'Form Validation'),

            SizedBox(height: 10,),
            RouteButton(
                onClick: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          MyListView()));},
                title: 'Alphabet Scroll View'),

            SizedBox(height: 10,),
            RouteButton(
                onClick: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          AppLogin(
                            authenticationRepository: AuthenticationRepository(),
                            userRepository: UserRepository(),
                          )));
                },
                title: 'Login Bloc'),

            SizedBox(height: 10,),
            RouteButton(
                onClick: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                      MainPage()));},
                title: 'AZ List View'),

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
   RouteButton({Key? key,
    required this.title, required this.onClick}) : super(key: key);

 final GlobalKey _key = GlobalKey();

  final String title;
  final GestureTapCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: _key,
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

