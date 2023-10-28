import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ordering_page/features/ordering_page/widgets/recipient_details_widget.dart';
import 'package:ordering_page/features/ordering_page/widgets/sender_details_widget.dart';
import 'package:ordering_page/features/ordering_page/widgets/start_date_widget.dart';

class OrderingPage extends StatefulWidget {
  const OrderingPage({super.key, required this.title});
  final String title;
  @override
  State<OrderingPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderingPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: themeData.scaffoldBackgroundColor,
          title: Text(widget.title, style: textTheme.headlineLarge),
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: const Color(0xFFE7ECF0),
              height: 0.5,
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'Step 1',
                    style: textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 20),
                const StartDateWidget(),
                const SizedBox(height: 40),
                const SenderDetailsWidget(),
                const SizedBox(height: 50),
                const RecipientDetailsWidget(),
                const SizedBox(height: 30),
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          style: BorderStyle.none,
                        ),
                        backgroundColor: const Color(0xFFEA560D)),
                    onPressed: () {},
                    child: Text(
                      'Next step',
                      softWrap: false,
                      overflow: TextOverflow.clip,
                      style: textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
