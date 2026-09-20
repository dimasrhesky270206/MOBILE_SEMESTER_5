import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/post.dart';
import '../data/providers.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  const PostDetailPage({
    super.key,
    required this.postId,
    this.post,
  });

  final int postId;
  final Post? post;

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  late Future<Post> _postFuture;

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      _postFuture = Future.value(widget.post);
    } else {
      _fetchPost();
    }
  }

  void _fetchPost() {
    final repo = ref.read(postRepositoryProvider);
    _postFuture = repo.fetchPost(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post #${widget.postId}'),
      ),
      body: FutureBuilder<Post>(
        future: _postFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      friendlyErrorMessage(snapshot.error!),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () {
                        setState(() {
                          _fetchPost();
                        });
                      },
                      child: const Text('Coba lagi'),
                    ),
                  ],
                ),
              ),
            );
          }
          final post = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'User ID: ${post.userId}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Divider(height: 24),
                    Text(
                      post.body,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
