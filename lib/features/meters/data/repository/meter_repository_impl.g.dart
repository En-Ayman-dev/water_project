// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(meterRepository)
final meterRepositoryProvider = MeterRepositoryProvider._();

final class MeterRepositoryProvider
    extends
        $FunctionalProvider<MeterRepository, MeterRepository, MeterRepository>
    with $Provider<MeterRepository> {
  MeterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'meterRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$meterRepositoryHash();

  @$internal
  @override
  $ProviderElement<MeterRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MeterRepository create(Ref ref) {
    return meterRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MeterRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MeterRepository>(value),
    );
  }
}

String _$meterRepositoryHash() => r'ee35a3c8f467710b33143611182c24aad950308d';
