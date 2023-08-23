import 'package:animation_class/screens/onboarding/customize_experience_screen.dart';
import 'package:animation_class/screens/onboarding/svg/twitter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({
    super.key,
    this.name = "",
    this.email = "",
    this.dob = "",
    this.isAgreed = false,
  });
  final String name;
  final String email;
  final String dob;
  final bool isAgreed;
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    _dobController.text = widget.dob;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.isAgreed == true
          ? null
          : BottomAppBar(
              elevation: 5,
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: DatePickerIOS(
                controller: _dobController,
              ),
            ),
      appBar: AppBar(
        title: SvgPicture.string(
          twitterString,
          height: 30,
        ),
        leading: widget.isAgreed == true
            ? null
            : TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
        leadingWidth: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: SizedBox(
          width: double.infinity,
          // height: MediaQuery.of(context).copyWith().size.height / 2 * 1.05,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextWidget(
                fieldType: TextFieldType.name,
                controller: _nameController,
                onTap: () => setState(() {}),
              ),
              TextWidget(
                fieldType: TextFieldType.email,
                controller: _emailController,
                onTap: () => setState(() {}),
              ),
              TextWidget(
                fieldType: TextFieldType.dob,
                controller: _dobController,
                onTap: () => setState(() {}),
              ),
              if (!widget.isAgreed)
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        if (_nameController.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _dobController.text.isEmpty) {
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomizeExperienceScreen(
                              name: _nameController.text,
                              email: _emailController.text,
                              dob: _dobController.text,
                            ),
                          ),
                        );
                      },
                      child: NextButton(
                        isDisabled:
                            _nameController.text.isEmpty || _emailController.text.isEmpty || _dobController.text.isEmpty
                                ? true
                                : false,
                      ),
                    ),
                  ),
                ),
              if (widget.isAgreed) ...[
                const Expanded(
                  child: SizedBox(height: 20),
                ),
                const SignUpButton(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text.rich(
          TextSpan(
            text: "By signing up, you agree to the ",
            children: [
              TextSpan(
                text: "Terms of Service",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              TextSpan(text: " and "),
              TextSpan(
                text: "Privacy Policy",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              TextSpan(text: ", including "),
              TextSpan(
                text: "Cookie Use",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              TextSpan(
                text:
                    ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like kepping your account secure and personalizing our services, including ads. ",
              ),
              TextSpan(
                text: "Learn more",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              TextSpan(
                text:
                    ". Others will be able to find you by email or phone number, when provided unless you choose otherwise ",
              ),
              TextSpan(
                text: "here",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              TextSpan(text: "."),
            ],
          ),
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              30,
            ),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: const Center(
            child: Text(
              "Sign up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.isDisabled,
  });
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30,
        ),
        color: Colors.grey.shade500,
      ),
      child: Text(
        "Next",
        style: TextStyle(
          color: Colors.grey.shade300,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

enum TextFieldType {
  name,
  email,
  dob,
}

extension on TextFieldType {
  String get title {
    switch (this) {
      case TextFieldType.name:
        return "Name";
      case TextFieldType.email:
        return "Phone number or email address";
      case TextFieldType.dob:
        return "Date of birth";
    }
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.fieldType,
    required this.controller,
    required this.onTap,
  });
  final TextFieldType fieldType;
  final TextEditingController controller;
  final VoidCallback onTap;

  void _onTap(BuildContext context) async {
    {
      // Scaffold.of(context).showBottomSheet(
      //   elevation: 2,
      //   (BuildContext context) => Container(
      //     height: MediaQuery.of(context).copyWith().size.height / 3,
      //     decoration: const BoxDecoration(
      //       border: Border(
      //         top: BorderSide(color: Colors.grey, width: 0.5),
      //       ),
      //     ),
      //     child: DatePickerIOS(controller: controller),
      //   ),
      // );
      // showCupertinoDialog(
      //   barrierDismissible: true,
      //   context: context,
      //   builder: (context) => DatePickerIOS(controller: controller),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: fieldType == TextFieldType.dob ? () => _onTap(context) : null,
      readOnly: fieldType == TextFieldType.dob ? true : false,
      style: TextStyle(
        color: Colors.blue.shade600,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        focusColor: Colors.black,
        suffix: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 28,
        ),
        helperText: fieldType == TextFieldType.dob
            ? "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else."
            : null,
        labelText: fieldType.title,
      ),
    );
  }
}

class DatePickerIOS extends StatelessWidget {
  const DatePickerIOS({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.white,
          dateTimePickerTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      child: CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        maximumDate: DateTime.now(),
        minimumYear: 1900,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (DateTime value) {
          var text = DateFormat.yMMMMd('en_US').format(value);
          controller.text = text;
        },
      ),
    );
  }
}
