// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excel_import_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(excelImportService)
final excelImportServiceProvider = ExcelImportServiceProvider._();

final class ExcelImportServiceProvider
    extends
        $FunctionalProvider<
          ExcelImportService,
          ExcelImportService,
          ExcelImportService
        >
    with $Provider<ExcelImportService> {
  ExcelImportServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'excelImportServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$excelImportServiceHash();

  @$internal
  @override
  $ProviderElement<ExcelImportService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ExcelImportService create(Ref ref) {
    return excelImportService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExcelImportService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExcelImportService>(value),
    );
  }
}

String _$excelImportServiceHash() =>
    r'b944a26a89a09351fc51e8b7287609ab8cc6c168';
