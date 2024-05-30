import 'package:flutter/material.dart';

class CustomWarp extends StatelessWidget {
  const CustomWarp({
    super.key,
    required this.list,
    required this.selectedIndex,
    required this.onSelected,
    required this.onDelete,
  });
  final List<String> list;
  final int selectedIndex;
  final Function(int) onSelected;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Wrap(
        spacing: 8.0,
        children: List<Widget>.generate(
          list.length,
          (index) {
            final l = list[index];
            return InputChip(
              label: Text(l),
              onSelected: (_) => onSelected(index),
              onDeleted: 
              ()=> 
              onDelete(index),
              deleteIcon: Icon(Icons.cancel, size: 18,),
              selected: selectedIndex == index,
              selectedColor: Colors.pink.shade100,
              showCheckmark: false,
              avatarBorder: Border.all(
                color: Colors.pink,
              ),
            );
          },
        ),
      ),
    );
  }
}
