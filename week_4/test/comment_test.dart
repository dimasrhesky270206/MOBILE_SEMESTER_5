import 'package:flutter_test/flutter_test.dart';
import 'package:week4_api/data/models/comment.dart';

void main() {
  group('Comment Model Test', () {
    test('fromJson aman terhadap field yang hilang', () {
      final comment = Comment.fromJson({'id': 10});
      expect(comment.id, 10);
      expect(comment.postId, 0);
      expect(comment.name, '');
      expect(comment.email, '');
      expect(comment.body, '');
    });

    test('fromJson memetakan data lengkap dengan benar', () {
      final json = {
        'postId': 1,
        'id': 1,
        'name': 'id labore ex et quam laborum',
        'email': 'Eliseo@gardner.biz',
        'body': 'laudantium enim quasi est quidem magnam voluptate ipsam eos',
      };
      final comment = Comment.fromJson(json);
      expect(comment.postId, 1);
      expect(comment.id, 1);
      expect(comment.name, 'id labore ex et quam laborum');
      expect(comment.email, 'Eliseo@gardner.biz');
      expect(comment.body, contains('laudantium'));
    });
  });
}
