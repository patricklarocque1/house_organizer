import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_organizer/data/models/list_item.dart';
import 'package:house_organizer/features/lists/widgets/add_item_dialog.dart';

void main() {
  testWidgets('AddItemDialog has labeled actions and validates', (tester) async {
    ListItem? created;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AddItemDialog(onAddItem: (i) => created = i),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    // Try submit without name
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(find.text('Please enter an item name'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).first, 'Bread');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    expect(created, isNotNull);
    expect(created!.name, 'Bread');
  });
}

