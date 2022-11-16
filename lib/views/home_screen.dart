import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/state/app_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 1st way
   // AppState provider = Provider.of<AppState>(context);
    UpdateAppState provider = Provider.of<UpdateAppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //  Text('Provider Initial Value ${provider.num}', style: TextStyle(fontSize: 25),),
            SizedBox(height: 10,),
            /// 2nd way
            Consumer<UpdateAppState>(builder: (context, providerValue, child)
            {
              return Text('Provider Value ${provider.num}', style: TextStyle(fontSize: 25));
            }
            ),
            SizedBox(height: 10,),
            // CupertinoButton(child: Text('Tab to Change Value'),onPressed:  (){
            //   provider.Increment();
            // })
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            provider.increment();
          },
          child: Text('+'),
          ),

          FloatingActionButton(onPressed: (){
            provider.decrement();
          },
            child: Text('-'),
          ),
          FloatingActionButton(onPressed: (){
            provider.square();
          },
            child: Text('*'),
          ),

          FloatingActionButton(onPressed: (){
            provider.reset();
          },
            child: Text('Reset'),
          ),



          // FloatingActionButton(onPressed: (){
          //   provider.divide();
          // },
          //   child: Text('/'),
          // )
        ],
      ),
    );
  }
}
