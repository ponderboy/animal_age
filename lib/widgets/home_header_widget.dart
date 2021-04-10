import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 15, 40, 20),
          child: SvgPicture.asset(
            'assets/images/animal-age-logo.svg',
            semanticsLabel: 'Animal Age Logo',
            placeholderBuilder: (BuildContext context) => Container(
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 50),
          child: DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 2.0,
            dashLength: 2.0,
            dashColor: Theme.of(context).primaryColor,
            dashRadius: 2.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          ),
        ),
      ],
    );
  }
}
