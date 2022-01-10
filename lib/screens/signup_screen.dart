import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Gender { male, female, other }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Gender _gender = Gender.male;
  String? _selectedCountry = 'Select a country';

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      // style: style,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        hintStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final firstNameField = TextField(
      obscureText: false,
      // style: style,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "First Name",
        hintStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final lastNameField = TextField(
      obscureText: false,
      // style: style,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Last Name",
        hintStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final icField = TextField(
      obscureText: false,
      // style: style,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "IC/Passport No",
        hintStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final phoneNoField = TextField(
      obscureText: false,
      // style: style,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Contact No",
        hintStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xfff2f3f8),
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        children: [
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 10.0,
            height: 80.0,
            child: Text(
              'SIGN UP',
              style: CheckpointTheme.lightTextTheme.headline1,
              softWrap: true,
            ),
          ),
          firstNameField,
          const SizedBox(
            height: 20.0,
          ),
          lastNameField,
          const SizedBox(
            height: 20.0,
          ),
          emailField,
          const SizedBox(
            height: 20.0,
          ),
          phoneNoField,
          const SizedBox(
            height: 20.0,
          ),
          icField,
          const SizedBox(
            height: 20.0,
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     alignment: Alignment.centerLeft,
          //     elevation: 0,
          //     primary: Colors.white,
          //     minimumSize: const Size(250.0, 50.0),
          //   ),
          //   onPressed: () {
          //     showCountryPicker(
          //       context: context,
          //       countryListTheme: CountryListThemeData(
          //         flagSize: 25,
          //         backgroundColor: Colors.white,
          //         textStyle:
          //             const TextStyle(fontSize: 16, color: Colors.blueGrey),
          //         //Optional. Sets the border radius for the bottomsheet.
          //         borderRadius: const BorderRadius.only(
          //           topLeft: Radius.circular(20.0),
          //           topRight: Radius.circular(20.0),
          //         ),
          //         //Optional. Styles the search field.
          //         inputDecoration: InputDecoration(
          //           labelText: 'Search',
          //           hintText: 'Start typing to search',
          //           prefixIcon: const Icon(Icons.search),
          //           border: OutlineInputBorder(
          //             borderSide: BorderSide(
          //               color: const Color(0xFF8C98A8).withOpacity(0.2),
          //             ),
          //           ),
          //         ),
          //       ),
          //       onSelect: (Country country) {
          //         // setState(
          //         //   () {
          //         _selectedCountry = country as String;
          //         //   },
          //         // );
          //       },
          //     );
          //   },
          //   child: Text(
          //     '$_selectedCountry',
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       color: Colors.black,
          //       fontSize: 16.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(36.0))),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CountryListPick(
                appBar: AppBar(
                  backgroundColor: Colors.deepOrange,
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
                  setState(() {
                    _selectedCountry = code?.name;
                  });
                  print(code?.name);
                  print(code?.code);
                  print(code?.dialCode);
                  print(code?.flagUri);
                },
                useUiOverlay: true,
                useSafeArea: false,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Gender',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Male'),
                leading: Radio<Gender>(
                  value: Gender.male,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value as Gender;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Female'),
                leading: Radio<Gender>(
                  value: Gender.female,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value as Gender;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Other'),
                leading: Radio<Gender>(
                  value: Gender.other,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value as Gender;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange,
              minimumSize: const Size(250.0, 50.0),
            ),
            onPressed: () {},
            child: const Text(
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
