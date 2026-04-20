// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'port_scanner_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PortScanInput)
final portScanInputProvider = PortScanInputProvider._();

final class PortScanInputProvider
    extends $NotifierProvider<PortScanInput, String> {
  PortScanInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'portScanInputProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$portScanInputHash();

  @$internal
  @override
  PortScanInput create() => PortScanInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$portScanInputHash() => r'ce9f77908669f64da39deb4040561bd83828b0b9';

abstract class _$PortScanInput extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(PortScan)
final portScanProvider = PortScanProvider._();

final class PortScanProvider
    extends $NotifierProvider<PortScan, AsyncValue<PortScanResult?>> {
  PortScanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'portScanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$portScanHash();

  @$internal
  @override
  PortScan create() => PortScan();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<PortScanResult?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<PortScanResult?>>(value),
    );
  }
}

String _$portScanHash() => r'b0315bd28553205e84091cc8af86aa52daae5aae';

abstract class _$PortScan extends $Notifier<AsyncValue<PortScanResult?>> {
  AsyncValue<PortScanResult?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<PortScanResult?>, AsyncValue<PortScanResult?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PortScanResult?>,
                AsyncValue<PortScanResult?>
              >,
              AsyncValue<PortScanResult?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
