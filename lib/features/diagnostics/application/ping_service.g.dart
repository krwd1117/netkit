// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PingInput)
final pingInputProvider = PingInputProvider._();

final class PingInputProvider extends $NotifierProvider<PingInput, String> {
  PingInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pingInputProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pingInputHash();

  @$internal
  @override
  PingInput create() => PingInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$pingInputHash() => r'f5008818360eae929d0e7f61ddf1c9e1e1539f2c';

abstract class _$PingInput extends $Notifier<String> {
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

@ProviderFor(PingLookup)
final pingLookupProvider = PingLookupProvider._();

final class PingLookupProvider
    extends $NotifierProvider<PingLookup, AsyncValue<PingResult?>> {
  PingLookupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pingLookupProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pingLookupHash();

  @$internal
  @override
  PingLookup create() => PingLookup();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<PingResult?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<PingResult?>>(value),
    );
  }
}

String _$pingLookupHash() => r'c847071049ce1c5d74d2f5b116f05b74dd6dcbe9';

abstract class _$PingLookup extends $Notifier<AsyncValue<PingResult?>> {
  AsyncValue<PingResult?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PingResult?>, AsyncValue<PingResult?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PingResult?>, AsyncValue<PingResult?>>,
              AsyncValue<PingResult?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
