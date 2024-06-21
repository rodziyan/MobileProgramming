import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String? option;
  final IconData? trailingIcon;

  const ProfileButton({super.key, this.option, this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                offset: const Offset(0.0, 1.5),
                color: Colors.black87.withOpacity(0.15),
                spreadRadius: 0.8)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option ?? "",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Icon(
            trailingIcon ?? Icons.person,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
