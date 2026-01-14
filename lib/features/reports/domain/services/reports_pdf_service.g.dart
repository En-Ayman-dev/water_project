// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_pdf_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reportsPdfService)
final reportsPdfServiceProvider = ReportsPdfServiceProvider._();

final class ReportsPdfServiceProvider
    extends
        $FunctionalProvider<
          ReportsPdfService,
          ReportsPdfService,
          ReportsPdfService
        >
    with $Provider<ReportsPdfService> {
  ReportsPdfServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportsPdfServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportsPdfServiceHash();

  @$internal
  @override
  $ProviderElement<ReportsPdfService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReportsPdfService create(Ref ref) {
    return reportsPdfService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportsPdfService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportsPdfService>(value),
    );
  }
}

String _$reportsPdfServiceHash() => r'bb9c65347044c61d0d4c9ab1209dff5a3d5e7e2c';
