import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_gradient_button.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_text_field.dart';
import '../domain/maintenance_models.dart';
import '../providers/maintenance_providers.dart';
import 'widgets/maintenance_chips.dart';

/// One repair, and everything said about it since it was raised.
///
/// The actions are the intersection of what the server allows and what this person holds:
///
/// - **Comment** — `ROLE_MAINT_NEW`, which both audiences have.
/// - **Resolve** — `ROLE_MAINT_RESOLVE`, the caretaker's.
/// - **Rate** — `ROLE_MAINT_NEW`, and only once the job is done and unrated.
///
/// Assigning and costing are not here. They need authorities neither audience holds, and the
/// decisions behind them are made where the rota and the budget are.
class MaintenanceDetailScreen extends ConsumerStatefulWidget {
  const MaintenanceDetailScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<MaintenanceDetailScreen> createState() =>
      _MaintenanceDetailScreenState();
}

class _MaintenanceDetailScreenState
    extends ConsumerState<MaintenanceDetailScreen> {
  final _commentController = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _reload() => ref.invalidate(maintenanceDetailProvider(widget.id));

  Future<void> _run(Future<bool> Function() action) async {
    setState(() => _busy = true);
    final ok = await action();
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok) {
      _reload();
      // The list behind this screen shows status and rating, both of which just moved.
      ref.read(maintenanceListProvider.notifier).refresh();
    }
  }

  Future<bool> _report(Future<dynamic> Function() call) async {
    final response = await call();
    if (!mounted) return false;
    final message = response.message as String;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message.isNotEmpty
          ? message
          : response.isSuccess == true
              ? 'Done.'
              : 'That did not work.'),
      backgroundColor: response.isSuccess == true
          ? HodiColors.successStart
          : HodiColors.errorStart,
    ));
    return response.isSuccess as bool;
  }

  Future<void> _comment() async {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;
    await _run(() async {
      final ok = await _report(() => ref
          .read(maintenanceRepositoryProvider)
          .comment(id: widget.id, comment: text));
      if (ok) _commentController.clear();
      return ok;
    });
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(maintenanceDetailProvider(widget.id));
    final user = ref.watch(authProvider).user;
    final canComment = user?.hasPermission(AppPermissions.maintNew) ?? false;
    final canResolve = user?.hasPermission(AppPermissions.maintResolve) ?? false;

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Repair'),
      body: async.when(
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 120),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'That request could not be loaded.',
          onRetry: _reload,
        ),
        data: (detail) {
          if (detail == null) {
            return const HodiErrorState(message: 'That request was not found.');
          }
          final r = detail.request;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _HeaderCard(request: r),
              const SizedBox(height: 16),

              if (r.awaitingRating && canComment) ...[
                _RateCard(
                  busy: _busy,
                  onRate: (stars, feedback) => _run(() => _report(() => ref
                      .read(maintenanceRepositoryProvider)
                      .rate(id: widget.id, stars: stars, feedback: feedback))),
                ),
                const SizedBox(height: 16),
              ],

              if (r.tenantRating != null) ...[
                _RatingGiven(
                  stars: r.tenantRating!,
                  feedback: r.tenantFeedback,
                ),
                const SizedBox(height: 16),
              ],

              if (r.actionsTaken != null) ...[
                _Card(
                  title: 'What was done',
                  child: Text(r.actionsTaken!, style: HodiTextStyles.bodyMedium),
                ),
                const SizedBox(height: 16),
              ],

              _Card(
                title: 'History',
                child: detail.timeline.isEmpty
                    ? Text(
                        'Nothing has happened yet.',
                        style: HodiTextStyles.bodySmall
                            .copyWith(color: HodiColors.textLight),
                      )
                    : Column(
                        children: [
                          for (final u in detail.timeline) _TimelineRow(update: u),
                        ],
                      ),
              ),
              const SizedBox(height: 16),

              if (canComment && r.open) ...[
                _Card(
                  title: 'Add an update',
                  child: Column(
                    children: [
                      HodiTextField(
                        controller: _commentController,
                        hintText: 'Anything worth knowing',
                        maxLines: 3,
                      ),
                      const SizedBox(height: 12),
                      HodiGradientButton(
                        text: 'Post',
                        isLoading: _busy,
                        onPressed: _busy ? null : _comment,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              if (canResolve && r.open)
                _ResolveCard(
                  busy: _busy,
                  onResolve: (actions, notes) => _run(() => _report(() => ref
                      .read(maintenanceRepositoryProvider)
                      .resolve(
                          id: widget.id, actionsTaken: actions, notes: notes))),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.request});

  final MaintenanceRequestModel request;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              StatusPill(request: request),
              const SizedBox(width: 8),
              PriorityDot(priority: request.priority),
              const Spacer(),
              Text(
                request.requestRef,
                style: HodiTextStyles.bodySmall
                    .copyWith(color: HodiColors.textLight),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(request.title, style: HodiTextStyles.heading3),
          if (request.description != null) ...[
            const SizedBox(height: 6),
            Text(request.description!, style: HodiTextStyles.bodyMedium),
          ],
          const SizedBox(height: 14),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 14),
          if (request.categoryName != null)
            _Row(label: 'Category', value: request.categoryName!),
          if (request.unitLabel.isNotEmpty)
            _Row(label: 'Unit', value: request.unitLabel),
          if (request.propertyName != null)
            _Row(label: 'Property', value: request.propertyName!),
          if (request.reporterName != null)
            _Row(label: 'Reported by', value: request.reporterName!),
          if (request.assigneeName != null)
            _Row(label: 'Assigned to', value: request.assigneeName!),
          _Row(label: 'Reported', value: _date(request.submittedOn)),
          // Only where the server set one, and coloured only where the server says it is late.
          if (request.dueLabel != null)
            _Row(
              label: 'Due',
              value: request.dueLabel!,
              tone: request.late || request.slaBreached
                  ? HodiColors.errorStart
                  : null,
            ),
          if (request.resolvedOn != null)
            _Row(label: 'Resolved', value: _date(request.resolvedOn), isLast: true),
        ],
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '-' : DateFormatter.formatDateTime(parsed);
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.value,
    this.tone,
    this.isLast = false,
  });

  final String label;
  final String value;
  final Color? tone;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.textLight),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: tone ?? HodiColors.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.update});

  final MaintenanceUpdateModel update;

  @override
  Widget build(BuildContext context) {
    final moved = update.isStatusChange && update.toLabel != null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: moved ? HodiColors.primaryStart : HodiColors.dividerStrong,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (moved)
                  Text(
                    update.fromLabel == null
                        ? update.toLabel!
                        : '${update.fromLabel} → ${update.toLabel}',
                    style: HodiTextStyles.bodyMedium
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                if (update.comment != null && update.comment!.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: moved ? 2 : 0),
                    child: Text(update.comment!,
                        style: HodiTextStyles.bodyMedium),
                  ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      [
                        if (update.performedByName != null) update.performedByName!,
                        _when(update.performedOn),
                      ].where((s) => s.isNotEmpty).join(' · '),
                      style: HodiTextStyles.bodySmall
                          .copyWith(fontSize: 11, color: HodiColors.textLight),
                    ),
                    // Labelled rather than hidden: the server already withholds what a tenant may
                    // not see, so anything here is visible to whoever is reading it — this only
                    // says which of them were meant for the office.
                    if (!update.visibleToTenant) ...[
                      const SizedBox(width: 6),
                      const Icon(Icons.lock_outline,
                          size: 11, color: HodiColors.textFaint),
                      const SizedBox(width: 2),
                      Text(
                        'internal',
                        style: HodiTextStyles.bodySmall
                            .copyWith(fontSize: 10, color: HodiColors.textFaint),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _when(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '' : DateFormatter.formatDateTime(parsed);
  }
}

class _RateCard extends StatefulWidget {
  const _RateCard({required this.busy, required this.onRate});

  final bool busy;
  final void Function(int stars, String? feedback) onRate;

  @override
  State<_RateCard> createState() => _RateCardState();
}

class _RateCardState extends State<_RateCard> {
  final _feedback = TextEditingController();
  int _stars = 0;

  @override
  void dispose() {
    _feedback.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Card(
      title: 'How was it?',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              for (var i = 1; i <= 5; i++)
                IconButton(
                  onPressed: () => setState(() => _stars = i),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                  icon: Icon(
                    i <= _stars ? Icons.star : Icons.star_border,
                    color: i <= _stars
                        ? HodiColors.warningStart
                        : HodiColors.textFaint,
                    size: 30,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          HodiTextField(
            controller: _feedback,
            hintText: 'Anything to add (optional)',
            maxLines: 2,
          ),
          const SizedBox(height: 12),
          HodiGradientButton(
            text: 'Send',
            isLoading: widget.busy,
            // Dead until a star is chosen: the server refuses anything outside one to five, and
            // an enabled button that cannot succeed is a button that fails.
            onPressed: _stars == 0 || widget.busy
                ? null
                : () => widget.onRate(
                      _stars,
                      _feedback.text.trim().isEmpty ? null : _feedback.text.trim(),
                    ),
          ),
        ],
      ),
    );
  }
}

class _RatingGiven extends StatelessWidget {
  const _RatingGiven({required this.stars, this.feedback});

  final int stars;
  final String? feedback;

  @override
  Widget build(BuildContext context) {
    return _Card(
      title: 'Rated',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for (var i = 1; i <= 5; i++)
                Icon(
                  i <= stars ? Icons.star : Icons.star_border,
                  size: 20,
                  color: i <= stars
                      ? HodiColors.warningStart
                      : HodiColors.textFaint,
                ),
            ],
          ),
          if (feedback != null && feedback!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(feedback!, style: HodiTextStyles.bodyMedium),
          ],
        ],
      ),
    );
  }
}

