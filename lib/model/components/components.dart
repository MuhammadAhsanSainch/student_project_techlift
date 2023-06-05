import 'package:combined_app/model/components/app_colors.dart';
// import 'package:combined_app/view/signin.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  late final TextEditingController? _controller;
  late final String? _label;
  late final String? _hintText;
  late final TextInputType? _textInputType;
  late final FormFieldValidator? _validator;

  MyTextFormField(
      {Key? key,
      required TextEditingController? controller,
      required String? label,
      required String? hintText,
      required TextInputType? textInputType,
      required FormFieldValidator? validator})
      : super(key: key) {
    _controller = controller;
    _label = label;
    _hintText = hintText;
    _textInputType = textInputType;
    _validator = validator;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _controller!,
        keyboardType: _textInputType!,
        validator: _validator!,
        decoration: InputDecoration(
            label: Text(_label!),
            hintText: _hintText!,
            hintStyle: const TextStyle(color: Colors.grey),
            border: const OutlineInputBorder()));
  }
}

class MyPasswordFormField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  const MyPasswordFormField({
    Key? key,
    required this.label,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  State<MyPasswordFormField> createState() => _MyPasswordFormFieldState();
}

class _MyPasswordFormFieldState extends State<MyPasswordFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller!,
      decoration: InputDecoration(
        label: Text(widget.label!),
        hintText: widget.hintText!,
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
    );
  }
}

class MyButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPress;
  const MyButton({Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
      child: Center(
        child: Text(
          title!,
          style: const TextStyle(
              color: AppColors.buttonTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String? imgUrl;
  final String? title;
  const MyCard({super.key, required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      width: 150,
      height: 150,
      child: Center(
        child: Card(
          child: Column(
            children: [
              Image.asset(
                '$imgUrl',
                width: 100,
                height: 100,
              ),
              Center(child: Text('$title'))
            ],
          ),
        ),
      ),
    );
  }
}

// class MyGrid extends StatelessWidget {
//   final List<String>? titles;
//   final List<String>? imgUrls;
//   const MyGrid({super.key, required this.titles, required this.imgUrls});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate:
//           const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//       itemBuilder: (context, index) {
//         return MyCard(imgUrl: imgUrls?[index], title: titles?[index]);
//       },
//     );
//   }
// }

// Widget customGrid(String imgUrl, String title) {
//   return GridView(
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
//     children: [
//       MyCard(imgUrl: imgUrl, title: title),
//       MyCard(imgUrl: imgUrl, title: title),
//     ],
//   );
// }
