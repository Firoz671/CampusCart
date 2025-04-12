import 'package:campus_cart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CmAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CmAppBar({
    super.key,
    required this.icon,
    this.onPressed,
    this.title,
    required this.isDivider,
  });

  final Widget icon;
  final void Function()? onPressed;
  final Widget? title;
  final bool isDivider;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: AppColors.whiteColor,
            title: title,
            leading: IconButton(
              onPressed: onPressed,
              icon: icon,
            ),
          ),
          if (isDivider)
            const Divider(height: 1, thickness: 1, color: Colors.grey),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
