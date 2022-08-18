import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stocks/widgets/email_and_password_form.dart';

void main() {
  testWidgets(
    "[NG]All blank",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAndPassworkForm(
              submitButtonText: "テスト",
              onComplet: (email, password) {},
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.tap(find.text("テスト"));
      await tester.pump();
      expect(find.text("メールアドレスを入力してください。"), findsOneWidget);
      expect(find.text("パスワードを入力してください。"), findsOneWidget);
    },
  );

  testWidgets(
    "[NG]Email address blank",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAndPassworkForm(
              submitButtonText: "テスト",
              onComplet: (email, password) {},
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.enterText(find.widgetWithText(TextFormField, "パスワード"), "123456");
      await tester.tap(find.text("テスト"));
      await tester.pump();
      expect(find.text("メールアドレスを入力してください。"), findsOneWidget);
    },
  );

    testWidgets(
    "[NG]Password blank",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAndPassworkForm(
              submitButtonText: "テスト",
              onComplet: (email, password) {},
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.enterText(find.widgetWithText(TextFormField, "メールアドレス"), "abc@efg.hi");
      await tester.tap(find.text("テスト"));
      await tester.pump();
      expect(find.text("パスワードを入力してください。"), findsOneWidget);
    },
  );

  testWidgets(
    "[NG]Incorrect email address",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAndPassworkForm(
              submitButtonText: "テスト",
              onComplet: (email, password) {},
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.enterText(find.widgetWithText(TextFormField, "メールアドレス"), "abc@defg");
      await tester.enterText(find.widgetWithText(TextFormField, "パスワード"), "123456");
      await tester.tap(find.text("テスト"));
      await tester.pump();
      expect(find.text("メールアドレスを入力してください。"), findsOneWidget);
    },
  );

  testWidgets(
    "[NG]Short password",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAndPassworkForm(
              submitButtonText: "テスト",
              onComplet: (email, password) {},
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.enterText(find.widgetWithText(TextFormField, "メールアドレス"), "abc@def.gh");
      await tester.enterText(find.widgetWithText(TextFormField, "パスワード"), "1234");
      await tester.tap(find.text("テスト"));
      await tester.pump();
      expect(find.text("パスワードは6文字以上にする必要があります。"), findsOneWidget);
    },
  );

  testWidgets(
    "[OK]",
    (WidgetTester tester) async {
      const email = "abc@def.gh";
      const password = "123456";
      var res = "";
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAndPassworkForm(
              submitButtonText: "テスト",
              onComplet: (email, password) {
                res = "$email,$password";
              },
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.enterText(find.widgetWithText(TextFormField, "メールアドレス"), email);
      await tester.enterText(find.widgetWithText(TextFormField, "パスワード"), password);
      await tester.tap(find.text("テスト"));
      await tester.pump();
      expect(res, "$email,$password");
    },
  );
}
