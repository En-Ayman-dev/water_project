// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tariffRepository)
final tariffRepositoryProvider = TariffRepositoryProvider._();

final class TariffRepositoryProvider
    extends
        $FunctionalProvider<
          TariffRepository,
          TariffRepository,
          TariffRepository
        >
    with $Provider<TariffRepository> {
  TariffRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tariffRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tariffRepositoryHash();

  @$internal
  @override
  $ProviderElement<TariffRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TariffRepository create(Ref ref) {
    return tariffRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TariffRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TariffRepository>(value),
    );
  }
}

String _$tariffRepositoryHash() => r'23135cc035cc2190a6f7645aad690f1e26d449c4';
