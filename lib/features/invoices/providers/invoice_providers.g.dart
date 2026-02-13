// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InvoiceList)
final invoiceListProvider = InvoiceListFamily._();

final class InvoiceListProvider
    extends $NotifierProvider<InvoiceList, InvoiceListState> {
  InvoiceListProvider._({
    required InvoiceListFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'invoiceListProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$invoiceListHash();

  @override
  String toString() {
    return r'invoiceListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  InvoiceList create() => InvoiceList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InvoiceListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InvoiceListState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is InvoiceListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$invoiceListHash() => r'378cafdd8e799478ea1b1fae6d04ebe138e11715';

final class InvoiceListFamily extends $Family
    with
        $ClassFamilyOverride<
          InvoiceList,
          InvoiceListState,
          InvoiceListState,
          InvoiceListState,
          String
        > {
  InvoiceListFamily._()
    : super(
        retry: null,
        name: r'invoiceListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  InvoiceListProvider call(String status) =>
      InvoiceListProvider._(argument: status, from: this);

  @override
  String toString() => r'invoiceListProvider';
}

abstract class _$InvoiceList extends $Notifier<InvoiceListState> {
  late final _$args = ref.$arg as String;
  String get status => _$args;

  InvoiceListState build(String status);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<InvoiceListState, InvoiceListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<InvoiceListState, InvoiceListState>,
              InvoiceListState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
