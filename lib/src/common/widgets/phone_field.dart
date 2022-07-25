import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PhoneField extends StatefulWidget {
  const PhoneField(
      {Key? key, required this.onCountryChanged, required this.onNumberChanged})
      : super(key: key);
  final void Function(CountryCode)? onCountryChanged;
  final Function(String)? onNumberChanged;
  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: widget.onNumberChanged,
      decoration: InputDecoration(
        labelText: "Phone Number",
        prefixIcon: SizedBox(
          height: 60,
          width: 100,
          child: CountryCodePicker(
            // onChanged: (CountryCode value) => coutryCode = value.dialCode!,
            onChanged: widget.onCountryChanged,
            initialSelection: 'IT',
            favorite: const ['FR', '+234', '+1'],
            alignLeft: false,
          ),
        ),
      ),
    );
  }
}
