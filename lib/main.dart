import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_demo/state/app_state.dart';
import 'package:provider_demo/state/home_state.dart';
import 'package:provider_demo/views/api_data_view.dart';
import 'package:provider_demo/views/home_screen.dart';

void main() {
  runApp( MultiProvider(
    providers: providers,
    child: MyApp(),
  ),);
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? locale;
  bool localeLoaded = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: ApiView(),
         );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     //** it observe changes and notify */
//
//     return  MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Demo',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             home: MyHomePage(),
//           );
//         }
// }

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AppState>(create: (_) => AppState()),
  ChangeNotifierProvider<UpdateAppState>(create: (_) => UpdateAppState()),
];

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Provider Demo'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child:
//         Center(
//           child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: MediaQuery.of(context).size.height*0.25,),
//               ElevatedButton(onPressed: (){},
//               child: Text('Press to update value') ,
//               ),
//               Text('')
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             key: Key('decrement_floatingActionButton'),
//             onPressed: ()=>{},
//             tooltip: 'Decrement',
//             child: Icon(Icons.remove),
//           ),
//           SizedBox(width: 10,),
//           FloatingActionButton(onPressed: ()=>{},
//             key: Key('reset_floatingActionButton'),
//           tooltip: 'Reset',
//             child: Icon(Icons.add),
//           ),
//           SizedBox(width: 10,),
//           FloatingActionButton(onPressed: ()=>{},
//             key: Key('increment_floatingActionButton'),
//           tooltip: 'Increment',
//           child: Icon(Icons.add),)
//         ],
//       ),
//     );
//   }
// }
