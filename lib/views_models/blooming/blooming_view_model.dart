import 'package:bloom_app/models/blooming/blooming_model.dart';
import 'package:get/get.dart';

class BloomingViewModel extends GetxController {
  List<Map<String, dynamic>> dummyData = [
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://images.unsplash.com/photo-1433086966358-54859d0ed716?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJlfGVufDB8fDB8fHww",
      "description": "Description of item 1"
    },
    {
      "likes": "21",
      "isLike": true,
      "image":
          "https://images.unsplash.com/photo-1586348943529-beaae6c28db9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      "description": "Description of item 2"
    },
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      "description": "Description of item 3"
    },
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://plus.unsplash.com/premium_photo-1673264933212-d78737f38e48?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      "description": "Description of item 4"
    },
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://images.unsplash.com/photo-1433086966358-54859d0ed716?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJlfGVufDB8fDB8fHww",
      "description": "Description of item 5"
    },
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://images.unsplash.com/photo-1586348943529-beaae6c28db9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      "description": "Description of item 6"
    },
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      "description": "Description of item 7"
    },
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://plus.unsplash.com/premium_photo-1673264933212-d78737f38e48?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      "description": "Description of item 8"
    },
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://images.unsplash.com/photo-1433086966358-54859d0ed716?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJlfGVufDB8fDB8fHww",
      "description": "Description of item 9"
    },
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://images.unsplash.com/photo-1586348943529-beaae6c28db9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      "description": "Description of item 10"
    },
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      "description": "Description of item 11"
    },
    {
      "likes": "21",
      "isLike": false,
      "image":
          "https://plus.unsplash.com/premium_photo-1673264933212-d78737f38e48?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
      "description": "Description of item 12"
    }
  ];

  List<BloomingModel> bloomingData = [];
  bool isLike = false;

  updateLikeStatus(int index) {
    bool newLikeStatus = isLike = !isLike;
    bloomingData[index].isLike = newLikeStatus;
    update();
  }

  void getData() {
    for (var i in dummyData) {
      bloomingData.add(BloomingModel.fromJson(i));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