class _ResolveCard extends StatefulWidget {
  const _ResolveCard({required this.busy, required this.onResolve});

  final bool busy;
  final void Function(String actions, String? notes) onResolve;

  @override
  State<_ResolveCard> createState() => _ResolveCardState();
}

class _ResolveCardState extends State<_ResolveCard> {
  final _actions = TextEditingController();
  final _notes = TextEditingController();

  @override
  void dispose() {
    _actions.dispose();
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Card(
      title: 'Mark it done',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'What you did is what the tenant sees, and it is what settles a query months later.',
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
          ),
          const SizedBox(height: 12),
          HodiTextField(
            controller: _actions,
            labelText: 'What was done',
            maxLines: 3,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 12),
          HodiTextField(
            controller: _notes,
            labelText: 'Notes (optional)',
            maxLines: 2,
          ),
          const SizedBox(height: 12),
          HodiGradientButton(
            text: 'Resolve',
            isLoading: widget.busy,
            // The server requires it, so the button waits for it rather than bouncing back.
            onPressed: _actions.text.trim().isEmpty || widget.busy
                ? null
                : () => widget.onResolve(
                      _actions.text.trim(),
                      _notes.text.trim().isEmpty ? null : _notes.text.trim(),
                    ),
          ),
        ],
      ),
    );
  }
}
