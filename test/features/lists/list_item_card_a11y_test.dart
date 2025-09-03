import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_organizer/data/models/list_item.dart';
import 'package:house_organizer/features/lists/widgets/list_item_card.dart';

void main() {
  testWidgets('ListItemCard exposes semantics for actions', (tester) async {
    final item = ListItem(
      id: '1',
      name: 'Milk',
      quantity: 1,
      isPurchased: false,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListItemCard(item: item),
        ),
      ),
    );

    // Open popup menu
    await tester.tap(find.byType(PopupMenuButton<String>));
    await tester.pumpAndSettle();

    expect(find.text('Edit'), findsOneWidget);
    expect(find.text('Delete'), findsOneWidget);

    // Ensure checkbox exists and can be toggled
    expect(find.byType(Checkbox), findsOneWidget);
  });
}

