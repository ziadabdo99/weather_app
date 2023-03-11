import 'package:flutter/cupertino.dart';

class FailureBody extends StatelessWidget {
  const FailureBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Somthing went wrong"),
    );
  }
}
