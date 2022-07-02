import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ricka_and_morty_graphql/graphql_service.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
GraphQLService service = GraphQLService();
  CharacterBloc() : super(CharacterInitial()) {
    on<GetAllCharacters>((event, emit)async {
      final query=event.query;
      final variables=event.variables  ;
      emit(CharacterLoadingState());
      try{
        final result= await service.getCharQuery(query, variables);
        if (result.hasException) {
          print('graphQLErrors: ${result.exception?.graphqlErrors.toString()}');
          emit(CharacterErrorState(message: result.exception?.graphqlErrors[0]));
        }  
        else{
          emit(
            CharacterLoadedState(characters: result.data)
          );
        }

      }
      catch(e){
        print(e);
        emit(CharacterErrorState(message: e.toString()));
      }





    });
  }
}
