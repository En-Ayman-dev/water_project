// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(receiptService)
final receiptServiceProvider = ReceiptServiceProvider._();

final class ReceiptServiceProvider
    extends $FunctionalProvider<ReceiptService, ReceiptService, ReceiptService>
    with $Provider<ReceiptService> {
  ReceiptServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'receiptServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$receiptServiceHash();

  @$internal
  @override
  $ProviderElement<ReceiptService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReceiptService create(Ref ref) {
    return receiptService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReceiptService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReceiptService>(value),
    );
  }
}

String _$receiptServiceHash() => r'3e230802b618619b1eb8a507c69d0d948b582763';
