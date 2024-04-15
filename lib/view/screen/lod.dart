import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/ttest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';

class Log extends StatelessWidget {
  final VerificationController verificationController = Get.put(VerificationController());

   Log({super.key});

  Widget _buildNumberPadButton(String number, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            number,
            style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('أدخل رمز التحقق'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // مؤشرات الأرقام
            GetBuilder<VerificationController>(
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: 
                    
      
                      
                      List.generate(6, (index) {
                        return Container(
                          margin:const  EdgeInsets.all(8),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: index < controller.verificationCode.length ? Colors.deepPurple : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                        );
                      }),
                    ),






                     OtpTextField(
                borderRadius: BorderRadius.circular(20),
                focusedBorderColor: AppColor.praimaryColor,
                cursorColor: AppColor.grey,
                fieldWidth: 42.0,
                numberOfFields: 6,
                borderColor: const Color.fromARGB(255, 129, 45, 168),
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                },
                onSubmit: (String verificationCode) {
                  Get.toNamed(AppRoute.successSignUp);
                  // controller.goToSuccessSignUp(verificationCode);
                }, 
              ),
          
              const SizedBox(
                height: 30,
              ),

                  ],
                );
              },
            ),
            const SizedBox(height: 40),
            // لوحة الأرقام
            Expanded(
              child: GridView.builder(
                itemCount: 12,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  if (index < 9) {
                    // أزرار الأرقام
                    return _buildNumberPadButton('${index + 1}', () {
                      verificationController.addNumber('${index + 1}');
                    });
                  } else if (index == 9) {
                    // زر فارغ
                    return const SizedBox.shrink();
                  } else if (index == 10) {
                    // زر الصفر
                    return _buildNumberPadButton('0', () {
                      verificationController.addNumber('0');
                    });
                  } else if (index == 11) {
                    // زر الحذف
                    return _buildNumberPadButton('<', () {
                      verificationController.removeNumber();
                    });
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}