import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      margin: const EdgeInsets.symmetric(horizontal: 50.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.elliptical(6.0, 40.0),
          topRight: Radius.elliptical(6.0, 40.0),
          bottomLeft: Radius.elliptical(6.0, 40.0),
          bottomRight: Radius.elliptical(6.0, 40.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 55.0),
                      child: Text(
                        'Texto digitado 1',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 1.0,
                  color: Colors.grey.shade400,
                  margin: const EdgeInsets.only(top: 8.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}