import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'streams_state.dart';

class StreamsCubit extends Cubit<StreamsState> {
  StreamsCubit() : super(StreamsInitial());

  void updateColorChanged(Color color) async {
    emit(StreamColorChanged(color: color));
  }

  void resetColorChanged() async {
    emit(StreamsInitial());
  }
}
