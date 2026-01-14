// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(auditService)
final auditServiceProvider = AuditServiceProvider._();

final class AuditServiceProvider
    extends $FunctionalProvider<AuditService, AuditService, AuditService>
    with $Provider<AuditService> {
  AuditServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'auditServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$auditServiceHash();

  @$internal
  @override
  $ProviderElement<AuditService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuditService create(Ref ref) {
    return auditService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuditService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuditService>(value),
    );
  }
}

String _$auditServiceHash() => r'd11894b01abe49cb09bc5163349bcde7bddaffba';
