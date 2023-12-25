import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoalbum/blocs/images/images_bloc.dart';
import 'package:photoalbum/pages/home/album.dart';

void main() {
  Bloc.observer = const Observer();
  runApp(const MyApp());
}

class Observer extends BlocObserver {
  /// {@macro counter_observer}
  const Observer();

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent: ${bloc.runtimeType} $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('onChange: ${bloc.runtimeType} $change');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImagesCubit([]),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
        ),
        home: AlbumPage(),
      ),
    );
  }
}
