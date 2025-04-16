# Good Thought Flutter App

A simple Flutter application that displays motivational thoughts in Gujarati. The app checks internet connectivity using `connectivity_plus` and shows a list of inspiring thoughts when online, or an error image when offline.

## Features

- 🌍 **Internet Connectivity Check**: Detects if the device is online (WiFi/Mobile Data) or offline.
- 📝 **Motivational Thought List**: Displays an inspiring list of thoughts in Gujarati.
- 🎨 **Beautiful UI**: Uses Material Design with a blue-themed UI.
- 🔄 **Refresh Button**: Allows users to manually refresh the connectivity status.

## Screenshots

<div>
    <img src= "https://github.com/user-attachments/assets/1d30308a-0327-4615-a277-3a8a49c44d71"  height =500px>
    <img src= "https://github.com/user-attachments/assets/a0e78b6a-b405-4016-b249-252ba4faee1b"  height =500px> 


  
https://github.com/user-attachments/assets/6f25a08c-450d-4f05-aa3f-d0d1a5bdf42d
  
  </div>




## Browser App
## Dependencies

- [`flutter`](https://flutter.dev/) - The Flutter SDK
- [`connectivity_plus`](https://pub.dev/packages/connectivity_plus) - To check network connectivity



## In App Web View

This project demonstrates how to use the `flutter_inappwebview` package to embed and interact with web content in a Flutter application.

## Features
- Load web pages within your app
- JavaScript execution and communication
- Load local HTML files
- Custom headers and post requests
- WebView events handling
- Navigation controls

## Installation
Add the `flutter_inappwebview` package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_inappwebview: ^6.0.0
```

Then, run:
```sh
flutter pub get
```

## Usage

### Basic WebView Implementation
```dart
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  InAppWebViewController? webViewController;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InAppWebView Example')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://flutter.dev")),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
      ),
    );
  }
}
```

## Permissions
For Android, add the following permissions to your `AndroidManifest.xml` file:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
```

For iOS, add these keys to your `Info.plist` file:
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

## Additional Features
- Load HTML strings using `initialData`.
- Execute JavaScript using `evaluateJavascript`.
- Listen for web page navigation events.
- Handle custom headers and post requests.

# Screenshorts
<div>
  <img src="https://github.com/user-attachments/assets/154d600b-b5d5-4ec1-9df0-a4b6d60b7ee5"height=500px>
   <img src="https://github.com/user-attachments/assets/98181fcb-2d10-4038-9da0-54afb677e74d"height=500px>
    <img src="https://github.com/user-attachments/assets/520911dd-45cb-4029-899e-2837a703db8b"height=500px>
     <img src="https://github.com/user-attachments/assets/3c1a4310-9c9c-452f-9dc8-cd52925ed7ae"height=500px>
      <img src="https://github.com/user-attachments/assets/c2154de7-8a7f-427d-bb2e-e64efc2a9237"height=500px>
       <img src="https://github.com/user-attachments/assets/3f619c38-72b1-4eed-be9e-5c0695b6d3a7"height=500px>
</div>



https://github.com/user-attachments/assets/df12494b-8ce9-4259-9289-b2a64dd9530a

