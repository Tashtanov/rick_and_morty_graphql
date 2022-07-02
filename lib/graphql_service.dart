import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';

// final HttpLink httpLink = HttpLink("https://rickandmortyapi.com/graphql");
// ValueNotifier<GraphQLClient> client = ValueNotifier(
//     GraphQLClient(link: httpLink, cache: GraphQLCache(store: InMemoryStore())));
class GraphQLService {
  late GraphQLClient _client;

  GraphQLService() {
    HttpLink httpLink = HttpLink("https://rickandmortyapi.com/graphql/");
    _client =
        GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore()));
  }

  Future<QueryResult> getCharQuery(
      String query, Map<String, dynamic> variables) async {
    QueryOptions queryOptions =
        QueryOptions(document: gql(query), variables: variables);
    final result = await _client.query(queryOptions);
    print(result);

    return result;
  }

  Future<QueryResult> getCharMutation(
      String query, Map<String, dynamic> variables) async {
    MutationOptions mutationOptions =
        MutationOptions(document: gql(query), variables: variables);
    final result = await _client.mutate(mutationOptions);
    print(result);
    return result;

  }
}
