import 'package:final_proj_flutter/models/menu_model.dart';
import 'package:final_proj_flutter/util/apptext.dart';
import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final MenuModel menuModel;
  const MenuItemCard({super.key, required this.menuModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                '/Users/sun/Desktop/hackaton/flutter/frontend/assets/images/set1.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              menuModel.name,
              style: AppText.productName,
            ),
            // SizedBox(height: 5.h),
            // Text(
            //   description,
            //   style: AppText.productDescription,
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            // ),
            // const SizedBox(height: 5),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           '단품: ₩$priceSingle',
            //           style: AppText.productPrice,
            //         ),
            //         Text(
            //           '세트: ₩$priceSet',
            //           style: AppText.productPrice,
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
