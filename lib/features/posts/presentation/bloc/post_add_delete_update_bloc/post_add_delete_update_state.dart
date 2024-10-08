part of 'post_add_delete_update_bloc.dart';

abstract class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  @override
  List<Object> get props => [];
}

class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostState {}

class ErrorAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;

  const ErrorAddDeleteUpdatePostState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;

  const MessageAddDeleteUpdatePostState({required this.message});

  @override
  List<Object> get props => [message];
}