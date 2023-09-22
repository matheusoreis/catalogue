import '../../../../models/home/blog/blog_model.dart';

abstract class BlogState {
  BlogModelData get blog;
}

class SuccessBlogState extends BlogState {
  @override
  final BlogModelData blog;

  SuccessBlogState({
    required this.blog,
  });
}
