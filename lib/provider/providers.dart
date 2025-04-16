
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/services/api_provider.dart';

final dioProvider = Provider(
    (_) => Dio(BaseOptions(connectTimeout: const Duration(seconds: 30))));
final apiProvider = Provider((ref) => ApiProvider(ref.watch(dioProvider)));
final hasConnectionProvider = StateProvider((ref) => false);
