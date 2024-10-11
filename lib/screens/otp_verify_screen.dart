import 'package:first_app/screens/recovery_screen.dart';
import 'package:flutter/material.dart';
// import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  TextEditingController textEditingController =
      new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEF6969),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 60),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter the OTP we have sent you to your Number",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 30),
              // TextFieldPin(
              //     textController: textEditingController,
              //     autoFocus: false,
              //     codeLength: 4,
              //     alignment: MainAxisAlignment.center,
              //     defaultBoxSize: 55.0,
              //     margin: 10,
              //     selectedBoxSize: 55.0,
              //     textStyle: TextStyle(fontSize: 16),
              //     defaultDecoration: _pinPutDecoration.copyWith(
              //         border: Border.all(color: Colors.grey)),
              //     selectedDecoration: _pinPutDecoration,
              //     onChange: (code) {
              //       setState(() {});
              //     }),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecoveryScreen(),
                      ));
                },
                child: Text(
                  "Verify",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55),
                  backgroundColor: Color(0xEFEf6969),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
