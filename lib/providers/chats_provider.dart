import 'package:flutter_jarvis/models/chat_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends StateNotifier<List<ChatModel>> {
  ChatNotifier() : super([]);

  void add(ChatModel chatModel) {
    state = [...state, chatModel];
  }
}

final chatsProvider = StateNotifierProvider<ChatNotifier, List<ChatModel>>(
    (ref) => ChatNotifier());
