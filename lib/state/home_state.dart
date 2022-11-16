import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../update_ui/first_page.dart';
import '../update_ui/second_page.dart';
import 'app_state.dart';

class HomeState extends StatelessWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appProvider=Provider.of<AppState>(context,listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:const Icon(CupertinoIcons.arrow_up_arrow_down_circle),
        onPressed: (){
          appProvider.updateWidget();
        },
        backgroundColor: Colors.blueGrey,
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Change Ui using provider"),
      ),
      body: Consumer<AppState>(
        builder: (context, provider, child) {
          return provider.change ? SecondPage() : FirstPage();
        },
      ),
    );
  }
}