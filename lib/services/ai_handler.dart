import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final _openAI = OpenAI.instance.build(
    token: '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',
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
    ),
    enableLog: true,
  );

  Future<String> getResponse(String message) async {
    try {
      final request = ChatCompleteText(messages: [
        Map.of({"role": "user", "content": message})
      ], maxToken: 200, model: Gpt4ChatModel());

      final response = await _openAI.onChatCompletion(request: request);

      if (response != null) {
        //response.choices.message.content
        return response.choices[0].message?.content ?? 'Not Found';
      }
      return 'Something went wrong!';
    } catch (e) {
      print(e.toString());
      return 'Bad response';
    }
  }

  /* void dispose() {
    _openAI.close();
  } */
}
