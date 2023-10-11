import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool isMainView;

  const CustomAppBar({
    Key? key,
    this.height = kToolbarHeight, 
    this.isMainView = false,
    TextField? title,
    Text? titleAlt
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('lib/assets/images/rick_morty_logo.png'),
          ),
          if (!isMainView)
            Positioned(
              left: 0,
              top: (height - IconTheme.of(context).size!) / 2, // Centra el icono verticalmente
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
