// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dailyCollectionReport)
final dailyCollectionReportProvider = DailyCollectionReportFamily._();

final class DailyCollectionReportProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DailyCollectionModel>>,
          List<DailyCollectionModel>,
          FutureOr<List<DailyCollectionModel>>
        >
    with
        $FutureModifier<List<DailyCollectionModel>>,
        $FutureProvider<List<DailyCollectionModel>> {
  DailyCollectionReportProvider._({
    required DailyCollectionReportFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'dailyCollectionReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dailyCollectionReportHash();

  @override
  String toString() {
    return r'dailyCollectionReportProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<DailyCollectionModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DailyCollectionModel>> create(Ref ref) {
    final argument = this.argument as DateTime;
    return dailyCollectionReport(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DailyCollectionReportProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dailyCollectionReportHash() =>
    r'e3919e9a0e7692f8f62927e40e419e384b3de295';

final class DailyCollectionReportFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<DailyCollectionModel>>,
          DateTime
        > {
  DailyCollectionReportFamily._()
    : super(
        retry: null,
        name: r'dailyCollectionReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DailyCollectionReportProvider call(DateTime date) =>
      DailyCollectionReportProvider._(argument: date, from: this);

  @override
  String toString() => r'dailyCollectionReportProvider';
}

@ProviderFor(topDebtorsReport)
final topDebtorsReportProvider = TopDebtorsReportProvider._();

final class TopDebtorsReportProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DebtorModel>>,
          List<DebtorModel>,
          FutureOr<List<DebtorModel>>
        >
    with
        $FutureModifier<List<DebtorModel>>,
        $FutureProvider<List<DebtorModel>> {
  TopDebtorsReportProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topDebtorsReportProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topDebtorsReportHash();

  @$internal
  @override
  $FutureProviderElement<List<DebtorModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DebtorModel>> create(Ref ref) {
    return topDebtorsReport(ref);
  }
}

String _$topDebtorsReportHash() => r'c8b58a9d2ad658b0ed8105be8a4c131086b91f18';
