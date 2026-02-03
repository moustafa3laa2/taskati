import 'package:flutter/material.dart';

class StatusContainer extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  const StatusContainer({
    super.key,

    this.isSelected = false, required this.title, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xff4e5ae8) : Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
