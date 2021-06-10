import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:netflixui/screens/pesquisar_screen.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({ Key key }) : super(key: key);

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
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
        "Donwloads",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
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
          onPressed: () {},
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
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Icon(AntDesign.setting, color: Colors.white.withOpacity(0.8),),
                SizedBox(width: 10,),
                Text(
                  "Smart Downloads",
                  style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.8)),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Conheça os Downloads para você",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Vamos baixar uma seleção personalizada de filmes e séries para você sempre ter um título para assistir no celular.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: Center(
                child: Image.asset("assets/images/img_download.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(4)
                  ),
                  child: Center(
                    child: Text(
                      "CONFIGURAR",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, top: 35, bottom: 35),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2), 
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Center(
                    child: Text(
                      "Encontre um título para baixar",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}