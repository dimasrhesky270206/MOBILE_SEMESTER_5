import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

void main() {
  testWidgets('Dashboard satu kolom di layar sempit', (tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    addTearDown(tester.view.reset);

    await tester.pumpWidget(const DashboardApp());

    // Memastikan terdapat 4 card
    expect(find.byType(Card), findsNWidgets(4));

    // Ambil posisi Card pertama dan kedua
    final card1 = tester.getTopLeft(find.byType(Card).at(0));
    final card2 = tester.getTopLeft(find.byType(Card).at(1));

    // Pada layar sempit, Card kedua berada di bawah Card pertama
    expect(card2.dy, greaterThan(card1.dy));
  });

  testWidgets('Dashboard dua kolom di layar lebar', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;

    addTearDown(tester.view.reset);

    await tester.pumpWidget(const DashboardApp());

    // Memastikan terdapat 4 card
    expect(find.byType(Card), findsNWidgets(4));

    // Ambil posisi Card pertama dan kedua
    final card1 = tester.getTopLeft(find.byType(Card).at(0));
    final card2 = tester.getTopLeft(find.byType(Card).at(1));

    // Pada layar lebar, Card kedua berada di samping Card pertama
    expect(card2.dx, greaterThan(card1.dx));
  });
}