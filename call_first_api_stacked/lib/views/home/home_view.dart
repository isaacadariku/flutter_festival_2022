import 'package:call_first_api_stacked/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.getData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Call First API with Stacked'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (final user in model.users)
                ListTile(
                  leading: Text(user.id.toString()),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Text(user.phone),
                ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
