import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool hasCircularBorder;

  const MainButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.hasCircularBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shape: hasCircularBorder
              ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          )
              : null,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}

class DropDownMenuComponent extends StatelessWidget {
  final void Function(String? value) onChanged;
  final List<String> items;
  final String hint;
  const DropDownMenuComponent({
    Key? key,
    required this.onChanged,
    required this.items,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: null,
      icon: const Icon(Icons.list_alt),
      isExpanded: false,
      elevation: 5,
     // style: Theme.of(context).textTheme.headline5,
      focusColor: Colors.red,
    //  dropdownColor: Colors.red,
     /* hint: FittedBox(
        child:                           IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.sort,
            color: Colors.black,
          ),
        ),

        //Text(hint),
      ),*/
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
void navto(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
