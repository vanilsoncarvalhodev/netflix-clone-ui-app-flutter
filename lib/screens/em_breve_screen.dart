import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:netflixui/json/em_breve_json.dart';
import 'package:netflixui/widgets/video.dart';

class EmBreveScreen extends StatefulWidget {
  @override
  _EmBreveScreenState createState() => _EmBreveScreenState();
}

class _EmBreveScreenState extends State<EmBreveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: _Body(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: const Text(
        "Em breve",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Icon(AntDesign.search1, size: 28,),
          onPressed: () {},
        ),
        IconButton(
          icon: Container(
            width: 26,
            height: 26,
            margin: const EdgeInsets.only(right: 1),
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
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "Notificações",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(emBreveJson.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Video(video: emBreveJson[index],),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            emBreveJson[index]['titulo_img'],
                            width: 120,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.notifications_none_outlined),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Receber aviso",
                                    style: TextStyle(fontSize: 11),
                                  )
                                ],
                              ),
                              SizedBox(width: 30,),
                              Column(
                                children: [
                                  Icon(Icons.info_outline),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Saiba mais",
                                    style: TextStyle(fontSize: 11),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                      child: Text(
                        emBreveJson[index]['data'],
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: Text(
                        emBreveJson[index]['titulo'],
                        style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Text(
                        emBreveJson[index]['descricao'],
                        style: TextStyle(
                          height: 1.4, color: Colors.white.withOpacity(0.5)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(emBreveJson[index]['categorias'].length, (indexCategoria) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  emBreveJson[index]['categorias'][indexCategoria],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              (indexCategoria < emBreveJson[index]['categorias'].length - 1) ?
                              Container(
                                width: 3,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: emBreveJson[index]['cor'],
                                  shape: BoxShape.circle,
                                ),
                              ) : Container(),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}