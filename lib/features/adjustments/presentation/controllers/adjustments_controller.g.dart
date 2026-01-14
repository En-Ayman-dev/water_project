// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjustments_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pendingAdjustments)
final pendingAdjustmentsProvider = PendingAdjustmentsProvider._();

final class PendingAdjustmentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AdjustmentWithDetails>>,
          List<AdjustmentWithDetails>,
          Stream<List<AdjustmentWithDetails>>
        >
    with
        $FutureModifier<List<AdjustmentWithDetails>>,
        $StreamProvider<List<AdjustmentWithDetails>> {
  PendingAdjustmentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingAdjustmentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingAdjustmentsHash();

  @$internal
  @override
  $StreamProviderElement<List<AdjustmentWithDetails>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<AdjustmentWithDetails>> create(Ref ref) {
    return pendingAdjustments(ref);
  }
}

String _$pendingAdjustmentsHash() =>
    r'7a13166a9da05184f29f408b2ce39de4e1b1d3a4';
