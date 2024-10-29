import 'package:final_proj_flutter/widgets/top_menu_button.dart';
import 'package:flutter/material.dart';

class TopMenuScroll extends StatelessWidget {
  const TopMenuScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonHeight = constraints.maxHeight * 0.8;

        return SizedBox(
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TopMenuButton(label: '추천 메뉴', height: buttonHeight),
                TopMenuButton(label: '행사 메뉴', height: buttonHeight),
                TopMenuButton(label: '버거 세트', height: buttonHeight),
                TopMenuButton(label: '버거', height: buttonHeight),
                TopMenuButton(label: '사이드', height: buttonHeight),
                TopMenuButton(label: '음료', height: buttonHeight),
                TopMenuButton(label: '디저트', height: buttonHeight),
              ],
            ),
          ),
        );
      },
    );
  }
}
