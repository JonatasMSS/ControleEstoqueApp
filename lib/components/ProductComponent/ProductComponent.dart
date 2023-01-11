import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 2),
              blurRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TEXT SECTION
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'BOKUS SAL',
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'RS 23,00 UN',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Em estoque: 4',
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),

            const CounterItem(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFF4747),
                    maxRadius: 19,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    maxRadius: 19,
                    child: Icon(
                      Icons.mode_edit_outline_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class CounterItem extends StatelessWidget {
  const CounterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CircleAvatar(
            maxRadius: 15,
            backgroundColor: Color(0xFFFF4747),
            child: Icon(
              Icons.remove,
              color: Colors.white,
              size: 27,
            ),
          ),
          Text('4'),
          CircleAvatar(
            maxRadius: 15,
            backgroundColor: Color(0xFF6AFF79),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }
}
