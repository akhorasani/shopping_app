import 'package:flutter/material.dart';

class AvailableSize extends StatefulWidget {
  const AvailableSize({super.key, required this.size});
  final String size;

  @override
  State<AvailableSize> createState() => _AvailableSizeState();
}

class _AvailableSizeState extends State<AvailableSize> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        width: 40,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected? Colors.red: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.red)
        ),
        child: Text(widget.size, style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
