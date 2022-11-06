part of 'streams_cubit.dart';

@immutable
abstract class StreamsState {
  Color get color;
}

class StreamsInitial extends StreamsState {
  @override
  Color get color => Colors.white;
}

class StreamColorChanging extends StreamsState {
  @override
  final Color color;
  StreamColorChanging({
    required this.color,
  });
}

class StreamColorChanged extends StreamsState {
  @override
  final Color color;
  StreamColorChanged({
    required this.color,
  });
}
