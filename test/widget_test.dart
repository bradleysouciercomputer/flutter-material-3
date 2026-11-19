import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_material_lab/main.dart';

void main() {
  testWidgets('renders the component lab and its first examples',
      (tester) async {
    await tester.pumpWidget(const MaterialLabApp());
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Flutter Material Lab'), findsOneWidget);
    expect(find.text('All components'), findsWidgets);
    expect(find.text('Bottom sheets'), findsWidgets);
    expect(find.text('Buttons'), findsWidgets);

  });
}
