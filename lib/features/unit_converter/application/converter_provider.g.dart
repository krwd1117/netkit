// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedCategory)
final selectedCategoryProvider = SelectedCategoryProvider._();

final class SelectedCategoryProvider
    extends $NotifierProvider<SelectedCategory, UnitCategory> {
  SelectedCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryHash();

  @$internal
  @override
  SelectedCategory create() => SelectedCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UnitCategory value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UnitCategory>(value),
    );
  }
}

String _$selectedCategoryHash() => r'aa9db63427c15edd83892ac37a2decba44f02808';

abstract class _$SelectedCategory extends $Notifier<UnitCategory> {
  UnitCategory build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UnitCategory, UnitCategory>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UnitCategory, UnitCategory>,
              UnitCategory,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ConverterInput)
final converterInputProvider = ConverterInputProvider._();

final class ConverterInputProvider
    extends $NotifierProvider<ConverterInput, String> {
  ConverterInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'converterInputProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$converterInputHash();

  @$internal
  @override
  ConverterInput create() => ConverterInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$converterInputHash() => r'31cc1c6549d03d71e98eabb069ce92ebc1a44f29';

abstract class _$ConverterInput extends $Notifier<String> {
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

@ProviderFor(FromUnit)
final fromUnitProvider = FromUnitProvider._();

final class FromUnitProvider
    extends $NotifierProvider<FromUnit, UnitDefinition> {
  FromUnitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fromUnitProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fromUnitHash();

  @$internal
  @override
  FromUnit create() => FromUnit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UnitDefinition value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UnitDefinition>(value),
    );
  }
}

String _$fromUnitHash() => r'feb82bad13fac92b61efe2116ad2944b4740ca12';

abstract class _$FromUnit extends $Notifier<UnitDefinition> {
  UnitDefinition build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UnitDefinition, UnitDefinition>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UnitDefinition, UnitDefinition>,
              UnitDefinition,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ToUnit)
final toUnitProvider = ToUnitProvider._();

final class ToUnitProvider extends $NotifierProvider<ToUnit, UnitDefinition> {
  ToUnitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toUnitProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toUnitHash();

  @$internal
  @override
  ToUnit create() => ToUnit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UnitDefinition value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UnitDefinition>(value),
    );
  }
}

String _$toUnitHash() => r'c0c6d2aa7285642c4d24a02dd2fb87bee40d59e9';

abstract class _$ToUnit extends $Notifier<UnitDefinition> {
  UnitDefinition build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UnitDefinition, UnitDefinition>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UnitDefinition, UnitDefinition>,
              UnitDefinition,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(conversionResult)
final conversionResultProvider = ConversionResultProvider._();

final class ConversionResultProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  ConversionResultProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'conversionResultProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$conversionResultHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return conversionResult(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$conversionResultHash() => r'48e635b90793b6ec57beb1aa2410ec64b89782c4';
