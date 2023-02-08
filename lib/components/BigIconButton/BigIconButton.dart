import 'package:flutter/material.dart';

class BigIconButton extends StatelessWidget {
  final String? description;
  final String imageLocation;
  final Function()? onClick;

  const BigIconButton({
    Key? key,
    this.description,
    required this.imageLocation,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 140,
          maxHeight: 140,
        ),
        // width: 150,
        // height: 150,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFC6C6C6),
                blurRadius: 5,
                offset: Offset(1, 2),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageLocation,
              width: 80,
              height: 80,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(description ?? "NO DATA"),
          ],
        ),
      ),
    );
  }
}
