import 'models/ImageModel.dart';
import 'models/VideoModel.dart';
import 'models/conversation_model.dart';
import 'models/lesson_model.dart';
import 'models/subject_model.dart';



List<ConversationModel> allConversions =[
  ConversationModel(
    id: '1',
    type: 'text',
    message: 'Hello, how are you?',
    lessonId: 'lesson1',
    subjectId: 'subject1',
  ),
  ConversationModel(
    id: '2',
    type: 'image',
    imageModel: ImageModel(
      url: 'https://images.pexels.com/photos/29127453/pexels-photo-29127453/free-photo-of-colorful-wooden-house-roofs-at-sunset.jpeg',
      caption: 'This is an image',
      name: 'image'
    ),
    lessonId: 'lesson2',
    subjectId: 'subject2',
  ),
  ConversationModel(
    id: '3',
    type: 'video',
    videoModel: VideoModel(
      url: 'https://example.com/video1.mp4',
      caption: 'This is a video',
    ),
    lessonId: 'lesson3',
    subjectId: 'subject3',
  ),
  ConversationModel(
    id: '4',
    type: 'text',
    message: 'This is another message',
    lessonId: 'lesson4',
    subjectId: 'subject4',
  ),
  ConversationModel(
    id: '5',
    type: 'image',
    imageModel: ImageModel(
      url: 'https://images.pexels.com/photos/29473242/pexels-photo-29473242/free-photo-of-bright-tulip-bouquet-in-natural-light.jpeg',
      caption: 'This is another image',
      name: 'image'
    ),
    lessonId: 'lesson5',
    subjectId: 'subject5',
  ),
];


List<SubjectModel> dummySubjects = [
  SubjectModel(
    id: "subject1",
    title: "Mathematics",
    otherDetails: "This is a mathematics subject",
    duration: "2 hours",
    category: "Science",
    draft: false,
    imageUrl: "https://picsum.photos/200/300",
    author: "John Doe",
  ),
  SubjectModel(
    id: "subject2",
    title: "English Language",
    otherDetails: "This is an English language subject",
    duration: "1.5 hours",
    category: "Arts",
    draft: true,
    imageUrl: "https://picsum.photos/200/301",
    author: "Jane Doe",
  ),
  SubjectModel(
    id: "subject3",
    title: "Biology",
    otherDetails: "This is a biology subject",
    duration: "2.5 hours",
    category: "Science",
    draft: false,
    imageUrl: "https://picsum.photos/200/302",
    author: "Bob Smith",
  ),
  SubjectModel(
    id: "subject4",
    title: "History",
    otherDetails: "This is a history subject",
    duration: "1 hour",
    category: "Arts",
    draft: true,
    imageUrl: "https://picsum.photos/200/303",
    author: "Alice Johnson",
  ),
  SubjectModel(
    id: "subject5",
    title: "Physics",
    otherDetails: "This is a physics subject",
    duration: "3 hours",
    category: "Science",
    draft: false,
    imageUrl: "https://picsum.photos/200/304",
    author: "Mike Brown",
  ),
];

List<LessonModel> dummyLessons = [
  LessonModel(
    id: "lesson1",
    lesson: 1,
    title: "Introduction to Algebra",
    topicId: "Maths-101",
  ),
  LessonModel(
    id: "lesson2",
    lesson: 2,
    title: "Equations and Inequalities",
    topicId: "Maths-101",
  ),
  LessonModel(
    id: "lesson3",
    lesson: 3,
    title: "Functions and Graphs",
    topicId: "Maths-101",
  ),
  LessonModel(
    id: "lesson4",
    lesson: 4,
    title: "Systems of Equations",
    topicId: "Maths-101",
  ),
  LessonModel(
    id: "lesson5",
    lesson: 5,
    title: "Quadratic Equations",
    topicId: "Maths-101",
  ),
];
//
// // If you want to generate the dummy data using a loop
// List<LessonModel> dummyLessonsGenerated = List.generate(
//   10,
//       (index) => LessonModel(
//     id: "${index + 1}",
//     lesson: index + 1,
//     title: "Lesson ${index + 1}: Introduction to Topic ${index + 1}",
//     topicId: "Topic-${index + 1}",
//   ),
// );