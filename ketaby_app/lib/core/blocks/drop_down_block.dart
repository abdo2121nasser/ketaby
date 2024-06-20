import 'package:flutter/material.dart';

import '../cubits/prodect_cubit/product_cubit.dart';



class DropDownBlock extends StatelessWidget {
              final String hint;
              final List<String> items;

              DropDownBlock({required this.hint,required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonFormField<String>(
        hint: Text(hint,
        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (data) {
          ProductCubit.get(context).currentGovenment=data;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            // borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        // Set the dropdown icon
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        iconEnabledColor: Colors.grey,
        // Set the elevation of the dropdown menu
        elevation: 16,
        // Set the style of the dropdown items
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),

    );
  }
}
