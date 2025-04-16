import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/laws/full_laws.dart';
import 'package:men_fuqoro_ai/features/main/models/law_model.dart';
import 'package:men_fuqoro_ai/features/main/providers/message_provider.dart';
import 'package:men_fuqoro_ai/features/main/services/law_service.dart';
import 'package:men_fuqoro_ai/features/main/widgets/messages.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_images.dart';
import 'package:men_fuqoro_ai/features/utils/app_texts.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<MessageProvider>(builder: (
      context,
      provider,
      child,
    ) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Image.asset(AppImages.main),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            Messages(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 40,
            top: 30,
          ),
          child: SizedBox(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: AppTexts.typeMessage,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.gray,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.gray),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    List<LawModel> result = [];
                    provider
                        .sendResponse(text: _controller.text, isResponse: true)
                        .then(
                      (_) {
                        result = provider.filterLaw(_controller.text);

                        if (result.isEmpty) {
                          final String lawName =
                              QonunService.topModda(_controller.text) ?? "";

                          final law = fullLaw.firstWhere(
                            (e) =>
                                e.lawName
                                    .toString()
                                    .toLowerCase()
                                    .replaceAll(' ', '') ==
                                lawName.replaceAll(' ', ''),
                            orElse: () => LawModel(
                              lawName: '',
                              fullLaw: '',
                              lawDescription: [],
                            ),
                          );
                          result.add(law);
                        }
                        _controller.clear();
                        // });
                        Future.delayed(Duration(seconds: 5));
                        provider.sendAnswer(
                          answer: result,
                          isResponse: false,
                        );
                      },
                    );
                    print('');
                  },
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
