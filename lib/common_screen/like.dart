import 'package:flutter/material.dart';

import 'Comman_Container.dart';

class Like extends StatefulWidget {
  const Like({Key? key}) : super(key: key);

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Comman_Container(
      height: 50,
      width: 50,
      child: InkWell(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: selected == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                icon: Icon(Icons.favorite),
                color: Colors.yellowAccent,
                iconSize: 30,
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                icon: Icon(Icons.favorite_outline),
                color: Colors.green,
                iconSize: 30,
              ),
      ),
    );
  }
}
