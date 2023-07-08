import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wordle/app/widgets/button_widget.dart';

openDialog(
        {required BuildContext context,
        required String title,
        String? message,
        String secretWord = '',
        Color secretWordColor = const Color(0xff85DF7D),
        Color titleColor = Colors.black,
        void Function()? clickButton}) =>
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              alignment: Alignment.topCenter,
              insetPadding: const EdgeInsets.symmetric(vertical: 200),
              title: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                  Positioned(
                      top: -18,
                      right: -18,
                      child: IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: () => Modular.to.pop(),
                          icon: const Icon(
                            Icons.close,
                            color: Colors.grey,
                          )))
                ],
              ),
              titleTextStyle: TextStyle(
                  color: titleColor, fontSize: 26, fontWeight: FontWeight.bold),
              content: message != null
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: message,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: secretWord,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: secretWordColor)),
                          ],
                        ),
                      ))
                  : null,
              actions: [
                ButtonWidget(
                  text: 'PRÓXIMO',
                  onPressed: clickButton,
                )
              ],
              actionsAlignment: MainAxisAlignment.center,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ));
