import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget leadingIcon;
  final void Function()? onPressedLeading;
  final List<Widget>? actions; // Change to List<Widget>?
  final Widget? profilePicture;
  final void Function()? onPressedProfilePicture;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.leadingIcon,
    required this.onPressedLeading,
    this.actions, // Mark as optional with a default value of null
    this.profilePicture,
    this.onPressedProfilePicture,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      title: title,
      leading: (leadingIcon != null)
          ? IconButton(
              icon: leadingIcon,
              onPressed: onPressedLeading,
            )
          : null,
      actions: actions ?? [], // Use empty list if actions is null
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  _buildProfilePicture(Widget profilePicture) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: onPressedProfilePicture,
        borderRadius: BorderRadius.circular(60),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: profilePicture,
        ),
      ),
    );
  }
}
