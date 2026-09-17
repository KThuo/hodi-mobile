import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dashboard/providers/dashboard_provider.dart';
import '../../invoices/providers/invoice_providers.dart';
import '../../occupations/providers/occupation_providers.dart';
import 'payment_providers.dart';

/// Everything that stops being true the moment money is received.
///
/// ## Why one function rather than an invalidation at each call site
///
/// A payment is not local to the screen that took it. It changes the invoice's balance, moves that
/// invoice between the Unpaid and Paid tabs, adds a row to the payments list, and changes what the
/// tenancy owes on a screen two taps away. A sheet that invalidated only what it could see left
/// four stale reads behind, and the next person to add a way of receiving money would have to
/// rediscover the same list.
///
/// So the knowledge of what a payment touches lives here, once, and the call sites say only that
/// a payment happened.
///
/// ## Refreshed, not merely invalidated
///
/// The list notifiers are `keepAlive` and hold their own paged state, so invalidating them is not
/// enough — `refresh()` is what refetches page zero and rebuilds what is on screen. The autoDispose
/// futures are invalidated, which is the equivalent for them.
///
/// [invoiceRrn] is the invoice settled, where there was one — money can arrive against a tenancy
/// with no invoice named. [occupationId] is the tenancy, for the "My houses" drill-down.
void refreshAfterPayment(
  WidgetRef ref, {
  String? invoiceRrn,
  String? occupationId,
}) {
  // ── The invoice that was paid ──────────────────────────────────────────
  if (invoiceRrn != null && invoiceRrn.isNotEmpty) {
    // The document carries the payments and the balance, so this is the one that makes the new
    // receipt appear on the page somebody is looking at.
    ref.invalidate(invoiceDocumentProvider(invoiceRrn));
    // The scoped read carries totalPayable, which decides whether Make Payment stays offered.
    ref.invalidate(invoiceActionsProvider(invoiceRrn));
  }

  // ── The invoice lists ──────────────────────────────────────────────────
  //
  // Every tab, not just the one in front. A settled invoice leaves Unpaid and joins Paid, so
  // refreshing only the visible tab leaves it listed in both until the app is restarted.
  //
  // `exists` first, because these are keepAlive: reading `.notifier` on a tab nobody has opened
  // *creates* it, and its build already fetches page zero — so an unguarded refresh would fetch
  // twice for a list nobody is looking at. A tab opened later builds with fresh data anyway.
  for (final t in invoiceTabs) {
    final tab = invoiceListProvider(t.status);
    if (ref.exists(tab)) ref.read(tab.notifier).refresh();
  }

  // ── The payments list ──────────────────────────────────────────────────
  //
  // `refresh()` rather than `invalidate`, here and above: these notifiers hold a search term and
  // a page count, and invalidating rebuilds them from nothing — which would silently clear a
  // filter somebody had set on a screen behind this one.
  if (ref.exists(paymentListProvider)) {
    ref.read(paymentListProvider.notifier).refresh();
  }

  // ── The tenancy, for My houses ─────────────────────────────────────────
  if (occupationId != null && occupationId.isNotEmpty) {
    ref.invalidate(tenancyBalanceProvider(occupationId));
    ref.invalidate(tenancyInvoicesProvider(occupationId));
    ref.invalidate(tenancyPaymentsProvider(occupationId));
  }

  // ── The dashboard ──────────────────────────────────────────────────────
  //
  // Its providers are autoDispose, which would normally mean they refetch on the way back — but
  // the shell is a StatefulShellRoute.indexedStack, so every branch stays mounted and keeps its
  // subscriptions alive. Home is never rebuilt from scratch, so collections and arrears would go
  // on showing the figures from before this payment until the app was restarted.
  ref.invalidate(overallSummaryProvider);
  ref.invalidate(monthlySummaryProvider);
  ref.invalidate(collectionsProvider);
}
