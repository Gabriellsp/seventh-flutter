import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/home/home_store.dart';
import 'package:seventh_prova_flutter/app/features/home/widgets/widgets.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_color.dart';
import 'package:seventh_prova_flutter/app/shared/widgets/custom_snackbar.dart';

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
                .showSnackBar(
                  CustomSnackbar(
                    message: store.messageError,
                  ),
                )
                .closed
                .then((value) => store.setShowMessage(false));
          });
        }
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Video Player',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          body: store.isLoading
              ? const Center(
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                )
              : Center(
                  child: VideoPlayer(
                  video: store.video,
                )),
        );
      },
    );
  }
}
