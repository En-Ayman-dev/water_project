// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_pdf_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(invoicePdfService)
final invoicePdfServiceProvider = InvoicePdfServiceProvider._();

final class InvoicePdfServiceProvider
    extends
        $FunctionalProvider<
          InvoicePdfService,
          InvoicePdfService,
          InvoicePdfService
        >
    with $Provider<InvoicePdfService> {
  InvoicePdfServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'invoicePdfServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invoicePdfServiceHash();

  @$internal
  @override
  $ProviderElement<InvoicePdfService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InvoicePdfService create(Ref ref) {
    return invoicePdfService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InvoicePdfService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InvoicePdfService>(value),
    );
  }
}

String _$invoicePdfServiceHash() => r'15c5d42fad4fb8bef6ff9c8bb1042f3bdafd95da';
