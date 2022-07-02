part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetAllCharacters extends CharacterEvent{
   final String query;
   final Map<String, dynamic> variables;

  GetAllCharacters(this.query,{required this.variables});
  @override
  // TODO: implement props
  List<Object?> get props => [query,variables];

}
