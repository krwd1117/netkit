// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DnsInput)
final dnsInputProvider = DnsInputProvider._();

final class DnsInputProvider extends $NotifierProvider<DnsInput, String> {
  DnsInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dnsInputProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dnsInputHash();

  @$internal
  @override
  DnsInput create() => DnsInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$dnsInputHash() => r'74f2fa04ee11c9655a98c280b9bbb6fc4462babd';

abstract class _$DnsInput extends $Notifier<String> {
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

@ProviderFor(DnsLookup)
final dnsLookupProvider = DnsLookupProvider._();

final class DnsLookupProvider
    extends $NotifierProvider<DnsLookup, AsyncValue<DnsResult?>> {
  DnsLookupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dnsLookupProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dnsLookupHash();

  @$internal
  @override
  DnsLookup create() => DnsLookup();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<DnsResult?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<DnsResult?>>(value),
    );
  }
}

String _$dnsLookupHash() => r'f3010b6ee9e0d99a17e1fe0bcfdb8332a6a1b891';

abstract class _$DnsLookup extends $Notifier<AsyncValue<DnsResult?>> {
  AsyncValue<DnsResult?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<DnsResult?>, AsyncValue<DnsResult?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DnsResult?>, AsyncValue<DnsResult?>>,
              AsyncValue<DnsResult?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
