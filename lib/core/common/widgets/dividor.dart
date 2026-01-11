import 'package:flutter/material.dart';
class KDivider extends StatelessWidget {
  const KDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32,bottom: 32),
      child: Divider(height: 1,),
    );
  }
}
