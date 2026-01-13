// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_calculator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pricingCalculator)
final pricingCalculatorProvider = PricingCalculatorProvider._();

final class PricingCalculatorProvider
    extends
        $FunctionalProvider<
          PricingCalculator,
          PricingCalculator,
          PricingCalculator
        >
    with $Provider<PricingCalculator> {
  PricingCalculatorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pricingCalculatorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pricingCalculatorHash();

  @$internal
  @override
  $ProviderElement<PricingCalculator> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PricingCalculator create(Ref ref) {
    return pricingCalculator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PricingCalculator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PricingCalculator>(value),
    );
  }
}

String _$pricingCalculatorHash() => r'ef2f356027077d77b9f34f0cbe5628c2858992ca';
