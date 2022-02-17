import 'package:flutter/material.dart';
import 'package:unsplash_flutter/utils/utils.dart';

class SearchInput extends StatelessWidget {
  const SearchInput(
      {Key? key, this.hintText, this.margin, this.controller, this.onSearch})
      : super(key: key);

  final String? hintText;
  final EdgeInsets? margin;
  final TextEditingController? controller;
  final VoidCallback? onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: margin,
        decoration: BoxDecoration(
          border: Border.all(color: HexColor('#f8f8f9'), width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Row(
          children: [
            Expanded(
                child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: 'WorkSans',
                            fontSize: 16,
                            color: HexColor('#bbbbbd'))))),
            InkWell(
                child: Icon(Icons.search, color: HexColor('#bbbbbd')),
                onTap: onSearch)
          ],
        ));
  }
}
