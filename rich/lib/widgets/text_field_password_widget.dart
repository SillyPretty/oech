import 'package:flutter/material.dart';

class TextFieldPasswordWidget extends StatefulWidget {
  final String textTitle;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;

  const TextFieldPasswordWidget({
    super.key,
    required this.controller,
    required this.textTitle,
    required this.hintText,
    this.inputType = TextInputType.text,
  });

  @override
  State<TextFieldPasswordWidget> createState() =>
      _TextFieldPasswordWidgetState();
}

var isObsText = true;

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.textTitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(167, 167, 167, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              controller: widget.controller,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(58, 58, 58, 1),
              ),
              cursorColor: const Color.fromRGBO(167, 167, 167, 1),
              obscureText: isObsText,
              keyboardType: widget.inputType,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: InkWell(
                  onTap: () {
                    isObsText = !isObsText;
                    setState(() {});
                  },
                  child: Icon(
                    isObsText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: InputBorder.none,
                fillColor: Colors.transparent,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(167, 167, 167, 1), width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(167, 167, 167, 1),
                    width: 1,
                  ),
                ),
                hintStyle: const TextStyle(color: Colors.transparent),
                hintText: widget.hintText,
                labelText: widget.hintText,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(207, 207, 207, 1),
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}