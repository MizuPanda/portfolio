import 'package:flutter/material.dart';
import 'package:portofolio/left_widgets/left.dart';
import 'package:portofolio/provider.dart';
import 'package:portofolio/right_widgets/right.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {

   return MaterialApp(
      title: 'Juniel Djossou',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const PortfolioPage(),
    );
}
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if the device is an iPhone or the screen is narrow
    //final bool isNarrow = MediaQuery.of(context).size.width < 600;  // Adjust this threshold based on your design needs

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => AppProvider(),
        child: buildWideLayout(context),// isNarrow ? buildNarrowLayout(context) : buildWideLayout(context),
      ),
    );
  }

  Widget buildNarrowLayout(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LeftColumn(),  // Left part of the website
          RightColumn(), // Right part of the website
        ],
      ),
    );
  }

  Widget buildWideLayout(BuildContext context) {
    return Row(
      children: [
        const LeftColumn(),
        Container(
          width: 1,
          color: Colors.grey,
          height: double.infinity,
        ),
        const RightColumn()
      ],
    );
  }
}