import 'models/ImageModel.dart';
import 'models/VideoModel.dart';
import 'models/conversation_model.dart';



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
