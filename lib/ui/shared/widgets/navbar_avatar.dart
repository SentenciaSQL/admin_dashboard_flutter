import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ClipOval(
      child: Container(
        child: Image.network('https://scontent.fsdq1-2.fna.fbcdn.net/v/t1.6435-9/182060529_10219306284264747_6266120771531992703_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFfrh57D_U_JCowbP2O257VRVmeWBxirpZFWZ5YHGKulvRnnfWZsZHdNArgj1LXf9A&_nc_ohc=hl-3i0W1HIIAX_7rfHW&_nc_ht=scontent.fsdq1-2.fna&oh=00_AfC-_1Kd5LLFE6PbqrnvxewQ45MCXdeA9iHpP_zTXAJFkg&oe=63E407A2'),
        width: 30,
        height: 30,
      ),
    );
  }
}