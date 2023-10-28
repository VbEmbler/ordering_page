import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ordering_page/features/ordering_page/providers/recipient_provider.dart';
import 'package:provider/provider.dart';

class RecipientDetailsSelectAddressWidget extends StatelessWidget {
  const RecipientDetailsSelectAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final RecipientProvider recipientProvider =
        context.read<RecipientProvider>();

    return Column(
      children: [
        const SizedBox(height: 5),
        TextFormField(
          onTap: () async {},
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
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
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF172027),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      recipientProvider.fullName,
                      style: textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/edit.svg',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                Text(
                  '${recipientProvider.country}, ${recipientProvider.city}, ${recipientProvider.addressLineList[0]}, ${recipientProvider.postcode}',
                  style: textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
