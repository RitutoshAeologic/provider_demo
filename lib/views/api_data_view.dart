import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data_model.dart';
import '../state/app_state.dart';
import '../utils/data_utils.dart';

class ApiView extends StatelessWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppState>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(CupertinoIcons.refresh_thick),
            onPressed: () async {
              List<DataModel> data = await DataUtil().getData();
              provider.updateDataModel(data);
            },
          ),
          appBar: AppBar(
            title: Text("Provider Fetch RestAPI"),
            centerTitle: true,
          ),
          body: Container(
            height: size.height,
            width: size.width,
            child: provider.dataList.isEmpty
                ? Center(child:
            CircularProgressIndicator()

            )
                : ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${provider.dataList[index].title}"),
                  leading: Text("${provider.dataList[index].id}"),
                  trailing: IconButton(
                    onPressed: (){
                      provider.deleteDataModel(index);
                    },
                    icon: Icon(Icons.delete),

                  ),
                );
              },
              itemCount: provider.dataList.length,
            ),
          ),
        );
      },
    );
  }
}