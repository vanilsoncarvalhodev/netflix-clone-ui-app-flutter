import 'package:flutter/material.dart';
import 'package:netflixui/json/pesquisar_json.dart';

class PesquisarScreen extends StatefulWidget {
  const PesquisarScreen({ Key key }) : super(key: key);

  @override
  _PesquisarScreenState createState() => _PesquisarScreenState();
}

class _PesquisarScreenState extends State<PesquisarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: _Body(),
    );
  }

  Widget getAppBar() {
    var size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Container(
            margin: const EdgeInsets.only(right: 1),
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: AssetImage("assets/images/perfil.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          onPressed: () {},
        ),
      ],
      bottom: PreferredSize(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.35),
              ),
              child: Row(
                children: [
                  Container(
                    width: size.width - (size.width * 0.25),
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.transparent
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Busque por série, filme, gênero,...",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_voice_rounded,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(40),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
              child: Text(
                "Principais buscas",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: List.generate(pesquisarJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Container(
                    color: Colors.grey.withOpacity(0.2),
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.9,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          pesquisarJson[index]['img'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: size.width * 0.4,
                                child: Text(
                                  pesquisarJson[index]['titulo'],
                                  style: TextStyle(fontSize: 15, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1.5, color: Colors.white),
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}