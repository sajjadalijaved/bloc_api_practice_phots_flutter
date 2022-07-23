import 'package:bloc_api_practice_phots/bloc/phot_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../model_class/photo.dart';

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({Key? key}) : super(key: key);

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    PhotBloc photBloc = Provider.of<PhotBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Bloc'),
        centerTitle: true,
      ),
      body: BlocBuilder<PhotBloc, PhotState>(
        bloc: photBloc,
        builder: (context, state) {
          if (state is PhotInitialstate) {
            return photoinitialUI();
          } else if (state is PhotoLoadingState) {
            return photoLoadingUI();
          } else if (state is PhotosLoadedState) {
            return photoLoadedUI(state.photo);
          } else if (state is PhotoErrorState) {
            return photoErrorUI(state.errormessage);
          } else {
            return photoErrorUI('Photo error');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          photBloc.add(FetchPhotoEvent());
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget photoinitialUI() {
    return const Center(
      child: Text('Click To Data'),
    );
  }

  Widget photoLoadingUI() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 10,
        color: Colors.amber,
      ),
    );
  }

  Widget photoLoadedUI(List<Photo> photo) {
    return ListView.builder(
      itemBuilder: ((context, index) => ListTile(
            leading: CircleAvatar(
              child: Text(photo[index].albumId.toString()),
            ),
            title: Text(photo[index].title.toString()),
            subtitle: Text(photo[index].url.toString()),
            trailing: Text(photo[index].id.toString()),
          )),
    );
  }

  Widget photoErrorUI(String message) {
    return Container(
      color: Colors.red,
      child: Center(
          child: Text(
        message,
        style: Theme.of(context).textTheme.headline3,
      )),
    );
  }
}
