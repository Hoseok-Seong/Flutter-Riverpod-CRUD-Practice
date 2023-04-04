import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';

// 창고 관리자 (Provider)
final postHomePageProvider = StateNotifierProvider<PostHomePageViewModel, PostHomePageModel?>((ref) {
  return PostHomePageViewModel(null);
});

// 창고 (Store)
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?>{
  PostHomePageViewModel(super.state);
  
  // 화면을 초기화하는 메서드
  void init(List<Post> postDtoList) {
    state = PostHomePageModel(posts: postDtoList);
  }
}

// 창고 데이터, DTO에서 Mapping
// 창고 데이터만 관리하면 된다.
// posts라고 naming해주자(복잡하게 naming하지 말 것)
class PostHomePageModel {
  List<Post> posts;
  PostHomePageModel({required this.posts});
}