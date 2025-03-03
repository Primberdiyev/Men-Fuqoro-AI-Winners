import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/dialogs/low_dialog.dart';
import 'package:men_fuqoro_ai/features/main/providers/message_provider.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:provider/provider.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final messageProvider =
        Provider.of<MessageProvider>(context, listen: false);

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: messageProvider.getAllMessages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(""),
          );
        }

        final messages = snapshot.data!.docs;

        return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[messages.length - index - 1].data();

            final bool isResponse = message['isResponse'] ?? false;

            final bool hasAnswer =
                message.containsKey('answer') && message['answer'] != null;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Align(
                alignment:
                    isResponse ? Alignment.centerRight : Alignment.centerLeft,
                child: InkWell(
                  onTap: (!isResponse &&
                          hasAnswer &&
                          (message['answer'] as List).isNotEmpty)
                      ? () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return LowDialog(
                                    title: message['answer'][0]['lawName'],
                                    content: message['answer'][0]['fullLaw']);
                              });
                        }
                      : null,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: !isResponse
                          ? Colors.grey.shade200
                          : AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isResponse
                          ? message['response']
                          : (hasAnswer &&
                                  (message['answer'] as List).isNotEmpty)
                              ? message['answer'][0]['lawName']
                              : "Iltimos so'rovingizni batafsil kiriting",
                      style: TextStyle(
                          fontSize: 18,
                          color:
                              isResponse ? AppColors.white : AppColors.black),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
