// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subnet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IpInput)
final ipInputProvider = IpInputProvider._();

final class IpInputProvider extends $NotifierProvider<IpInput, String> {
  IpInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ipInputProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ipInputHash();

  @$internal
  @override
  IpInput create() => IpInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$ipInputHash() => r'774c5f95d9549b0409c75b1f4b2c217277b8ae89';

abstract class _$IpInput extends $Notifier<String> {
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

@ProviderFor(PrefixInput)
final prefixInputProvider = PrefixInputProvider._();

final class PrefixInputProvider extends $NotifierProvider<PrefixInput, int> {
  PrefixInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prefixInputProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prefixInputHash();

  @$internal
  @override
  PrefixInput create() => PrefixInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$prefixInputHash() => r'229406827d9e9d99a85128084c71eaca83141517';

abstract class _$PrefixInput extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(subnetResult)
final subnetResultProvider = SubnetResultProvider._();

final class SubnetResultProvider
    extends $FunctionalProvider<SubnetResult?, SubnetResult?, SubnetResult?>
    with $Provider<SubnetResult?> {
  SubnetResultProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subnetResultProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subnetResultHash();

  @$internal
  @override
  $ProviderElement<SubnetResult?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SubnetResult? create(Ref ref) {
    return subnetResult(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubnetResult? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubnetResult?>(value),
    );
  }
}

String _$subnetResultHash() => r'61ef0bf64178882a4c9e3cd3f64fb3d16f9c0bc6';
