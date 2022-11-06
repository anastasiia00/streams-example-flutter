import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sstreams_projects/cubit/streams_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StreamsCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 7.5,
        children: const [
          ColorsContainer(
            color: Colors.red,
            title: 'red',
          ),
          ColorsContainer(
            color: Colors.deepOrangeAccent,
            title: 'deepOrangeAccent',
          ),
          ColorsContainer(
            color: Colors.yellow,
            title: 'yellow',
          ),
          ColorsContainer(
            color: Colors.blue,
            title: 'blue',
          ),
          ColorsContainer(
            color: Colors.green,
            title: 'green',
          ),
          ColorsContainer(
            color: Colors.grey,
            title: 'grey',
          ),
          ColorsContainer(
            color: Colors.purple,
            title: 'purple',
          ),
          ColorsContainer(
            color: Colors.pink,
            title: 'pink',
          ),
          ColorsContainer(
            color: Colors.brown,
            title: 'brown',
          ),
          ColorsContainer(
            color: Colors.cyanAccent,
            title: 'cyanAccent',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          BlocProvider.of<StreamsCubit>(context).resetColorChanged();
        },
        child: Icon(
          Icons.restart_alt_outlined,
        ),
      ),
    );
  }
}

class ColorsContainer extends StatelessWidget {
  const ColorsContainer({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamsCubit, StreamsState>(
      builder: (
        context,
        state,
      ) {
        Color _color = Colors.black;
        if (state is StreamsInitial) {
          _color = color;
        } else {
          _color = state.color;
        }

        return Padding(
          padding: const EdgeInsets.only(
            top: 7.5,
            bottom: 7.5,
          ),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<StreamsCubit>(context).updateColorChanged(color);
            },
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  title,
                ),
              ),
              color: _color,
            ),
          ),
        );
      },
    );
  }
}
