import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:netflixui/json/home_json.dart';
import 'package:netflixui/screens/pesquisar_screen.dart';
import 'package:netflixui/screens/video_detalhes_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: size.height - 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 480,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/banner_1.png"),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Container(
                      height: 480,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.85),
                            Colors.black.withOpacity(0.0)
                          ],
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter
                        ),
                      ),
                    ),
                    Container(
                      height: 480,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/titulo_1.webp",
                            width: 300,
                          ),
                          SizedBox(height: 15,),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Esperto",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  width: 3,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    shape: BoxShape.circle
                                  ),
                                ),
                                Text(
                                  "Irreverentes",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  width: 3,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    shape: BoxShape.circle
                                  ),
                                ),
                                Text(
                                  "Empolgantes",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            )
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          size: 30,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Minha lista",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 10
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VideosDetalhesScreen(video: minhaLista[1],)
                          )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:8, right: 13, top: 2, bottom: 2),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Assistir",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 30,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Saiba mais",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 10
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getLista(minhaLista, "Minha Lista", 100, 160),
                    getLista(popularesLista, "Populares na Netflix", 100, 160),
                    getLista(emAltaLista, "Em alta", 100, 160),
                    getLista(originalLista, "Originais Netflix", 160, 300),
                    getLista(animesLista, "Animes", 100, 160),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/logo.ico",
                              width: 35,
                              fit: BoxFit.cover,
                              ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              AntDesign.search1,
                              size: 28,
                            ),
                            onPressed: () {
                              Navigator.push(context, 
                                MaterialPageRoute(builder: (_) => PesquisarScreen()));
                            },
                          ),
                          IconButton(
                            icon: Container(
                              margin: EdgeInsets.only(right: 1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/perfil.png"),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Séries",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Filmes",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Minha lista",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column getLista(List<dynamic> lista, String titulo, double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:15, right: 15),
          child: Text(
            titulo,
            style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(height: 8,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: List.generate(lista.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) => VideosDetalhesScreen(video: lista[index],)
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: AssetImage(lista[index]['img']),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                );
              })
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}