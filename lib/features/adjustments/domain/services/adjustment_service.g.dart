// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjustment_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(adjustmentService)
final adjustmentServiceProvider = AdjustmentServiceProvider._();

final class AdjustmentServiceProvider
    extends
        $FunctionalProvider<
          AdjustmentService,
          AdjustmentService,
          AdjustmentService
        >
    with $Provider<AdjustmentService> {
  AdjustmentServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adjustmentServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adjustmentServiceHash();

  @$internal
  @override
  $ProviderElement<AdjustmentService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AdjustmentService create(Ref ref) {
    return adjustmentService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdjustmentService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdjustmentService>(value),
    );
  }
}

String _$adjustmentServiceHash() => r'ee9cf8bcc881ac18ccc7f756447f3b5d5512c9b0';
