import 'package:flutter/material.dart';

class IdCardAppBar extends StatelessWidget {
  const IdCardAppBar({
    Key? key,
    required this.headerTitle,
  }) : super(key: key);

  final String headerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFF0909),
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Center(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 28,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  headerTitle,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
