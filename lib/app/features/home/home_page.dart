import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/home/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    store.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.showMessageError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    store.messageError,
                    textAlign: TextAlign.center,
                  ),
                ))
                .closed
                .then((value) => store.setShowMessage(false));
          });
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Video Seventh'),
          ),
          body: store.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Text(
                  store.video.url!,
                  style: const TextStyle(color: Colors.white),
                )),
        );
      },
    );
  }
}
