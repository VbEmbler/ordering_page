import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ordering_page/features/ordering_page/providers/sender_provider.dart';
import 'package:provider/provider.dart';

class SenderDetailsAddAddressWidget extends StatelessWidget {
  SenderDetailsAddAddressWidget({Key? key}) : super(key: key);

  final TextEditingController fullNameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  final TextEditingController countryTextEditingController =
      TextEditingController();
  final TextEditingController cityTextEditingController =
      TextEditingController();
  final TextEditingController postcodeTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final SenderProvider senderProvider = context.read<SenderProvider>();

    fullNameTextEditingController.text = senderProvider.fullName;
    emailTextEditingController.text = senderProvider.email;
    phoneNumberTextEditingController.text = senderProvider.phoneNumber;
    countryTextEditingController.text = senderProvider.country;
    cityTextEditingController.text = senderProvider.city;
    postcodeTextEditingController.text = senderProvider.postcode == null
        ? ''
        : senderProvider.postcode.toString();

    List<String> addressLineList =
        context.watch<SenderProvider>().addressLineList;

    List<Widget> addressLines = List.generate(addressLineList.length, (index) {
      final TextEditingController textEditingController =
          TextEditingController();
      textEditingController.text = addressLineList[index];
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address line ${index + 1}*',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: textEditingController,
            onChanged: (value) => senderProvider.setAddressLine(value, index),
            style: textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: SvgPicture.asset(
                  'assets/icons/address_line.svg',
                  height: 20,
                  width: 20,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full name*',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: fullNameTextEditingController,
          onChanged: (value) => senderProvider.setFullName(value),
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SvgPicture.asset(
                'assets/icons/person.svg',
                height: 20,
                width: 20,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Email*',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailTextEditingController,
          onChanged: (value) => senderProvider.setEmail(value),
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SvgPicture.asset(
                'assets/icons/email.svg',
                height: 20,
                width: 20,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Phone number*',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.phone,
          controller: phoneNumberTextEditingController,
          onChanged: (value) => senderProvider.setPhoneNumber(value),
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SvgPicture.asset(
                'assets/icons/phone.svg',
                height: 20,
                width: 20,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFE7ECF0),
        ),
        const SizedBox(height: 10),
        Text(
          'Country*',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: countryTextEditingController,
          onChanged: (value) => senderProvider.setCountry(value),
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SvgPicture.asset(
                'assets/icons/country.svg',
                height: 20,
                width: 20,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'City*',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: cityTextEditingController,
          onChanged: (value) => senderProvider.setCity(value),
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SvgPicture.asset(
                'assets/icons/city.svg',
                height: 20,
                width: 20,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...addressLines,
        const SizedBox(height: 5),
        TextButton(
          onPressed: () {
            senderProvider.addEmptyItemToAddressList();
          },
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.centerLeft),
          child: Text(
            'Add address line +',
            style: textTheme.titleMedium!.copyWith(
              color: const Color(0xFFEA560D),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Postcode',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: postcodeTextEditingController,
          onChanged: (value) => senderProvider.setPostcode(int.parse(value)),
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SvgPicture.asset(
                'assets/icons/postcode.svg',
                height: 20,
                width: 20,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0xFFA9B5C1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
