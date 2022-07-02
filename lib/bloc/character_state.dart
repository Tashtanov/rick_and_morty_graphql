part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();
}

class CharacterInitial extends CharacterState {
  @override
  List<Object> get props => [];
}
class CharacterLoadingState extends CharacterState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class CharacterLoadedState extends CharacterState{
final dynamic characters;

  CharacterLoadedState({required this.characters});
  @override
  // TODO: implement props
  List<Object?> get props => characters;

}class CharacterErrorState extends CharacterState{
  final dynamic message;

  CharacterErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => message;

}
