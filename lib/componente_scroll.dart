import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ComponenteScroll extends StatelessWidget {
  List<String> textos = [
    'Cafes',
    'Cocina de Mar',
    'Internacionales',
    'Empanadas',
    'Hamburguesas',
    'Parrilla',
    'Pizza'
  ];

  List<String> imagenes = [
    'cafes',
    'cocina_de_mar',
    'comida_china',
    'empanadas',
    'hamburgueserias',
    'parrillas',
    'pizzerias'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: imagenes.length,
      itemBuilder: (BuildContext context, int i) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final radius = constraints.maxHeight / 3.4;
            return Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: 2 * radius + 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CircleAvatar(
                        radius: radius,
                        child:
                            SvgPicture.asset('assets/food/${imagenes[i]}.svg')),
                  ),
                  SizedBox(height: 5),
                  if (constraints.maxHeight > 120)
                    Text(
                      '${textos[i]}',
                      style: TextStyle(
                        fontSize: constraints.maxHeight / 10,
                      ),
                      overflow: TextOverflow.visible,
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('List View Horizontal')),
//       body: Container(
//         height: 115,
//         decoration: BoxDecoration(color: Colors.blue),
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           physics: BouncingScrollPhysics(),
//           itemCount: imagenes.length,
//           itemBuilder: (BuildContext context, int i) {
//             return Container(
//               width: 100,
//               child: LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//                   final radius = min(
//                       constraints.maxHeight / 2.6, constraints.maxWidth / 2.6);
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(height: 5),
//                       SizedBox(
//                         child: CircleAvatar(
//                             radius: radius,
//                             child: SvgPicture.asset(
//                                 'assets/food/${imagenes[i]}.svg')),
//                       ),
//                       SizedBox(height: 5),
//                       Text('${textos[i]}',
//                           style:
//                               TextStyle(fontSize: constraints.maxHeight / 8)),
//                       SizedBox(height: 5),
//                     ],
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
