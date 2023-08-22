import 'package:animation_class/screens/onboarding/svg/twitter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.string(
          twitterString,
          height: 30,
        ),
        leading: TextButton(
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
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Align(
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
              TextWidget(
                fieldType: TextFieldType.name,
              ),
              TextWidget(
                fieldType: TextFieldType.email,
              ),
              TextWidget(
                fieldType: TextFieldType.dob,
              ),
            ],
          ),
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
        return "Email";
      case TextFieldType.dob:
        return "Date of birth";
    }
  }
}

class TextWidget extends StatefulWidget {
  const TextWidget({
    super.key,
    required this.fieldType,
  });
  final TextFieldType fieldType;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  final TextEditingController _controller = TextEditingController();

  void _onTap(BuildContext context) async {
    {
      // DateTime? pickedDate = await showDatePicker(
      //   context: context, initialDate: DateTime.now(),
      //   firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
      //   lastDate: DateTime(2101),
      // );
      DateTime? pickedDate = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          maximumDate: DateTime.now(),
          minimumYear: 2018,
          maximumYear: 2020,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime value) {},
        ),
      );

      if (pickedDate != null) {
        // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
        // String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
        // print(formattedDate); //formatted date output using intl package =>  2021-03-16
        //you can implement different kind of Date Format here according to your requirement
        String formattedDate = DateFormat.yMMMMd('en_US').format(pickedDate);
        setState(() {
          _controller.text = formattedDate; //set output date to TextField value.
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onTap: widget.fieldType == TextFieldType.dob ? () => _onTap(context) : null,
      readOnly: widget.fieldType == TextFieldType.dob ? true : false,
      decoration: InputDecoration(
        focusColor: Colors.black,
        suffix: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 28,
        ),
        helperText: widget.fieldType == TextFieldType.dob
            ? "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else."
            : null,
        labelText: widget.fieldType.title,
      ),
    );
  }
}
