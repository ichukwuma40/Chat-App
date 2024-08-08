import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _selectedChat = prefs.getString('ff_selectedChat')?.ref ?? _selectedChat;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _selectedChat;
  DocumentReference? get selectedChat => _selectedChat;
  set selectedChat(DocumentReference? value) {
    _selectedChat = value;
    value != null
        ? prefs.setString('ff_selectedChat', value.path)
        : prefs.remove('ff_selectedChat');
  }

  final _allUsersManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> allUsers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _allUsersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllUsersCache() => _allUsersManager.clear();
  void clearAllUsersCacheKey(String? uniqueKey) =>
      _allUsersManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
