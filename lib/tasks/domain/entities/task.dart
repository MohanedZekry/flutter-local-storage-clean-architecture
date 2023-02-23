import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  final String title;
  final String description;
  final bool isDone;

  const Tasks({
    required this.title,
    required this.description,
    required this.isDone
  });

  @override
  List<Object> get props => [title, description, isDone];

}