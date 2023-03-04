import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/home/home_store.dart';
import 'package:seventh_prova_flutter/app/features/home/widgets/widgets.dart';
import 'package:seventh_prova_flutter/app/shared/global_store/global_store.dart';
import 'package:seventh_prova_flutter/app/shared/widgets/custom_snackbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = Modular.get<HomeStore>();

  @override
  void initState() {
    homeStore.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  'Video Player',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            body: Center(
              child: homeStore.isLoading
                  ? const CircularProgressIndicator(strokeWidth: 2.0)
                  : VideoPlayer(
                      video: homeStore.video,
                    ),
            ));
      },
    );
  }
}
