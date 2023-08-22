import 'package:animation_class/screens/onboarding/create_account_bloc.dart';
import 'package:animation_class/screens/onboarding/svg/twitter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CreateAccountScreen extends StatelessWidget {
  final CreateAccountBloc _bloc = CreateAccountBloc();
  CreateAccountScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: SizedBox(
          width: double.infinity,
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
                stream: _bloc.nameStream,
                onChanged: (String text) => _bloc.updateName(text),
              ),
              TextWidget(
                fieldType: TextFieldType.email,
                stream: _bloc.emailStream,
                onChanged: (String text) => _bloc.updateEmail(text),
              ),
              TextWidget(
                fieldType: TextFieldType.dob,
                stream: _bloc.dobStream,
                onChanged: (String text) => _bloc.updateDob(text),
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
        return "Phone number or email address";
      case TextFieldType.dob:
        return "Date of birth";
    }
  }
}

class TextWidget extends StatefulWidget {
  const TextWidget({
    super.key,
    required this.fieldType,
    required this.stream,
    required this.onChanged,
  });
  final TextFieldType fieldType;
  final Stream<String> stream;
  final Function(String) onChanged;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap(BuildContext context) async {
    {
      showBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          child: CupertinoTheme(
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
                setState(() {
                  _controller.text = text;
                });
              },
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.stream,
      builder: (BuildContext context, AsyncSnapshot<String> textStream) => TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        onTap: widget.fieldType == TextFieldType.dob ? () => _onTap(context) : null,
        readOnly: widget.fieldType == TextFieldType.dob ? true : false,
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
          helperText: widget.fieldType == TextFieldType.dob
              ? "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else."
              : null,
          labelText: widget.fieldType.title,
          errorText: textStream.hasError ? textStream.error.toString() : null,
        ),
      ),
    );
  }
}
