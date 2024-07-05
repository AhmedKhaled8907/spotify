import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/custom_loading_indicator.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomLoadingIndicator(),
    );
  }
}
