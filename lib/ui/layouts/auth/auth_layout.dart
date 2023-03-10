import 'package:admin_dasboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dasboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dasboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {

  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
      
            (size.width > 1000) ?_DesktopBody(child: child) : _MobileBody(child: child),
      
            const LinksBar()
          
          ],
        ),
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {

  final Widget child;

  const _DesktopBody({
    Key? key, required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.95,
      width: size.width,
      child: Row(
        children: [
          
          const Expanded(child: BackgroundTwitter()),

          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const CustomTitle(),
                const SizedBox(height: 50),
                Expanded(
                  child: child
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {

  final Widget child;

  const _MobileBody({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}
