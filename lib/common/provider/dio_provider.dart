import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Dio 인스턴스를 생성하는 Provider

final dioProvider = Provider<Dio>((_) => Dio());
