import 'package:flutter_api/models/api_model.dart';
import 'package:flutter_api/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<ApiService>((ref) => ApiService());
final userDataProvider =  FutureProvider<List<User>>((ref) => ref.read(apiProvider).getUser());