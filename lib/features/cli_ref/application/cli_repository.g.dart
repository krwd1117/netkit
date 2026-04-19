// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cli_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'1a6250efdc19e86c923ceb598a77ff74d64378e6';

@ProviderFor(cliCommands)
final cliCommandsProvider = CliCommandsProvider._();

final class CliCommandsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CliCommand>>,
          List<CliCommand>,
          FutureOr<List<CliCommand>>
        >
    with $FutureModifier<List<CliCommand>>, $FutureProvider<List<CliCommand>> {
  CliCommandsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cliCommandsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cliCommandsHash();

  @$internal
  @override
  $FutureProviderElement<List<CliCommand>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CliCommand>> create(Ref ref) {
    return cliCommands(ref);
  }
}

String _$cliCommandsHash() => r'9832f4955ee1f0d4136755323632c884fb4a09bf';

@ProviderFor(FavoriteIds)
final favoriteIdsProvider = FavoriteIdsProvider._();

final class FavoriteIdsProvider
    extends $NotifierProvider<FavoriteIds, Set<int>> {
  FavoriteIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteIdsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteIdsHash();

  @$internal
  @override
  FavoriteIds create() => FavoriteIds();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$favoriteIdsHash() => r'f6480954a25da502d89c27d2914a01f6c110d64b';

abstract class _$FavoriteIds extends $Notifier<Set<int>> {
  Set<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<int>, Set<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<int>, Set<int>>,
              Set<int>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(vendors)
final vendorsProvider = VendorsProvider._();

final class VendorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  VendorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vendorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vendorsHash();

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    return vendors(ref);
  }
}

String _$vendorsHash() => r'6caf574c95df989d37908065ec47f4ce72f6cc4d';

@ProviderFor(categories)
final categoriesProvider = CategoriesFamily._();

final class CategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  CategoriesProvider._({
    required CategoriesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'categoriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoriesHash();

  @override
  String toString() {
    return r'categoriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    final argument = this.argument as String;
    return categories(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoriesHash() => r'04c0534a7817334836b2b39ab4f12333fb107578';

final class CategoriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<String>>, String> {
  CategoriesFamily._()
    : super(
        retry: null,
        name: r'categoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CategoriesProvider call(String vendor) =>
      CategoriesProvider._(argument: vendor, from: this);

  @override
  String toString() => r'categoriesProvider';
}

@ProviderFor(filteredCommands)
final filteredCommandsProvider = FilteredCommandsFamily._();

final class FilteredCommandsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CliCommand>>,
          List<CliCommand>,
          FutureOr<List<CliCommand>>
        >
    with $FutureModifier<List<CliCommand>>, $FutureProvider<List<CliCommand>> {
  FilteredCommandsProvider._({
    required FilteredCommandsFamily super.from,
    required ({String vendor, String category, String query}) super.argument,
  }) : super(
         retry: null,
         name: r'filteredCommandsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredCommandsHash();

  @override
  String toString() {
    return r'filteredCommandsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<CliCommand>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CliCommand>> create(Ref ref) {
    final argument =
        this.argument as ({String vendor, String category, String query});
    return filteredCommands(
      ref,
      vendor: argument.vendor,
      category: argument.category,
      query: argument.query,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredCommandsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredCommandsHash() => r'252c83864e83af6e7e17423a9f52e8235c2e875c';

final class FilteredCommandsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CliCommand>>,
          ({String vendor, String category, String query})
        > {
  FilteredCommandsFamily._()
    : super(
        retry: null,
        name: r'filteredCommandsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredCommandsProvider call({
    required String vendor,
    required String category,
    String query = '',
  }) => FilteredCommandsProvider._(
    argument: (vendor: vendor, category: category, query: query),
    from: this,
  );

  @override
  String toString() => r'filteredCommandsProvider';
}
