import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/api_client.dart';
import '../api/api_constants.dart';

/// What the server says about maps: whether there are any, and the key to draw them with.
///
/// ## Why the key comes from the server, and what that rules out
///
/// The web fetches its key from `/map-config` at runtime, and the app does the same — one setting,
/// one place to rotate it, no release needed. That works here because the key is a **URL
/// parameter**: a Maps Static API request carries it in the query string, so a key fetched a
/// moment ago is the key the next image uses.
///
/// It would **not** work for the interactive `google_maps_flutter` widget on Android. That plugin
/// reads `com.google.android.geo.API_KEY` out of `AndroidManifest.xml` when the map view is
/// created, and there is no runtime setter — the key has to be baked in at build time, and
/// rotating it would mean shipping a release. iOS is more forgiving (`GMSServices.provideAPIKey()`
/// is a runtime call), but a design that works on one platform only is not a design.
///
/// So: static images, and the same key the browser uses.
///
/// ## `provider` decides, not the key
///
/// The server answers `provider: "none"` whenever the key is blank, whatever the provider setting
/// says, so that a deployment without a key does not load a map it cannot authenticate and show an
/// error tile where a photograph should be. [MapConfig.enabled] is that answer, and a screen with
/// no map renders nothing rather than a grey box.
class MapConfig {
  final String provider;
  final String apiKey;

  /// The map style id. Only advanced markers need it, which static images do not — carried so
  /// that a future interactive map does not have to re-read this endpoint.
  final String mapId;

  const MapConfig({
    this.provider = 'none',
    this.apiKey = '',
    this.mapId = '',
  });

  bool get enabled => provider != 'none' && apiKey.isNotEmpty;

  factory MapConfig.fromJson(Map<String, dynamic> json) => MapConfig(
        provider: json['provider']?.toString() ?? 'none',
        apiKey: json['apiKey']?.toString() ?? '',
        mapId: json['mapId']?.toString() ?? '',
      );
}

/// Asked for once and kept, because it changes when somebody edits a setting, not while the app
/// is open. Not auto-disposed: every listing screen would otherwise re-ask on its way in.
final mapConfigProvider = FutureProvider<MapConfig>((ref) async {
  final response = await ref.watch(apiClientProvider).get<MapConfig>(
        ApiConstants.mapConfig,
        fromJsonT: (data) => MapConfig.fromJson(data as Map<String, dynamic>),
      );
  // A map is a nicety on a listing page. Failing to read the config hides the map; it must not
  // fail the screen the map is on.
  return response.isSuccess ? (response.data ?? const MapConfig()) : const MapConfig();
});
