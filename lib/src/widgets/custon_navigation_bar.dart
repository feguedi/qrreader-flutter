import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qrreader/src/providers/providers.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.setSelectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      selectedItemColor: Theme.of(context).primaryColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.near_me),
          label: 'Direcciones',
        ),
      ],
    );
  }
}
