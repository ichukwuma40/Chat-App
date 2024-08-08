import '/backend/backend.dart';
import '/components/empty_list_view/empty_list_view_widget.dart';
import '/components/messages/messages_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'chat_main_widget.dart' show ChatMainWidget;
import 'package:flutter/material.dart';

class ChatMainModel extends FlutterFlowModel<ChatMainWidget> {
  ///  Local state fields for this page.

  ChatsListRecord? chatRef;

  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Model for messages component.
  late MessagesModel messagesModel;
  // Model for emptyListView component.
  late EmptyListViewModel emptyListViewModel;

  /// Query cache managers for this widget.

  final _userChatManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userChat({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userChatManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserChatCache() => _userChatManager.clear();
  void clearUserChatCacheKey(String? uniqueKey) =>
      _userChatManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    messagesModel = createModel(context, () => MessagesModel());
    emptyListViewModel = createModel(context, () => EmptyListViewModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    messagesModel.dispose();
    emptyListViewModel.dispose();

    /// Dispose query cache managers for this widget.

    clearUserChatCache();
  }
}
