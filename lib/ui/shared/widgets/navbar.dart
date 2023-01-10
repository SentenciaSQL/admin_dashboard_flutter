import 'package:admin_dasboard/providers/sidemenu_provider.dart';
import 'package:admin_dasboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dasboard/ui/shared/widgets/notifications_indicator.dart';
import 'package:admin_dasboard/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 60,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [

          if (size.width < 700)
          IconButton(onPressed: () => SidemenuProvider.openMenu(context), icon: const Icon(Icons.menu, color: Colors.black87,)),

          const SizedBox(width: 5),

          if (size.width > 390)
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: const SearchText()
          ),

          const Spacer(),

          const NotificationsIndicator(),

          const SizedBox(width: 10),

          const NavbarAvatar(),

          const SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: const Offset(0, 5),
        blurRadius: 5
      )
    ]
  );
}