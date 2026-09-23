import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/metre_model.dart';
import '../domain/metre_history_model.dart';

class MetreRepository {
  final ApiClient _apiClient;

  MetreRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// [read] is the screen's Read/Unread chip: true for meters already read this month, false for
  /// the ones still owing a reading, null for all of them.
  ///
  /// The server asks the opposite question — `readingDue` — so the answer is inverted here rather
  /// than at the screen, which should go on saying what it means. Legacy's parameter was called
  /// `currentReading` and the rebuilt server has no such parameter: an unknown query parameter is
  /// ignored, so both chips quietly returned the same unfiltered list.
  Future<ApiResponse<PagedResponse<MetreModel>>> getMetres({
    int page = 0,
    int pageSize = 20,
    bool? read,
    String? searchTerm,
    String? estateId,
    String? propertyId,
  }) async {
    return _apiClient.get<PagedResponse<MetreModel>>(
      ApiConstants.meters,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (read != null) 'readingDue': !read,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => MetreModel.fromJson(item),
      ),
    );
  }

  /// One year of a meter's readings.
  ///
  /// Not paged, and it never was: the server answers a `ReadingHistory` — a year, the years there
  /// are to choose from, and the rows for that year. Parsing it as a page looked for a `content`
  /// key that is not there, so every history came back empty.
  ///
  /// `page`, `pageSize` and `searchTerm` went with it. The endpoint takes `year` and nothing else,
  /// and an unknown query parameter is ignored rather than refused — which is why sending three of
  /// them looked like it was working.
  Future<ApiResponse<MetreHistoryPage>> getMetreHistory({
    required String metreId,
    int? year,
  }) async {
    return _apiClient.get<MetreHistoryPage>(
      ApiConstants.meterReadings(metreId),
      queryParameters: {'year': ?year},
      fromJsonT: (data) => MetreHistoryPage.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Takes a reading. The meter is in the path and the number is the whole body.
  ///
  /// **No image.** Legacy carried the photograph base64-encoded in this same request, which cost a
  /// third again on the wire and lost the reading whenever the photo failed to arrive. The rebuilt
  /// backend has no image field to send it to, and the plan is for the photograph to follow as its
  /// own multipart upload once there is somewhere to put it — so the reading now posts alone, which
  /// is a few hundred bytes and survives a weak signal. See docs/MOBILE_UPGRADE_PLAN.md §4.
  /// Attaches the photograph of the dial to a reading already taken.
  ///
  /// Multipart, and deliberately a second request. The reading posts first and returns its id; this
  /// follows, so a photograph that fails to arrive costs a retry rather than the number. Legacy
  /// base64-encoded it into the reading itself and lost both together — a third again on the wire,
  /// and a third copy of the image in memory while it was being built.
  Future<ApiResponse<void>> attachPhoto({
    required String readingId,
    required File photo,
  }) async {
    final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(photo.path, filename: 'reading.jpg'),
    });
    try {
      final response = await _apiClient.uploadFile(
        '${ApiConstants.meters}/readings/$readingId/photo',
        data: form,
      );
      return ApiResponse<void>.fromJson(response.data, null);
    } catch (e) {
      return const ApiResponse<void>(status: '01', message: 'The photograph could not be uploaded.');
    }
  }

  /// Where the photograph lives. Fetched only when somebody opens it.
  String photoUrl(String readingId) =>
      '${ApiConstants.baseUrl}${ApiConstants.meters}/readings/$readingId/photo';

  /// Takes a reading, and answers with the row that was created.
  ///
  /// The id comes back because the photograph is attached to it afterwards. Returning nothing, as
  /// this used to, would have meant fetching the history again just to find the reading that had
  /// only that moment been written.
  Future<ApiResponse<MetreHistoryModel>> updateReading({
    required String metreId,
    required String currentReading,
    String? note,
  }) async {
    return _apiClient.post<MetreHistoryModel>(
      ApiConstants.meterReadings(metreId),
      fromJsonT: (data) => MetreHistoryModel.fromJson(data as Map<String, dynamic>),
      data: {
        'currentReading': currentReading,
        if (note != null && note.isNotEmpty) 'note': note,
      },
    );
  }
}
