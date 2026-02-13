import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comicvault/app.dart';
// Nota: Nei test unitari complessi dovremmo mockare Firebase e Dotenv,
// ma per ora verifichiamo solo che l'app parta ignorando l'init del main.

void main() {
  testWidgets('App starts and shows Home Screen', (WidgetTester tester) async {
    // PumpWidget avvia l'app nell'ambiente di test.
    // Dobbiamo avvolgerla in ProviderScope anche qui!
    await tester.pumpWidget(const ProviderScope(child: ComicVaultApp()));

    // Aspetta che le animazioni finiscano
    await tester.pumpAndSettle();

    // Verifica che ci sia il testo della Home
    expect(find.text('Benvenuto in ComicVault!'), findsOneWidget);
  });
}
