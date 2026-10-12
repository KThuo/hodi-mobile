/// The three analytics shapes the dashboard's Insights section reads.
///
/// Hand-written rather than generated: they are small, read-only, and each takes only the fields
/// its card draws. Every rate is the server's and is kept as sent — recomputing one here is how the
/// phone and the web page come to disagree about the same tenancy.
library;

double _money(Object? v) => (v as num?)?.toDouble() ?? 0;
double? _rate(Object? v) => (v as num?)?.toDouble();
int _count(Object? v) => (v as num?)?.toInt() ?? 0;

/// The twelve months ending the current one, as the server names it — "Nov 2025 – Oct 2026".
class AnalyticsWindowLabel {
  static String of(Map<String, dynamic>? window) => (window?['label'] as String?) ?? '';
}

/// One tenancy near the bottom of the league: who, where, and the figures that put it there.
class TenantToChase {
  final String id;
  final String tenantUserId;
  final String tenantName;
  final String unitLabel;
  final String? propertyName;
  final double owed;
  final double? onTimeRate;
  final int onTime;
  final int dueInvoices;

  /// Negative when early. Null when nothing was ever allocated.
  final int? medianDaysToPay;

  /// Null for a tenancy too new to rank — the card leaves those off.
  final int? rank;
  final bool ranked;

  const TenantToChase({
    required this.id,
    required this.tenantUserId,
    required this.tenantName,
    required this.unitLabel,
    required this.propertyName,
    required this.owed,
    required this.onTimeRate,
    required this.onTime,
    required this.dueInvoices,
    required this.medianDaysToPay,
    required this.rank,
    required this.ranked,
  });

  factory TenantToChase.fromJson(Map<String, dynamic> json) => TenantToChase(
        id: json['id'] as String,
        tenantUserId: (json['tenantUserId'] as String?) ?? '',
        tenantName: (json['tenantName'] as String?) ?? '',
        unitLabel: (json['unitLabel'] as String?) ?? '',
        propertyName: json['propertyName'] as String?,
        owed: _money(json['owed']),
        onTimeRate: _rate(json['onTimeRate']),
        onTime: _count(json['onTime']),
        dueInvoices: _count(json['dueInvoices']),
        medianDaysToPay: (json['medianDaysToPay'] as num?)?.toInt(),
        rank: (json['rank'] as num?)?.toInt(),
        ranked: json['ranked'] == true,
      );
}

/// The bottom of the ranked league, worst first, and how many tenancies it was ranked among.
class TenantsToChase {
  final String windowLabel;
  final List<TenantToChase> tenants;
  final int tenancies;

  const TenantsToChase({required this.windowLabel, required this.tenants, required this.tenancies});

  /// Unranked rows are dropped: "too new to tell" is not "worth a conversation".
  factory TenantsToChase.fromJson(Map<String, dynamic> json) => TenantsToChase(
        windowLabel: AnalyticsWindowLabel.of(json['window'] as Map<String, dynamic>?),
        tenants: ((json['content'] as List?) ?? const [])
            .map((e) => TenantToChase.fromJson(Map<String, dynamic>.from(e as Map)))
            .where((t) => t.ranked)
            .toList(),
        tenancies: _count(json['tenancies']),
      );
}

/// One property's rent collected against what its rental units ask.
class PropertyRealised {
  final String id;
  final String propertyName;
  final String? estateName;
  final double rentRoll;
  final double rentCollected;

  /// Null when the property has no rental rent roll — owned units and Stays have none.
  final double? realisedRate;

  const PropertyRealised({
    required this.id,
    required this.propertyName,
    required this.estateName,
    required this.rentRoll,
    required this.rentCollected,
    required this.realisedRate,
  });

  factory PropertyRealised.fromJson(Map<String, dynamic> json) {
    final realisation = Map<String, dynamic>.from((json['realisation'] as Map?) ?? const {});
    return PropertyRealised(
      id: json['id'] as String,
      propertyName: (json['propertyName'] as String?) ?? '',
      estateName: json['estateName'] as String?,
      rentRoll: _money(realisation['rentRoll']),
      rentCollected: _money(realisation['rentCollected']),
      realisedRate: _rate(json['realisedRate']),
    );
  }
}

/// Every property in scope by realised share, best first, and the scope's own figure.
class RentRealised {
  final String windowLabel;
  final List<PropertyRealised> properties;
  final double rentRoll;
  final double rentCollected;
  final double? realisedRate;

  const RentRealised({
    required this.windowLabel,
    required this.properties,
    required this.rentRoll,
    required this.rentCollected,
    required this.realisedRate,
  });

  /// Properties with no rent roll are left off: a bar for "no rental units" says nothing.
  factory RentRealised.fromJson(Map<String, dynamic> json) {
    final total = Map<String, dynamic>.from((json['realisation'] as Map?) ?? const {});
    final rows = ((json['content'] as List?) ?? const [])
        .map((e) => PropertyRealised.fromJson(Map<String, dynamic>.from(e as Map)))
        .where((p) => p.realisedRate != null)
        .toList()
      ..sort((a, b) => b.realisedRate!.compareTo(a.realisedRate!));
    return RentRealised(
      windowLabel: AnalyticsWindowLabel.of(json['window'] as Map<String, dynamic>?),
      properties: rows,
      rentRoll: _money(total['rentRoll']),
      rentCollected: _money(total['rentCollected']),
      realisedRate: _rate(total['realisedRate']),
    );
  }
}

/// HODI Stays, as a short-let operator reads it.
class StaysSummary {
  final String windowLabel;
  final int units;
  final int nights;
  final int available;
  final double revenue;
  final double? occupancyRate;

  /// Average rate per night sold.
  final double? adr;

  /// Revenue per night available.
  final double? revpar;

  const StaysSummary({
    required this.windowLabel,
    required this.units,
    required this.nights,
    required this.available,
    required this.revenue,
    required this.occupancyRate,
    required this.adr,
    required this.revpar,
  });

  factory StaysSummary.fromJson(Map<String, dynamic> json) => StaysSummary(
        windowLabel: AnalyticsWindowLabel.of(json['window'] as Map<String, dynamic>?),
        units: _count(json['units']),
        nights: _count(json['nights']),
        available: _count(json['available']),
        revenue: _money(json['revenue']),
        occupancyRate: _rate(json['occupancyRate']),
        adr: _rate(json['adr']),
        revpar: _rate(json['revpar']),
      );
}
