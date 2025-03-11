import 'package:chateo/core/constans/colors.dart';
import 'package:chateo/core/constans/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ContactsRow extends StatelessWidget {
  final VoidCallback onPressed;

  const ContactsRow({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          InkWell(
            onTap: onPressed,
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'John Doe',
                      style: TextStyle(
                          fontSize: 18,
                          color: TColor.text_primary,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Last seen: 10:30 AM',
                      style: TextStyle(
                          fontSize: 14,
                          color: TColor.text_secondary,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
           Divider(height: 35, thickness: 1, color: BColor.divider_line),
        ],
      ),
    );
  }
}
