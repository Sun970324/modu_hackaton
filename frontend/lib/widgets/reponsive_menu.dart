import 'dart:convert';
import 'package:final_proj_flutter/models/menu_model.dart';
import 'package:final_proj_flutter/screens/menu_detail.dart';
import 'package:final_proj_flutter/widgets/menu_item_card.dart';
import 'package:final_proj_flutter/widgets/top_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResponsiveMenu extends StatefulWidget {
  const ResponsiveMenu({super.key});

  @override
  _ResponsiveMenuState createState() => _ResponsiveMenuState();
}

class _ResponsiveMenuState extends State<ResponsiveMenu> {
  List<MenuModel>? menuItems; // nullable로 변경

  @override
  void initState() {
    super.initState();
    loadMenuData();
  }

  Future<void> loadMenuData() async {
    final String response = await rootBundle.loadString('lib/util/menu.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      menuItems = data
          .map(
            (e) => MenuModel(
                category: e['category'],
                name: e['name'],
                productStatus: e['product_status'],
                description: e['description'],
                priceSingle: int.parse(e['price']['single']),
                priceSet: int.parse(e['price']['set']),
                ingredients: e['ingredients'],
                allergyCaution: e['allergy_caution']),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (menuItems == null) {
      return const Center(child: CircularProgressIndicator());
    }
    ScrollController scrollController = ScrollController();

    return Column(
      children: [
        const Flexible(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: TopMenuScroll(),
          ),
        ),
        Flexible(
          flex: 8,
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            child: OrientationBuilder(
              builder: (context, orientation) {
                return GridView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: menuItems!.length,
                  itemBuilder: (context, index) {
                    final menuItem = menuItems![index];
                    return FloatingActionButton(
                      heroTag: menuItem,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuDetail(item: menuItem),
                          )),
                      child: MenuItemCard(
                        menuModel: menuItem,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
