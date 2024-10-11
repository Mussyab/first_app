import 'package:first_app/screens/navigation_screen.dart';
import 'package:first_app/widgets/container_button_modal.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image(
                image: AssetImage("assets/images/success.png"),
                height: 250,
              ),
              SizedBox(height: 15),
              Text(
                "Success!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Your order will be delivered soon.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Thank You! for choosing us",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationScreen(),
                    ));
              },
              child: ContainerButtonModal(
                itext: "Continue Shopping",
                containerWidth: MediaQuery.of(context).size.width,
                bgColor: Color(0xFFDB3022),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
