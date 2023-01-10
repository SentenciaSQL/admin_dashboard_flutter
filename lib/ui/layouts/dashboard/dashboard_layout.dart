import 'package:admin_dasboard/providers/sidemenu_provider.dart';
import 'package:admin_dasboard/ui/shared/Sidebar.dart';
import 'package:admin_dasboard/ui/shared/widgets/navbar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  
  final Widget child;

  const DashboardLayout({ Key? key, required this.child }) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SidemenuProvider.menuController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [

              if (size.width >= 700)
              const Sidebar(),
              
              Expanded(
                child: Column(
                  children: [
                    const Navbar(),
              
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: widget.child,
                      )
                    )
                  ],
                ),
              )

            ],
          ),

          if(size.width < 700)
          AnimatedBuilder(
            animation: SidemenuProvider.menuController, 
            builder: (context, _) => Stack(
              children: [

                if(SidemenuProvider.isOpen)
                 Opacity(
                  opacity: SidemenuProvider.opacity.value,
                  child: GestureDetector(
                    onTap: () => SidemenuProvider.closeMenu(),
                    child: const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black54
                        ),
                      ),
                    ),
                  ),
                 ),

                Transform.translate(
                  offset: Offset(SidemenuProvider.movement.value, 0),
                  child: const Sidebar(),
                ),   
              ],
            )
          )
        ],
      )
    );
  }
}