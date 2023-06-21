import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: "이벤트"),
        BottomNavigationBarItem(icon: Icon(Icons.add_business), label: "화장품"),
        BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: "시술")
      ],
      onTap: (value) {
        print('value : $value');
        switch (value) {
          case 0:
            context.goNamed('home');
            break;
          case 1:
            context.pushNamed('survey');
            break;
          case 2:
            context.pushNamed('cosmeticProduct');
            break;
          case 3:
            context.pushNamed('surgeryProduct');
            break;
        }
      },
    );
  }
}
