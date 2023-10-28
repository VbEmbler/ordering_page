import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ordering_page/features/ordering_page/providers/sender_provider.dart';
import 'package:ordering_page/features/ordering_page/widgets/sender_details_add_address_widget.dart';
import 'package:ordering_page/features/ordering_page/widgets/sender_details_select_address_widget.dart';
import 'package:ordering_page/features/ordering_page/widgets/toggle_navigation_button.dart';
import 'package:provider/provider.dart';

class SenderDetailsWidget extends StatefulWidget {
  const SenderDetailsWidget({Key? key}) : super(key: key);

  @override
  State<SenderDetailsWidget> createState() => _SenderDetailsWidgetState();
}

class _SenderDetailsWidgetState extends State<SenderDetailsWidget> {
  int selectedSenderDetailsIndex = 0;
  bool isAddAddress = true;
  late final SenderProvider senderProvider;
  String? error;

  @override
  void initState() {
    senderProvider = context.read<SenderProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Sender details',
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        toggleAddressButtons(),
        const SizedBox(height: 20),
        if (error != null) ...[
          const SizedBox(height: 10),
          Center(
            child: Text(
              error!,
              textAlign: TextAlign.center,
              style: textTheme.headlineLarge!.copyWith(color: Colors.red),
            ),
          ),
          const SizedBox(height: 20),
        ],
        Visibility(
          visible: isAddAddress,
          child: SenderDetailsAddAddressWidget(),
        ),
        Visibility(
          visible: !isAddAddress,
          child: const SenderDetailsSelectAddressWidget(),
        ),
      ],
    );
  }

  Row toggleAddressButtons() {
    return Row(
      children: [
        Expanded(
          child: ToggleNavigationButton(
            title: 'Add address',
            isSelected: selectedSenderDetailsIndex == 0,
            onPressed: () {
              setState(() {
                selectedSenderDetailsIndex = 0;
                isAddAddress = true;
              });
              //pageController.jumpToPage(0);
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ToggleNavigationButton(
            title: 'Select address',
            isSelected: selectedSenderDetailsIndex == 1,
            onPressed: () {
              if (_validate()) {
                setState(() {
                  isAddAddress = false;
                  selectedSenderDetailsIndex = 1;
                });
              }
              //pageController.jumpToPage(1);
            },
          ),
        ),
      ],
    );
  }

  bool _validate() {
    if (senderProvider.fullName.isEmpty) {
      setState(() {
        error = 'Please enter FullName';
      });
      return false;
    }
    if (senderProvider.email.isEmpty) {
      setState(() {
        error = 'Please enter email';
      });
      return false;
    }
    if (!EmailValidator.validate(senderProvider.email)) {
      setState(() {
        error = 'Please enter valid email';
      });
      return false;
    }
    if (senderProvider.phoneNumber.isEmpty) {
      setState(() {
        error = 'Please enter phoneNumber';
      });
      return false;
    }
    if (senderProvider.country.isEmpty) {
      setState(() {
        error = 'Please enter country';
      });
      return false;
    }
    if (senderProvider.city.isEmpty) {
      setState(() {
        error = 'Please enter city';
      });
      return false;
    }
    if (senderProvider.addressLineList[0].isEmpty) {
      setState(() {
        error = 'Please enter address Line';
      });
      return false;
    }
    if (senderProvider.postcode == null) {
      setState(() {
        error = 'Please enter postcode';
      });
      return false;
    }
    setState(() {
      error = null;
    });
    return true;
  }
}
