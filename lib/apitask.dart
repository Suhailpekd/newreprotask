import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Api1 extends StatefulWidget {
  const Api1({super.key});

  @override
  State<Api1> createState() => _Api1State();
}

class _Api1State extends State<Api1> {
  Future<dynamic> one() async {
    var apicaller = await get(Uri.parse("https://fakestoreapi.com/products/"));

    var decodjson = jsonDecode(apicaller.body);
    print(decodjson);

    return decodjson;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.shop), Text("Products")],
        ),
      ),
      body: FutureBuilder(
        future: one(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                ListView(
                  children: [
                    //),

                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.transparent),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${snapshot.data[0]["image"]}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.yellow,
                              child: Text("${snapshot.data[0]["price"]}"))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.amber),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${snapshot.data[1]["image"]}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.yellow,
                              child: Text("${snapshot.data[2]["price"]}"))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.amber),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${snapshot.data[2]["image"]}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.yellow,
                              child: Expanded(
                                  child: Text("${snapshot.data[3]["price"]}")))
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.amber),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${snapshot.data[3]["image"]}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.yellow,
                              child: Expanded(
                                  child: Text("${snapshot.data[4]["price"]}")))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return CircleAvatar();
          }
        },
      ),
    );
  }
}
