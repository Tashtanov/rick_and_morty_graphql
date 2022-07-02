import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PersonalCharacter extends StatelessWidget {
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;
  final String type;
  final String location;
  final String origin;

  const PersonalCharacter(
      {Key? key,
      required this.name,
      required this.image,
      required this.status,
      required this.species,
      required this.gender,
      required this.type,
      required this.location,
      required this.origin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(image),
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      name,
                      style: TextStyle(fontSize: 35),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      status,
                      style: TextStyle(
                          fontSize: 18,
                          color: status == "Alive" ? Colors.green : Colors.red),
                    ),
                    Center(
                      child: Text(
                        "Rick and Morty is an American adult animated science fiction sitcom created by Justin"
                        " Roiland and Dan Harmon for Cartoon Network's nighttime programming block Adult Swim.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54),
                            ),
                            Text(
                              gender,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Column(
                          children: [
                            Text(
                              "Species",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54),
                            ),
                            Text(
                              species,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location of Birth ",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54),
                            ),
                            Text(
                              origin,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location  ",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54),
                            ),
                            Text(
                              location,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
