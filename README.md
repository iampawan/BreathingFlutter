# BreathingFlutter

[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/iampawan) [![Twitter](https://img.shields.io/twitter/url/https/github.com/iampawan/BreathingFlutter.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fiampawan%2FBreathingFlutterr)

A breathing appbar and widget library in Flutter.

The source code is **100% Dart**, and everything resides in the [/lib](https://github.com/iampawan/BreathingFlutter/tree/master/lib) folder.


### Show some :heart: and star the repo to support the project

[![GitHub stars](https://img.shields.io/github/stars/iampawan/BreathingFlutter.svg?style=social&label=Star)](https://github.com/iampawan/BreathingFlutter) [![GitHub forks](https://img.shields.io/github/forks/iampawan/BreathingFlutter.svg?style=social&label=Fork)](https://github.com/iampawan/BreathingFlutter/fork) [![GitHub watchers](https://img.shields.io/github/watchers/iampawan/BreathingFlutter.svg?style=social&label=Watch)](https://github.com/iampawan/BreathingFlutter) [![GitHub followers](https://img.shields.io/github/followers/iampawan.svg?style=social&label=Follow)](https://github.com/iampawan/BreathingFlutter)  
[![Twitter Follow](https://img.shields.io/twitter/follow/imthepk.svg?style=social)](https://twitter.com/imthepk)

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/Apache-2.0)

## YouTube Channel

[MTechViral](https://www.youtube.com/c/MTechViral)

## Facebook Group

[Let's Flutter](https://www.facebook.com/groups/425920117856409/)

<img height="500px"  src="https://thumbs.gfycat.com/LameFlickeringBison-size_restricted.gif"/>

## 💻 Installation
In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
  breathing_flutter: <latest_version>
```

## ❔ Usage

### Breathing AppBar

```dart
import 'package:breathing_flutter/breathing_flutter.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<BreathingAppBarState> _breathingAppBarKey =
      GlobalKey<BreathingAppBarState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BreathingAppBar(
        key: _breathingAppBarKey,
        title: Text("Breathing App Bar"),
        breathColors: [Colors.black, Colors.red, Colors.blue],
      ),
      );
    }
}

```

### Breathing Widget

```dart
import 'package:breathing_flutter/breathing_flutter.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<BreathingWidgetState> _breathingWidgetKey =
      GlobalKey<BreathingWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: BreathingWidget(
              key: _breathingWidgetKey,
              breathColors: [
                Colors.black,
                Colors.deepOrange,
                Colors.green,
                Colors.indigo
              ],
              child: Container(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Text(
                    "Breathing Widget",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
        ));
    }
}
```

## Stop Breathing
This is how you can stop breathing for an appbar and the widget. Also,
Specify Color in the parameter to fix the appbar or widget color.

BreathingAppBar 
```
 _breathingAppBarKey.currentState.stopBreath(Colors.teal);
      
```
BreathingWigdet

```
  _breathingWidgetKey.currentState.stopBreath(Colors.amber);

      
```

## Start Breathing
BreathingAppBar 
```
 _breathingAppBarKey.currentState.startBreath();
      
```
BreathingWigdet

```
  _breathingWidgetKey.currentState.startBreath();

      
```


## 💰 Donations

This project needs you! If you would like to support this project's further development, the creator of this project or the continuous maintenance of this project, feel free to donate. Your donation is highly appreciated (and I love food, coffee and beer). Thank you!

**PayPal**

* **[Donate $5](https://www.paypal.me/imthepk/5)**: Thank's for creating this project, here's a tea (or some juice) for you!
* **[Donate $10](https://www.paypal.me/imthepk/10)**: Wow, I am stunned. Let me take you to the movies!
* **[Donate $15](https://www.paypal.me/imthepk/15)**: I really appreciate your work, let's grab some lunch!
* **[Donate $25](https://www.paypal.me/imthepk/25)**: That's some awesome stuff you did right there, dinner is on me!
* **[Donate $50](https://www.paypal.me/imthepk/50)**: I really really want to support this project, great job!
* **[Donate $100](https://www.paypal.me/imthepk/100)**: You are the man! This project saved me hours (if not days) of struggle and hard work, simply awesome!
* **[Donate $2799](https://www.paypal.me/imthepk/2799)**: Go buddy, buy Macbook Pro for yourself!

Of course, you can also choose what you want to donate, all donations are awesome!

## 👨 Developed By

```
Pawan Kumar
```
GDE (Google Developer Expert) for Flutter. Passionate #Flutter, #Android Developer. #Entrepreneur #YouTuber

<a href="https://play.google.com/store/apps/dev?id=7703305844118303242&hl=en"><img src="https://github.com/aritraroy/social-icons/blob/master/play-store-icon.png?raw=true" width="60"></a> <a href="https://medium.com/@imthepk"><img src="https://github.com/aritraroy/social-icons/blob/master/medium-icon.png?raw=true" width="60"></a>
<a href="https://twitter.com/imthepk"><img src="https://github.com/aritraroy/social-icons/blob/master/twitter-icon.png?raw=true" width="60"></a>
<a href="https://linkedin.com/in/imthepk"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a>
<a href="https://facebook.com/imthepk"><img src="https://github.com/aritraroy/social-icons/blob/master/facebook-icon.png?raw=true" width="60"></a>
<a href="https://instagram.com/codepur_ka_superhero"><img src="https://github.com/aritraroy/social-icons/blob/master/instagram-icon.png?raw=true" width="60"></a>

# 👍 How to Contribute
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

# 📃 License

    Copyright (c) 2018 Pawan Kumar
    
    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).