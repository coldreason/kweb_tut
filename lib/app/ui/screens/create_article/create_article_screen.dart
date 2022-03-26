import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kweb/app/controller/create_article_controller.dart';
import 'package:zefyrka/zefyrka.dart';

class CreateArticleScreen extends StatelessWidget {
  const CreateArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreateArticleController createArticleController =
        Get.find<CreateArticleController>();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(123, 3, 19, 1),
            body: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                          child: Center(
                        child: Text('새 게시글 작성하기',
                            style: TextStyle(color: Colors.white)),
                      )),
                      Expanded(
                          child: MaterialButton(
                        onPressed: () {
                          createArticleController.saveDocument();
                        },
                        child: Center(
                          child: Text(
                            '저장하기',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        color: Color.fromRGBO(45, 40, 46, 1),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: createArticleController.titleController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: '제목',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 40,
                            child: ZefyrToolbar.basic(
                                controller:
                                    createArticleController.zcontroller)),
                        Expanded(
                          child: ZefyrEditor(
                            controller: createArticleController.zcontroller,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}

class HangulWebKeyboardSetting extends StatefulWidget {
  final TextEditingController controller;
  final Widget child;

  const HangulWebKeyboardSetting({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  @override
  _HangulWebKeyboardSettingState createState() =>
      _HangulWebKeyboardSettingState();
}

class _HangulWebKeyboardSettingState extends State<HangulWebKeyboardSetting> {
  // ignore: constant_identifier_names
  static const List undetected_list = [
    " ",
    "`",
    "~",
    "!",
    "@",
    "#",
    "\$",
    "%",
    "^",
    "&",
    "*",
    "(",
    ")",
    "-",
    "_",
    "=",
    "+",
    "[",
    "]",
    "{",
    "}",
    "'",
    '"',
    ";",
    ":",
    "/",
    "?",
    ",",
    ".",
    "<",
    ">",
    "\\",
    "|",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0"
  ];

  // ignore: constant_identifier_names
  static const List numberPad_list = [
    "Numpad Decimal",
    "Numpad Divide",
    "Numpad Multiply",
    "Numpad Subtract",
    "Numpad Add",
    "Numpad 0",
    "Numpad 1",
    "Numpad 2",
    "Numpad 3",
    "Numpad 4",
    "Numpad 5",
    "Numpad 6",
    "Numpad 7",
    "Numpad 8",
    "Numpad 9"
  ];

  // ignore: constant_identifier_names
  static const List numerPad_convert = [
    ".",
    "/",
    "*",
    "-",
    "+",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
  ];

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (RawKeyEvent event) async {
          if (event.runtimeType.toString() == 'RawKeyDownEvent') {
            String keydownText = event.data.logicalKey.keyLabel;
            int cursorPosition = widget.controller.selection.baseOffset;
            if (numberPad_list.contains(keydownText)) {
              keydownText =
                  numerPad_convert[numberPad_list.indexOf(keydownText)];
            }
            if (undetected_list.contains(keydownText)) {
              await Future.delayed(const Duration(milliseconds: 10));
              // ignore: non_constant_identifier_names
              List text_list = widget.controller.text.split("");
              try {
                if (text_list[cursorPosition] != keydownText) {
                  text_list.insert(cursorPosition, keydownText);
                  widget.controller.text = text_list.join();
                  widget.controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: cursorPosition + 1));
                }
              } catch (e) {
                if (text_list[widget.controller.text.length - 1] !=
                    keydownText) {
                  widget.controller.text = widget.controller.text + keydownText;
                  widget.controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: widget.controller.text.length));
                }
              }
            }
          }
        },
        child: widget.child);
  }
}
