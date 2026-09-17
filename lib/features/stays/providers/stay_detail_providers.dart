import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/stay_detail_model.dart';
import 'stay_providers.dart';

final stayDetailProvider =
    FutureProvider.autoDispose.family<StayDetailModel?, String>((ref, id) async {
  final response = await ref.watch(stayRepositoryProvider).byId(id);
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty
        ? response.message
        : 'That stay is no longer available.');
  }
  return response.data;
});

/// The dates and party size somebody is asking about.
class StayEnquiry {
  final DateTime? checkIn;
  final DateTime? checkOut;
  final int guests;

  const StayEnquiry({this.checkIn, this.checkOut, this.guests = 1});

  bool get complete =>
      checkIn != null && checkOut != null && checkOut!.isAfter(checkIn!);

  int get nights =>
      complete ? checkOut!.difference(checkIn!).inDays : 0;

  StayEnquiry copyWith({
    DateTime? checkIn,
    DateTime? checkOut,
    int? guests,
  }) {
    return StayEnquiry(
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      guests: guests ?? this.guests,
    );
  }
}

class _EnquiryNotifier extends Notifier<StayEnquiry> {
  @override
  StayEnquiry build() => const StayEnquiry();

  void setDates(DateTime checkIn, DateTime checkOut) =>
      state = state.copyWith(checkIn: checkIn, checkOut: checkOut);

  void setGuests(int guests) => state = state.copyWith(guests: guests);
}

final stayEnquiryProvider =
    NotifierProvider<_EnquiryNotifier, StayEnquiry>(_EnquiryNotifier.new);

/// What the chosen dates cost.
///
/// Null until there are dates to ask about — the server requires both, so asking before they are
/// picked would be a request that cannot be answered. Nights that cannot be sold come back as a
/// **successful** quote with `available` false and reasons in it, which the screen reads out.
final stayQuoteProvider =
    FutureProvider.autoDispose.family<StayQuoteModel?, String>((ref, id) async {
  final enquiry = ref.watch(stayEnquiryProvider);
  if (!enquiry.complete) return null;

  final response = await ref.watch(stayRepositoryProvider).quote(
        id: id,
        checkIn: enquiry.checkIn!,
        checkOut: enquiry.checkOut!,
        guests: enquiry.guests,
      );
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty
        ? response.message
        : 'That price could not be worked out.');
  }
  return response.data;
});
