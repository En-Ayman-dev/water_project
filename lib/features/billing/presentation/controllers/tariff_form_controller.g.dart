// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TariffFormController)
final tariffFormControllerProvider = TariffFormControllerProvider._();

final class TariffFormControllerProvider
    extends $NotifierProvider<TariffFormController, TariffFormState> {
  TariffFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tariffFormControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tariffFormControllerHash();

  @$internal
  @override
  TariffFormController create() => TariffFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TariffFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TariffFormState>(value),
    );
  }
}

String _$tariffFormControllerHash() =>
    r'e53f1b0c002d61bbb2754c670c365aafdda937b1';

abstract class _$TariffFormController extends $Notifier<TariffFormState> {
  TariffFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TariffFormState, TariffFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TariffFormState, TariffFormState>,
              TariffFormState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
