import 'package:flutter/material.dart';

class CommercialContianer extends StatelessWidget {
  const CommercialContianer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      padding: const EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width * 0.875,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
                text: 'Black Friday',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
                children: [
                  // WidgetSpan(
                  //     child: SizedBox(
                  //   height: 10,
                  // )),
                  TextSpan(
                    text:
                        ' \n\nExplore our new product’s prices\nwith black friday!',
                    style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400),
                  ),

                  TextSpan(
                    text: ' \n\nShop Now!',
                    style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 214, 206, 177)),
                  ),
                ]),
          ),
          Image.asset(
            'assets/images/controller_offers.png',
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width * 0.30,
          )
          // controllersOffersImage

          // controllersOffersImage
        ],
      ),
    );
  }
}
