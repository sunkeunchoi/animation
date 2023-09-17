// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "language": MessageLookupByLibrary.simpleMessage("한글"),
        "login_screen_AlreadyHaveAccountButton":
            MessageLookupByLibrary.simpleMessage("이미 계정이 있으신가요?"),
        "login_screen_CreateNewAccountButton":
            MessageLookupByLibrary.simpleMessage("계정을 만드세요"),
        "login_screen_EmailHint": MessageLookupByLibrary.simpleMessage("이메일"),
        "login_screen_ForgotPasswordButton":
            MessageLookupByLibrary.simpleMessage("비밀번호를 잊으셨나요?"),
        "login_screen_LoginButton": MessageLookupByLibrary.simpleMessage("로그인"),
        "login_screen_PasswordHint":
            MessageLookupByLibrary.simpleMessage("패스워드")
      };
}
