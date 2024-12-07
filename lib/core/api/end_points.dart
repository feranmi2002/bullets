const String categoriesId = '5e9b8b7694f2e70816d110fb';
const String phoneNumber = '08141894696';
const String subjectId='6080789a1e05e7071baf22d2';
const String topicsId ='608079571e05e7071baf22d3';
// const String lessonId ='608079791e05e7071baf22d4';

class ApiUrl {
  static const baseURL = "https://app-6924d9ff-0550-4ff9-9ac7-8d6cee9c5136.cleverapps.io";
  static const categoriesApi = "$baseURL/api/user/categories";

  static const specificSubjectListApi =
      "$baseURL/api/user/categories/${categoriesId}/subjects/${phoneNumber}";
  static const subjectApi = "$baseURL/api/user/categories/${categoriesId}/subjects";

  static const subjectApiType = "$baseURL/api/user/subjects/{type}";

  static const subjectListApi = "$baseURL/api/user/subjects";

  static const topicsApi = "$baseURL/api/user/subjects/{subjectId}/topics";

  static const lessonApi = "$baseURL/api/user/topics/{topicId}/lessons";

  static const conversationListApi =
      "$baseURL/api/user/lessons/{lessonId}/conversations";


  static const conversationFirstElementApi =
      "$baseURL/api/user/lessons/{lessonId}/conversations?limit={limit}&offset={offset}";
}
