// Imports the Flutter Driver API.
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  takeScreenshot(FlutterDriver driver, String path) async {
    final List<int> pixels = await driver.screenshot();
    final File file = new File(path);
    await file.writeAsBytes(pixels);
    print(path);
  }

  group('Slide App', () {
    final SerializableFinder pv = find.byValueKey('pageview');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      new Directory("screenshots").create();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('swipe right', () async {
      await driver.waitFor(pv);
      await driver.scroll(pv, -400, 0, Duration(milliseconds: 100));
      await driver.getText(find.text('Page2'));
      await takeScreenshot(driver, 'screenshots/slideapp-swiperight-page2.png');

      await driver.scroll(pv, -400, 0, Duration(milliseconds: 100));
      await driver.getText(find.text('Page3'));
      await takeScreenshot(driver, 'screenshots/slideapp-swiperight-page3.png');
    });

    test('swipe left', () async {
      await driver.waitFor(pv);
      await driver.scroll(pv, 400, 0, Duration(milliseconds: 500));
      await driver.getText(find.text('Page2'));
      await takeScreenshot(driver, 'screenshots/slideapp-swipeleft-page2.png');

      await driver.scroll(pv, 400, 0, Duration(milliseconds: 500));
      await driver.getText(find.text('Page1'));
      await takeScreenshot(driver, 'screenshots/slideapp-swipeleft-page1.png');
    });
  });

  group("Change Screen", () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Push Screen', () async {
      final SerializableFinder buttonTela = find.byValueKey('pagekey');

      await driver.waitFor(buttonTela);
      await takeScreenshot(driver, 'screenshots/changescreen-pushscreen-homePage.png');

      await driver.tap(buttonTela);
      await driver.getText(find.text("Nova Tela"));
      await takeScreenshot(driver, 'screenshots/changescreen-pushscreen-pushedScreen.png');
    });

    test('back to home screen', () async {
      final SerializableFinder buttonTela = find.byValueKey('telakey');

      await driver.waitFor(buttonTela);
      await takeScreenshot(driver, 'screenshots/changescreen-popscreen-PushedScreen.png');
      await driver.tap(buttonTela);
      await driver.getText(find.text("Page1"));
      await takeScreenshot(driver, 'screenshots/changescreen-popscreen-HomeScreen.png');
    });
  });
}
