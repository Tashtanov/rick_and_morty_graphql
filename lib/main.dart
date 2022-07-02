import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ricka_and_morty_graphql/bloc/character_bloc.dart';
import 'package:ricka_and_morty_graphql/detail_character.dart';
import 'package:ricka_and_morty_graphql/queries.dart';

// void main(){
Future<void> main()async {
  // var app = GraphQLProvider(
  //   client: client,
  //   child: MyApp(),
  // );
  // runApp(app);
  // BlocSupervisor.delegate = MySimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CharacterBloc>(
        create: (context) => CharacterBloc()..add(GetAllCharacters(Queries().gerCharacters(), variables: {},)),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List characterss=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: BlocBuilder<CharacterBloc,CharacterState>(

          builder: (context, state) {
            if (state is CharacterInitial) {
              return Center (child:
                Text('Hello its loading'),
              );

            }
            else if (state is CharacterLoadingState) {
              return Center(child: CircularProgressIndicator(),);
            }
            else if (state is CharacterErrorState) {
              return Center(child: Text(state.message));
            }
            else{
              characterss=(state as CharacterLoadedState).characters["characters"]["results"];


            // final characterss = result.data?["characters"]["results"];


            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListView.builder(
                          padding: EdgeInsets.all(6),
                          itemCount: characterss.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PersonalCharacter(
                                                image: characterss[index]["image"],
                                                status: characterss[index]["status"],
                                                species: characterss[index]["species"],
                                                type: characterss[index]["type"],
                                                gender: characterss[index]["gender"],
                                                name: characterss[index]["name"],
                                                location: characterss[index]["location"]["name"],
                                                origin: characterss[index]["origin"]["name"],
                                              )));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                            characterss[index]["image"])),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          characterss[index]["status"],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: characterss[index]
                                              ["status"] ==
                                                  "Alive"
                                                  ? Colors.green
                                                  : Colors.red),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          characterss[index]["name"],
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${characterss[index]["species"]},${characterss[index]["gender"]}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            );}
          },
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
