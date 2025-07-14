import 'package:flutter/material.dart';

class WheaterBoxDay extends StatelessWidget {
  const WheaterBoxDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
      ),
      child: Container(
        child: Row(
          children: [
            Text(
              'Seg',
              style: TextStyle(
                  color: const Color.fromARGB(141, 255, 252, 252),
                  fontSize: 15),
            ),
            Spacer(),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/icons/11d.png",
                            width: 45,
                            fit: BoxFit
                                .cover, // ou use BoxFit.fill dependendo da imagem
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextSpan(
                    text: 'Chuva',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(141, 255, 252, 252),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '+20°',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                      text: '+14°',
                      style: TextStyle(
                          color: const Color.fromARGB(141, 255, 252, 252),
                          fontWeight: FontWeight.w600))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
