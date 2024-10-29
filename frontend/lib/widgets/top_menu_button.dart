import 'package:final_proj_flutter/util/apptext.dart';
import 'package:flutter/material.dart';

class TopMenuButton extends StatelessWidget {
  final String label;
  final double height;

  const TopMenuButton({
    super.key,
    required this.label,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(label, style: AppText.menuText),
          ),
        ));
  }
}
