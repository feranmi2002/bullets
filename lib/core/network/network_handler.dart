import 'dart:convert';

import 'package:bullets/core/network/responses/catergories_response.dart';
import 'package:bullets/core/network/responses/conversation_response.dart';
import 'package:bullets/core/network/responses/lesson_response.dart';
import 'package:bullets/core/network/responses/subject_response.dart';
import 'package:bullets/core/network/responses/topic_response.dart';
import 'package:dio/dio.dart';

import '../api/end_points.dart';

class NetworkHandler {
  final Dio _dio;

  NetworkHandler(this._dio);

  Future<List<CategoryResponse>> getCategories() async {
    try {
      final response = await _dio.get(ApiUrl.categoriesApi);
      final jsonData = response.data;
      return categoryResponseFromJson(jsonData);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ?? 'An error occurred');
    }
  }

  Future<List<SubjectResponse>> getSubjects({required String categoryId}) async {
    try {
      final response = await _dio.get(ApiUrl.subjectApi.replaceFirst('{categoriesId}', categoryId));
      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (jsonData is List) {
          return jsonData.map((subject) => SubjectResponse.fromJson(subject)).toList();
        } else {
          throw Exception('Invalid JSON data');
        }
      } else {
        throw Exception('Failed to load subjects. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ?? 'An error occurred');
    }
  }

  Future<TopicResponse> getTopics({required String subjectId}) async {
    try {
      final response = await _dio.get(ApiUrl.topicsApi.replaceFirst('{subjectId}', subjectId));
      if (response.statusCode == 200) {
        final jsonData = response.data;
        return TopicResponse.fromJson(jsonData); // Directly return the TopicResponse object
      } else {
        throw Exception('Failed to load topics. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ?? 'An error occurred');
    }
  }


  Future<LessonResponse> getLessons({required String topicId}) async {
    try {
      final response = await _dio.get(ApiUrl.lessonApi.replaceFirst('{topicId}', topicId));
      if (response.statusCode == 200) {
        final jsonData = response.data;
        return LessonResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load lessons. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ?? 'An error occurred');
    }
  }

  Future<ConversationResponse> getAllConversations({
    required String lessonId,
    int limit = 30,
    int offset = 0,
  }) async {
    try {
      final response = await _dio.get(
        ApiUrl.conversationFirstElementApi
            .replaceFirst('{lessonId}', lessonId)
              .replaceFirst('{limit}', limit.toString())
        .replaceFirst('{offset}', offset.toString()),
      );
      if (response.statusCode == 200) {
        final jsonData = response.data;
        return conversationResponseFromJson(jsonData);
      } else {
        throw Exception('Failed to load conversations. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ?? 'An error occurred');
    }
  }

  Future<ConversationResponse> getConversations({
    required String lessonId,
  }) async {
    try {
      final response = await _dio.get(
        ApiUrl.conversationListApi.replaceFirst('{lessonId}', lessonId),
      );

      if (response.statusCode == 200) {
        // Serialize response.data to a JSON string
        final jsonString = jsonEncode(response.data);

        // Parse JSON string into ConversationResponse
        final conversationResponse = conversationResponseFromJson(jsonString);

        // Return the parsed conversationResponse
        return conversationResponse;
      } else {
        throw Exception('Failed to load conversations. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ?? 'An error occurred');
    }
  }

}