import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RecipeScreen extends StatefulWidget {
  final String postUrl;

  RecipeScreen({super.key, required this.postUrl});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  String? finalUrl;
  late InAppWebViewController inappViewController;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    finalUrl = widget.postUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 24,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff213A50), Color(0xff071930)],
                      begin: FractionalOffset.topRight,
                      end: FractionalOffset.bottomLeft)),
              child: const Row(
                mainAxisAlignment:
                    kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.center,
                children: [
                  Text(
                    'FoodRecipe ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  Text(
                    'App',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 30,
              width: MediaQuery.of(context).size.width,
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(finalUrl.toString())),
                onWebViewCreated: (InAppWebViewController controller) {
                  inappViewController = controller;
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
