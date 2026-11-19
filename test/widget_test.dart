import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_material_lab/main.dart';

void main() {
  testWidgets('renders the component lab and its first examples',
      (tester) async {
    tester.view.physicalSize = const Size(1280, 1200);
    tester.view.devicePixelRatio = 1;

    await tester.pumpWidget(const MaterialLabApp());
    await tester.pumpAndSettle();

    expect(find.text('Flutter Material Lab'), findsOneWidget);
    expect(find.text('All components'), findsWidgets);
    expect(find.text('Bottom sheets'), findsWidgets);
    expect(find.text('Buttons'), findsWidgets);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
