// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjustment_request_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdjustmentRequestController)
final adjustmentRequestControllerProvider =
    AdjustmentRequestControllerProvider._();

final class AdjustmentRequestControllerProvider
    extends
        $NotifierProvider<AdjustmentRequestController, AdjustmentRequestState> {
  AdjustmentRequestControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adjustmentRequestControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adjustmentRequestControllerHash();

  @$internal
  @override
  AdjustmentRequestController create() => AdjustmentRequestController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdjustmentRequestState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdjustmentRequestState>(value),
    );
  }
}

String _$adjustmentRequestControllerHash() =>
    r'e075961c78a0768bd6a1abe306f993264188d0d1';

abstract class _$AdjustmentRequestController
    extends $Notifier<AdjustmentRequestState> {
  AdjustmentRequestState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AdjustmentRequestState, AdjustmentRequestState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AdjustmentRequestState, AdjustmentRequestState>,
              AdjustmentRequestState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(subscriberInvoices)
final subscriberInvoicesProvider = SubscriberInvoicesFamily._();

final class SubscriberInvoicesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<dynamic>>,
          List<dynamic>,
          FutureOr<List<dynamic>>
        >
    with $FutureModifier<List<dynamic>>, $FutureProvider<List<dynamic>> {
  SubscriberInvoicesProvider._({
    required SubscriberInvoicesFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'subscriberInvoicesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$subscriberInvoicesHash();

  @override
  String toString() {
    return r'subscriberInvoicesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<dynamic>> create(Ref ref) {
    final argument = this.argument as int;
    return subscriberInvoices(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SubscriberInvoicesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subscriberInvoicesHash() =>
    r'3abe965b0fb38f91deae1ee56dcb79d101c81936';

final class SubscriberInvoicesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<dynamic>>, int> {
  SubscriberInvoicesFamily._()
    : super(
        retry: null,
        name: r'subscriberInvoicesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SubscriberInvoicesProvider call(int subscriberId) =>
      SubscriberInvoicesProvider._(argument: subscriberId, from: this);

  @override
  String toString() => r'subscriberInvoicesProvider';
}
