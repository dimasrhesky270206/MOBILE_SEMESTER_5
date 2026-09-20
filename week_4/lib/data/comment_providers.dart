import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/comment.dart';
import 'providers.dart';
import 'repositories/comment_repository.dart';

final commentRepositoryProvider = Provider<CommentRepository>(
  (ref) => CommentRepository(ref.watch(dioProvider)),
);

final commentsProvider =
    FutureProvider.family<List<Comment>, int>((ref, postId) async {
  final repo = ref.watch(commentRepositoryProvider);
  return repo.fetchComments(postId);
});
