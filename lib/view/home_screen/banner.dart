import 'package:flutter/material.dart';

class MyBanner extends StatefulWidget {
  const MyBanner({super.key});

  @override
  State<MyBanner> createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNulsGxPIyBQvSHfbjd9XkPdm9IU-wjAkpUghRAZX0Tw&usqp=CAU&ec=48600112')),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 160, bottom: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .2,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xffd6b738),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: const Text(
                        'Vegi',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                                color: Colors.green,
                                blurRadius: 10,
                                offset: Offset(3, 3)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '30% off',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          color: Colors.green.shade900,
                          blurRadius: 10,
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'On all vegitables products',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            color: Colors.green.shade900,
                            blurRadius: 10,
                            offset: const Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
