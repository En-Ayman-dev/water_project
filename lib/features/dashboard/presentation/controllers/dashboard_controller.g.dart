// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardStats)
final dashboardStatsProvider = DashboardStatsProvider._();

final class DashboardStatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<DashboardStats>,
          DashboardStats,
          FutureOr<DashboardStats>
        >
    with $FutureModifier<DashboardStats>, $FutureProvider<DashboardStats> {
  DashboardStatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardStatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardStatsHash();

  @$internal
  @override
  $FutureProviderElement<DashboardStats> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DashboardStats> create(Ref ref) {
    return dashboardStats(ref);
  }
}

String _$dashboardStatsHash() => r'2102aa13c04f2cbcc736b224e36d796c29863ca3';
