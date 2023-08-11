// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// final changeCategoryStateProvider =
// ChangeNotifierProvider((ref) => SkinCategoryState());
//
// class ModalGridState
//     extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
//
//   ModalGridState()
//       : super(const AsyncValue.loading()) {
//     loadData();
//   }
//   final data = [];
//   final
//
//   Future<void> loadData() async {
//     try {
//       state = AsyncValue.data(data);
//     } catch (e, s) {
//       state = AsyncValue.error(e, s);
//     }
//   }
//
//   Future<void> reloadData() async {
//     state = const AsyncValue.loading();
//     await loadData();
//   }
