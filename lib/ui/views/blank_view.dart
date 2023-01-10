import 'package:admin_dasboard/ui/cards/white_card.dart';
import 'package:admin_dasboard/ui/labels/custom_labes.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: ListView(
       physics: const ClampingScrollPhysics(),
       children: [
          Text('Blank View', style: CustomLabels.h1),
          const SizedBox(height: 10,),

          const WhiteCard(
            title: 'Sales Statistic',
            child: Text('Hola Mundo')
          )
       ],

      ),
    );
  }
}