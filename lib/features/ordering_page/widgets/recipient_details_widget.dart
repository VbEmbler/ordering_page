import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ordering_page/features/ordering_page/providers/recipient_provider.dart';
import 'package:ordering_page/features/ordering_page/widgets/recipient_details_add_address_widget.dart';
import 'package:ordering_page/features/ordering_page/widgets/recipient_details_select_address_widget.dart';
import 'package:ordering_page/features/ordering_page/widgets/toggle_navigation_button.dart';
import 'package:provider/provider.dart';

class RecipientDetailsWidget extends StatefulWidget {
  const RecipientDetailsWidget({Key? key}) : super(key: key);

  @override
  State<RecipientDetailsWidget> createState() => _RecipientDetailsWidgetState();
}

class _RecipientDetailsWidgetState extends State<RecipientDetailsWidget> {
  int selectedRecipientDetailsIndex = 0;
  bool isAddAddress = true;
  late final RecipientProvider recipientProvider;
  String? error;

  @override
  void initState() {
    recipientProvider = context.read<RecipientProvider>();
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
          'Recipient details',
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
          child: RecipientDetailsAddAddressWidget(),
        ),
        Visibility(
          visible: !isAddAddress,
          child: const RecipientDetailsSelectAddressWidget(),
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
            isSelected: selectedRecipientDetailsIndex == 0,
            onPressed: () {
              setState(() {
                selectedRecipientDetailsIndex = 0;
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
            isSelected: selectedRecipientDetailsIndex == 1,
            onPressed: () {
              if (_validate()) {
                setState(() {
                  isAddAddress = false;
                  selectedRecipientDetailsIndex = 1;
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
    if (recipientProvider.fullName.isEmpty) {
      setState(() {
        error = 'Please enter FullName';
      });
      return false;
    }
    if (recipientProvider.email.isEmpty) {
      setState(() {
        error = 'Please enter email';
      });
      return false;
    }
    if (!EmailValidator.validate(recipientProvider.email)) {
      setState(() {
        error = 'Please enter valid email';
      });
      return false;
    }
    if (recipientProvider.phoneNumber.isEmpty) {
      setState(() {
        error = 'Please enter phoneNumber';
      });
      return false;
    }
    if (recipientProvider.country.isEmpty) {
      setState(() {
        error = 'Please enter country';
      });
      return false;
    }
    if (recipientProvider.city.isEmpty) {
      setState(() {
        error = 'Please enter city';
      });
      return false;
    }
    if (recipientProvider.addressLineList[0].isEmpty) {
      setState(() {
        error = 'Please enter address Line';
      });
      return false;
    }
    if (recipientProvider.postcode == null) {
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
