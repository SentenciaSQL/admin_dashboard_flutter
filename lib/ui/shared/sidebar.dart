import 'package:admin_dasboard/providers/sidemenu_provider.dart';
import 'package:admin_dasboard/router/router.dart';
import 'package:admin_dasboard/services/navigation_service.dart';
import 'package:admin_dasboard/ui/shared/widgets/custom_menu_item.dart';
import 'package:admin_dasboard/ui/shared/widgets/logo.dart';
import 'package:admin_dasboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({ Key? key }) : super(key: key);

  navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SidemenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context){

    final sideMenuProvider = Provider.of<SidemenuProvider>(context); 

    return Container(
      width: 250,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),

          const SizedBox(height: 50),
          const TextSeparator(text: 'Main'),
          CustomMenuItem(text: 'Dashboard', icon: Icons.compass_calibration_outlined, onPressed: () => navigateTo(Flurorouter.dashboardRoute), isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute),
          CustomMenuItem(text: 'Orders', icon: Icons.shopping_cart, onPressed: () => null),
          CustomMenuItem(text: 'Analytic', icon: Icons.chat_rounded, onPressed: () => null),
          CustomMenuItem(text: 'Categories', icon: Icons.layers_outlined, onPressed: () => null),
          CustomMenuItem(text: 'Products', icon: Icons.production_quantity_limits, onPressed: () => null),
          CustomMenuItem(text: 'Discount', icon: Icons.attach_money_outlined, onPressed: () => null),
          CustomMenuItem(text: 'Customers', icon: Icons.people_alt_outlined, onPressed: () => null),

          const SizedBox(height: 30),
          const TextSeparator(text: 'UI Elements'),
          CustomMenuItem(text: 'Icons', icon: Icons.list_alt_outlined, onPressed: () => navigateTo(Flurorouter.iconsRoute), isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute),
          CustomMenuItem(text: 'Marketing', icon: Icons.mark_chat_read_outlined, onPressed: () => null),
          CustomMenuItem(text: 'Campaing', icon: Icons.note_alt_outlined, onPressed: () => null),
          CustomMenuItem(text: 'Blank Page', icon: Icons.post_add_outlined, onPressed: () => navigateTo(Flurorouter.blankPageRoute), isActive: sideMenuProvider.currentPage == Flurorouter.blankPageRoute),

          const SizedBox(height: 30),
          const TextSeparator(text: 'Exit'),
          CustomMenuItem(text: 'Logout', icon: Icons.exit_to_app_outlined, onPressed: () => null),

        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xFF092044),
        Color(0xFF092042),
      ],
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ]
  );
}