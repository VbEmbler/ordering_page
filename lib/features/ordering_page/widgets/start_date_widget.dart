import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ordering_page/features/ordering_page/providers/ordering_page_provider.dart';
import 'package:provider/provider.dart';

class StartDateWidget extends StatelessWidget {
  const StartDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final OrderingPageProvider orderingPageProvider =
        context.read<OrderingPageProvider>();
    final TextEditingController startDateTextEditingController =
        TextEditingController();
    startDateTextEditingController.text =
        DateFormat('MMM dd, yyyy').format(orderingPageProvider.startDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start date',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: startDateTextEditingController,
          onTap: () async {
            DateTime date = DateTime(1900);
            FocusScope.of(context).requestFocus(FocusNode());

            date = (await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100)))!;
            orderingPageProvider.setStartDate(date);
            startDateTextEditingController.text = DateFormat('MMM dd, yyyy')
                .format(orderingPageProvider.startDate);
          },
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SvgPicture.asset(
                'assets/icons/calendar.svg',
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
        )
      ],
    );
  }
}
