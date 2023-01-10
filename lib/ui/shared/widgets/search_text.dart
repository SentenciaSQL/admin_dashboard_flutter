import 'package:admin_dasboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 40,
      decoration: builBoxDecaration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(hint: 'Seach', icon: Icons.search),
      ),
    );
  }

  BoxDecoration builBoxDecaration() {
    return BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(5)
    );
  }
}