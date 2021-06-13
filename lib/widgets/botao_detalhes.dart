import 'package:flutter/material.dart';

class BotaoDetalhe extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final Function onTap;

  const BotaoDetalhe({ Key key, this.titulo, this.icone, this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Icon(
                  icone,
                  size: 25,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.4,
                  color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ],
          );
  }
}