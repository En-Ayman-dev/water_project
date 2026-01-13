import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/reports_dao.dart';

part 'reports_controller.g.dart';

// 1. مزود تقرير التحصيل اليومي
@riverpod
Future<List<DailyCollectionModel>> dailyCollectionReport( ref, DateTime date) async {
  final db = ref.watch(appDatabaseProvider);
  // الوصول للـ DAO يتم عبر getter تم توليده تلقائياً في AppDatabase
  return db.reportsDao.getDailyCollectionSummary(date);
}

// 2. مزود تقرير المدينين (Top 20)
@riverpod
Future<List<DebtorModel>> topDebtorsReport( ref) async {
  final db = ref.watch(appDatabaseProvider);
  return db.reportsDao.getTopDebtors(limit: 20);
}