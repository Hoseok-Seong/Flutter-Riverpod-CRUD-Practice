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

  void add(Post post) {
    List<Post> posts = state!.posts;
    // posts.add(post); // 이 방법도 가능.
    // 전개 연산자 ...
    List<Post> newPosts = [...posts, post]; // 추가, 삭제, 수정, 검색
    state = PostHomePageModel(posts: newPosts); // 레퍼런스가 달라지면 가능(값이 동일해도 다시 그린다)
  }

  void remove(int id) {
    List<Post> posts = state!.posts;
    // 검색과 삭제할 때 사용.
    List<Post> newPosts = posts.where((e) => e.id != id).toList();
    state = PostHomePageModel(posts: newPosts);
  }

  void update(Post post) {
    List<Post> posts = state!.posts;
    List<Post> newPosts = posts.map((e) => e.id == post.id ? post : e).toList();
    state = PostHomePageModel(posts: newPosts);
  }
}

// 창고 데이터, DTO에서 Mapping
// 창고 데이터만 관리하면 된다.
// posts라고 naming해주자(복잡하게 naming하지 말 것)
class PostHomePageModel {
  List<Post> posts;
  PostHomePageModel({required this.posts});
}