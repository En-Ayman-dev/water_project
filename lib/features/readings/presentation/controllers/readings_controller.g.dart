// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReadingsController)
final readingsControllerProvider = ReadingsControllerFamily._();

final class ReadingsControllerProvider
    extends
        $AsyncNotifierProvider<ReadingsController, List<MeterReadingStatus>> {
  ReadingsControllerProvider._({
    required ReadingsControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'readingsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$readingsControllerHash();

  @override
  String toString() {
    return r'readingsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ReadingsController create() => ReadingsController();

  @override
  bool operator ==(Object other) {
    return other is ReadingsControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$readingsControllerHash() =>
    r'1f68fde90b6af241f98c18699ce5fc30c82e3e75';

final class ReadingsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ReadingsController,
          AsyncValue<List<MeterReadingStatus>>,
          List<MeterReadingStatus>,
          FutureOr<List<MeterReadingStatus>>,
          int
        > {
  ReadingsControllerFamily._()
    : super(
        retry: null,
        name: r'readingsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReadingsControllerProvider call(int cycleId) =>
      ReadingsControllerProvider._(argument: cycleId, from: this);

  @override
  String toString() => r'readingsControllerProvider';
}

abstract class _$ReadingsController
    extends $AsyncNotifier<List<MeterReadingStatus>> {
  late final _$args = ref.$arg as int;
  int get cycleId => _$args;

  FutureOr<List<MeterReadingStatus>> build(int cycleId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<MeterReadingStatus>>,
              List<MeterReadingStatus>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<MeterReadingStatus>>,
                List<MeterReadingStatus>
              >,
              AsyncValue<List<MeterReadingStatus>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
