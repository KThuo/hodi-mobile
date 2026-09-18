import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'map_config.dart';

/// A place somebody can search for, and the point it resolves to.
///
/// ## Why a location is not free text
///
/// Coordinates are what make the rest of it possible: finding vacant units within a radius of
/// somewhere, ordering them by how near they are, putting them on a map. All three need a point,
/// and a point cannot be derived from "near the shops" — so the place is chosen from Places and
/// its latitude and longitude come with it. `PlaceInput.vue` says the same thing at more length.
///
/// ## Why the REST API and not a plugin
///
/// The key comes from `/map-config` at runtime, as it does for the static maps beside this, so
/// that rotating it is a setting rather than a release. That rules out any SDK that reads a key
/// out of `AndroidManifest.xml` at startup. Places is an HTTP API with the key in a header, so it
/// works the same way the static map URL does.
///
/// **Places API (New)**, not the legacy `maps/api/place/*`. Google closed the old autocomplete to
/// new customers in March 2025 — the web moved to `AutocompleteSuggestion` for that reason, and a
/// new cloud project gets nothing at all from the old one.
///
/// ## It is allowed to be unavailable
///
/// No key configured, Places not enabled on the project, or a key restricted to HTTP referrers —
/// which a browser key usually is, and which an app request does not satisfy. Every failure here
/// is answered with an empty list, and the field above degrades to the plain text search it
/// replaced. A location box that stops working is not allowed to stop somebody finding a house.
class PlaceSuggestion {
  const PlaceSuggestion({required this.placeId, required this.text});

  final String placeId;

  /// What to show in the list — "Kilimani, Nairobi, Kenya".
  final String text;
}

/// A chosen place: its name as Google writes it, and where it is.
class PlacePoint {
  const PlacePoint({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  final String name;
  final double latitude;
  final double longitude;
}

class PlaceSearch {
  PlaceSearch({required MapConfig config, Dio? dio})
      : _config = config,
        _dio = dio ?? Dio();

  final MapConfig _config;
  final Dio _dio;

  static const _host = 'https://places.googleapis.com/v1';

  /// Whether there is any point asking. False means the caller should behave as a text field.
  bool get available => _config.enabled;

  /// Places matching what has been typed so far.
  ///
  /// [sessionToken] groups the keystrokes of one search with the lookup that ends it, which is how
  /// Google bills a session rather than every letter. A new token per search, discarded once a
  /// place is resolved.
  Future<List<PlaceSuggestion>> suggest(
    String input, {
    String? sessionToken,
  }) async {
    if (!available || input.trim().length < 3) return const [];

    try {
      final response = await _dio.post<dynamic>(
        '$_host/places:autocomplete',
        data: {
          'input': input.trim(),
          'sessionToken': ?sessionToken,
          // Kenya, because that is where the portfolio is. Without it "Westlands" offers a road
          // in London before the suburb three miles away.
          'includedRegionCodes': ['ke'],
        },
        options: Options(
          headers: {
            'X-Goog-Api-Key': _config.apiKey,
            'X-Goog-FieldMask':
                'suggestions.placePrediction.placeId,suggestions.placePrediction.text',
          },
          // Handled here rather than thrown: a refusal means no suggestions, not an error to
          // put in front of somebody looking for a flat.
          validateStatus: (_) => true,
        ),
      );

      if (response.statusCode != 200) return const [];
      final body = _asMap(response.data);
      final suggestions = body['suggestions'];
      if (suggestions is! List) return const [];

      return suggestions
          .map(_asMap)
          .map((s) => _asMap(s['placePrediction']))
          .map((p) => PlaceSuggestion(
                placeId: p['placeId']?.toString() ?? '',
                text: _asMap(p['text'])['text']?.toString() ?? '',
              ))
          .where((s) => s.placeId.isNotEmpty && s.text.isNotEmpty)
          .toList();
    } catch (_) {
      return const [];
    }
  }

  /// Where a chosen suggestion actually is. Null when it cannot be resolved, which leaves the
  /// typed text standing with no pin — honest, and the same thing the web does.
  Future<PlacePoint?> resolve(String placeId, {String? sessionToken}) async {
    if (!available || placeId.isEmpty) return null;

    try {
      final response = await _dio.get<dynamic>(
        '$_host/places/$placeId',
        queryParameters: {'sessionToken': ?sessionToken},
        options: Options(
          headers: {
            'X-Goog-Api-Key': _config.apiKey,
            'X-Goog-FieldMask': 'location,displayName,formattedAddress',
          },
          validateStatus: (_) => true,
        ),
      );

      if (response.statusCode != 200) return null;
      final body = _asMap(response.data);
      final location = _asMap(body['location']);
      final lat = (location['latitude'] as num?)?.toDouble();
      final lng = (location['longitude'] as num?)?.toDouble();
      if (lat == null || lng == null) return null;

      final name = _asMap(body['displayName'])['text']?.toString() ??
          body['formattedAddress']?.toString() ??
          '';

      return PlacePoint(name: name, latitude: lat, longitude: lng);
    } catch (_) {
      return null;
    }
  }

  /// Dio hands back a decoded map for JSON and a string when the content type says otherwise.
  static Map<String, dynamic> _asMap(dynamic value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return value.cast<String, dynamic>();
    if (value is String && value.isNotEmpty) {
      try {
        final decoded = jsonDecode(value);
        if (decoded is Map) return decoded.cast<String, dynamic>();
      } catch (_) {
        // Not JSON. Nothing to read.
      }
    }
    return const {};
  }
}

/// Built from whatever `/map-config` answered. Unavailable until it has, which is the same as
/// unavailable for want of a key — the field simply behaves as text until then.
final placeSearchProvider = Provider<PlaceSearch>((ref) {
  final config = ref.watch(mapConfigProvider).value ?? const MapConfig();
  return PlaceSearch(config: config);
});
