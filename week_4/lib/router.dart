import 'package:go_router/go_router.dart';
import 'data/models/post.dart';
import 'pages/paged_post_page.dart';
import 'pages/post_detail_page.dart';
import 'pages/post_list_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PagedPostPage(),
    ),
    GoRoute(
      path: '/list',
      builder: (context, state) => const PostListPage(),
    ),
    GoRoute(
      path: '/post/:id',
      builder: (context, state) {
        final idStr = state.pathParameters['id'] ?? '0';
        final id = int.tryParse(idStr) ?? 0;
        final post = state.extra as Post?;
        return PostDetailPage(postId: id, post: post);
      },
    ),
  ],
);
