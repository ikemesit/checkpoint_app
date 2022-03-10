import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

import '../checkpoint_theme.dart';

class CountrySelectorWidget extends StatelessWidget {
  final TextEditingController controller;
  const CountrySelectorWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Country', style: CheckpointTheme.lightTextTheme.headline5),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              color: const Color(0xfff2f3f8),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CountryListPick(
              appBar: AppBar(
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                actions: const [],
                elevation: 0,
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                title: const Text('Select a country'),
              ),
              theme: CountryTheme(
                labelColor: Colors.black,
                isShowFlag: true,
                isShowTitle: true,
                isShowCode: false,
                isDownIcon: true,
                showEnglishName: true,
              ),
              initialSelection: 'MY',
              onChanged: (CountryCode? code) {
                controller.text = code != null ? code.code as String : 'MY';
              },
              useUiOverlay: true,
              useSafeArea: false,
            ),
          ),
        ),
      ],
    );
  }
}
