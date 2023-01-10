import 'package:admin_dasboard/ui/cards/white_card.dart';
import 'package:admin_dasboard/ui/labels/custom_labes.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: ListView(
       physics: const ClampingScrollPhysics(),
       children: [
          Text('Icons View', style: CustomLabels.h1),
          const SizedBox(height: 10,),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                title: "ac_unit_outlined",
                width: 230,
                child: Center(child: Icon(Icons.ac_unit_outlined)),
              ),
              WhiteCard(
                title: "dangerous",
                width: 230,
                child: Center(child: Icon(Icons.dangerous)),
              ),
              WhiteCard(
                title: "face_outlined",
                width: 230,
                child: Center(child: Icon(Icons.face_outlined)),
              ),
              WhiteCard(
                title: "hail",
                width: 230,
                child: Center(child: Icon(Icons.hail)),
              ),
              WhiteCard(
                title: "wallet_membership_sharp",
                width: 230,
                child: Center(child: Icon(Icons.wallet_membership_sharp)),
              ),
              WhiteCard(
                title: "baby_changing_station_rounded",
                width: 230,
                child: Center(child: Icon(Icons.baby_changing_station_rounded)),
              ),
              WhiteCard(
                title: "h_plus_mobiledata_outlined",
                width: 230,
                child: Center(child: Icon(Icons.h_plus_mobiledata_outlined)),
              )
            ],
          )
       ],

      ),
    );
  }
}