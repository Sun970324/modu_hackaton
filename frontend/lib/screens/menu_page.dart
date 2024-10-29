import 'package:final_proj_flutter/widgets/button_box.dart';
import 'package:final_proj_flutter/widgets/cart_container.dart';
import 'package:final_proj_flutter/widgets/llm_response.dart';
import 'package:final_proj_flutter/widgets/reponsive_menu.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              child: const LLMresponse(
                text:
                    '주문하고 싶은 메뉴가 정해져 있다면 메뉴명을 말씀해주세요. 메뉴 검색을 원하실 경우, 최대한 구체적인 취향을 알려주세요! 치킨이 들어간 햄버거는 6가지입니다. 맥치킨, 맥치킨 모짜렐라, 맥크리스피 클래식 버거, 맥크리스피 디럭스 버거, 맥스리스피 스리라차 마요, 맥스파이시 상하이버거가 있습니다.',
              ),
            ),
          ),
          const Expanded(
            flex: 7,
            child: Stack(
              children: [
                ResponsiveMenu(),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: ButtonBox(),
                ),
              ],
            ),
          ),
          const Expanded(flex: 2, child: CartContainer()),
        ],
      ),
      // bottomNavigationBar: const BottomAppBar(
      //   child: Row(
      //     children: [ButtonBox(), CartContainer()],
      //   ),
      // ),
    );
  }
}
