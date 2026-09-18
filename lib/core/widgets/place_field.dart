import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../map/place_search.dart';
import '../theme/hodi_border_radius.dart';
import '../theme/hodi_colors.dart';
import '../theme/hodi_text_styles.dart';

/// Where somebody is looking, as a place rather than as words.
///
/// The mobile counterpart of `hodi-f/src/components/forms/PlaceInput.vue`, and the same bargain:
/// typed text still counts, but choosing from the list captures a point — and a point is what
/// lets the search say "within 5 km" and "nearest first" instead of matching spellings.
///
/// ## Both halves are kept
///
/// [onText] fires as somebody types and is the free-text search. [onPlace] fires only when a
/// suggestion is tapped, so an edit cannot silently move the pin — the same rule the web states.
/// Clearing the field clears both.
///
/// ## It degrades rather than breaks
///
/// With no key, with Places not enabled on the project, or with a key restricted to HTTP referrers
/// — which a browser key usually is — the list simply never appears and this is the text field it
/// replaced. Somebody still finds a house; they just cannot ask for one within two kilometres.
class PlaceField extends ConsumerStatefulWidget {
  const PlaceField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onText,
    required this.onPlace,
    this.pinned = false,
    this.onClearPin,
  });

  final TextEditingController controller;
  final String hintText;

  /// Debounced free text. Null when the box has been emptied.
  final ValueChanged<String?> onText;
  final ValueChanged<PlacePoint> onPlace;

  /// Whether a point is currently held, which changes the leading glyph from a search to a pin.
  final bool pinned;

  /// Dropping the pin without clearing the words, for somebody who wants the text search back.
  final VoidCallback? onClearPin;

  @override
  ConsumerState<PlaceField> createState() => _PlaceFieldState();
}

class _PlaceFieldState extends ConsumerState<PlaceField> {
  static const _debounce = Duration(milliseconds: 400);

  Timer? _typing;
  List<PlaceSuggestion> _suggestions = const [];
  bool _looking = false;

  /// Groups the keystrokes of one search with the lookup that ends it, so Google bills a session
  /// rather than every letter. Replaced once a place is resolved.
  String? _session;

  @override
  void dispose() {
    _typing?.cancel();
    super.dispose();
  }

  void _onChanged(String raw) {
    _typing?.cancel();
    final text = raw.trim();

    // Typing after choosing means the pin no longer describes the words above it.
    if (widget.pinned) widget.onClearPin?.call();

    if (text.isEmpty) {
      setState(() => _suggestions = const []);
      widget.onText(null);
      return;
    }

    _typing = Timer(_debounce, () async {
      widget.onText(text);

      final search = ref.read(placeSearchProvider);
      if (!search.available) return;

      _session ??= DateTime.now().microsecondsSinceEpoch.toString();
      setState(() => _looking = true);
      final found = await search.suggest(text, sessionToken: _session);
      if (!mounted) return;
      setState(() {
        _looking = false;
        _suggestions = found;
      });
    });
  }

  Future<void> _choose(PlaceSuggestion suggestion) async {
    _typing?.cancel();
    FocusScope.of(context).unfocus();
    setState(() {
      _looking = true;
      _suggestions = const [];
    });

    final point = await ref
        .read(placeSearchProvider)
        .resolve(suggestion.placeId, sessionToken: _session);
    // The session ends with the lookup, whether or not it answered.
    _session = null;
    if (!mounted) return;

    setState(() => _looking = false);

    // Could not be resolved. The words stay and stand as a text search, which is what they were
    // a moment ago — better than clearing what somebody typed.
    if (point == null) {
      widget.onText(suggestion.text);
      widget.controller.text = suggestion.text;
      return;
    }

    widget.controller.text = point.name.isEmpty ? suggestion.text : point.name;
    widget.onPlace(point);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          onChanged: _onChanged,
          textInputAction: TextInputAction.search,
          style: HodiTextStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle:
                HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textFaint),
            prefixIcon: Icon(
              widget.pinned ? Icons.place : Icons.search,
              size: 19,
              color: widget.pinned ? HodiColors.primaryStart : HodiColors.textLight,
            ),
            suffixIcon: _looking
                ? const Padding(
                    padding: EdgeInsets.all(13),
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : widget.controller.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close, size: 18),
                        color: HodiColors.textLight,
                        onPressed: () {
                          widget.controller.clear();
                          _onChanged('');
                        },
                      ),
            isDense: true,
            filled: true,
            fillColor: HodiColors.cardBackground,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            border: OutlineInputBorder(
              borderRadius: HodiBorderRadius.card,
              borderSide: const BorderSide(color: HodiColors.divider),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: HodiBorderRadius.card,
              borderSide: const BorderSide(color: HodiColors.divider),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: HodiBorderRadius.card,
              borderSide: BorderSide(color: HodiColors.primaryStart, width: 1.6),
            ),
          ),
        ),

        if (_suggestions.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: HodiColors.cardBackground,
              borderRadius: HodiBorderRadius.card,
              border: Border.all(color: HodiColors.divider),
            ),
            child: Column(
              children: [
                for (final suggestion in _suggestions.take(5))
                  InkWell(
                    onTap: () => _choose(suggestion),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 11),
                      child: Row(
                        children: [
                          const Icon(Icons.place_outlined,
                              size: 16, color: HodiColors.textLight),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Text(
                              suggestion.text,
                              style: HodiTextStyles.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
