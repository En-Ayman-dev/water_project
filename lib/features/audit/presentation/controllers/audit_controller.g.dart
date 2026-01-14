// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recentAuditLogs)
final recentAuditLogsProvider = RecentAuditLogsProvider._();

final class RecentAuditLogsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AuditLogItem>>,
          List<AuditLogItem>,
          FutureOr<List<AuditLogItem>>
        >
    with
        $FutureModifier<List<AuditLogItem>>,
        $FutureProvider<List<AuditLogItem>> {
  RecentAuditLogsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentAuditLogsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentAuditLogsHash();

  @$internal
  @override
  $FutureProviderElement<List<AuditLogItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AuditLogItem>> create(Ref ref) {
    return recentAuditLogs(ref);
  }
}

String _$recentAuditLogsHash() => r'341a07b71c3055c6577f48e2c04c6c8a1d3ec4db';
