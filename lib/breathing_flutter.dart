library breathing_flutter;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BreathingWidget extends StatefulWidget {
  final Widget child;

  final List<Color> breathColors;

  const BreathingWidget(
      {Key key, @required this.breathColors, @required this.child})
      : super(key: key);

  @override
  BreathingWidgetState createState() {
    return new BreathingWidgetState();
  }
}

class BreathingWidgetState extends State<BreathingWidget>
    with TickerProviderStateMixin {
  AnimationController breathColorController;
  Animation<int> breathColorAnimation;
  Animation<double> breathOpacityAnimation;
  List<Color> breathColors;

  @override
  void initState() {
    super.initState();
    breathColors = widget.breathColors;
    breathColorController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 7000))
          ..repeat();

    setColorAnimation();
    setOpacityAnimation(0.3);
  }

  @override
  void dispose() {
    breathColorController?.dispose();
    super.dispose();
  }

  void setOpacityAnimation(double begin) {
    breathOpacityAnimation = Tween<double>(
      begin: begin,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: breathColorController,
      curve: Curves.linear,
    ));
  }

  void setColorAnimation() {
    breathColorAnimation = IntTween(
      begin: 0,
      end: breathColors.length - 1,
    ).animate(breathColorController);
  }

  stopBreath(var fixedColor) {
    setState(() {
      breathColors = [fixedColor];
      setColorAnimation();
      setOpacityAnimation(1.0);
    });
    breathColorController.stop();
  }

  void startBreath() {
    setState(() {
      breathColors = widget.breathColors;
      setColorAnimation();
      setOpacityAnimation(0.3);
    });
    breathColorController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: breathColorAnimation,
        builder: (context, child) => FadeTransition(
              opacity: breathOpacityAnimation,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: breathColors[breathColorAnimation.value],
                ),
                child: widget.child,
              ),
            ));
  }
}

const double _kLeadingWidth =
    kToolbarHeight; // So the leading button is square.

class BreathingAppBar extends StatefulWidget implements PreferredSizeWidget {
  BreathingAppBar({
    Key key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation = 4.0,
    this.brightness,
    this.iconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    @required this.breathColors,
  })  : assert(automaticallyImplyLeading != null),
        assert(elevation != null),
        assert(primary != null),
        assert(titleSpacing != null),
        assert(toolbarOpacity != null),
        assert(bottomOpacity != null),
        preferredSize = new Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  final List<Color> breathColors;
  final Widget leading;

  final bool automaticallyImplyLeading;

  final Widget title;

  final List<Widget> actions;

  /// This widget is stacked behind the toolbar and the tabbar. It's height will
  /// be the same as the app bar's overall height.
  ///
  /// A flexible space isn't actually flexible unless the [AppBar]'s container
  /// changes the [AppBar]'s size. A [SliverAppBar] in a [CustomScrollView]
  /// changes the [AppBar]'s height when scrolled.
  ///
  /// Typically a [FlexibleSpaceBar]. See [FlexibleSpaceBar] for details.
  final Widget flexibleSpace;

  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  ///
  /// See also:
  ///
  ///  * [PreferredSize], which can be used to give an arbitrary widget a preferred size.
  final PreferredSizeWidget bottom;

  /// The z-coordinate at which to place this app bar. This controls the size of
  /// the shadow below the app bar.
  ///
  /// Defaults to 4, the appropriate elevation for app bars.
  final double elevation;

  /// The color to use for the app bar's material. Typically this should be set
  /// along with [brightness], [iconTheme], [textTheme].
  ///

  /// The brightness of the app bar's material. Typically this is set along
  /// with [backgroundColor], [iconTheme], [textTheme].
  ///
  /// Defaults to [ThemeData.primaryColorBrightness].
  final Brightness brightness;

  /// The color, opacity, and size to use for app bar icons. Typically this
  /// is set along with [backgroundColor], [brightness], [textTheme].
  ///
  /// Defaults to [ThemeData.primaryIconTheme].
  final IconThemeData iconTheme;

  /// The typographic styles to use for text in the app bar. Typically this is
  /// set along with [brightness] [backgroundColor], [iconTheme].
  ///
  /// Defaults to [ThemeData.primaryTextTheme].
  final TextTheme textTheme;

  /// Whether this app bar is being displayed at the top of the screen.
  ///
  /// If true, the appbar's toolbar elements and [bottom] widget will be
  /// padded on top by the height of the system status bar. The layout
  /// of the [flexibleSpace] is not affected by the [primary] property.
  final bool primary;

  /// Whether the title should be centered.
  ///
  /// Defaults to being adapted to the current [TargetPlatform].
  final bool centerTitle;

  /// The spacing around [title] content on the horizontal axis. This spacing is
  /// applied even if there is no [leading] content or [actions]. If you want
  /// [title] to take all the space available, set this value to 0.0.
  ///
  /// Defaults to [NavigationToolbar.kMiddleSpacing].
  final double titleSpacing;

  /// How opaque the toolbar part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  ///
  /// Typically, this value is not changed from its default value (1.0). It is
  /// used by [SliverAppBar] to animate the opacity of the toolbar when the app
  /// bar is scrolled.
  final double toolbarOpacity;

  /// How opaque the bottom part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  ///
  /// Typically, this value is not changed from its default value (1.0). It is
  /// used by [SliverAppBar] to animate the opacity of the toolbar when the app
  /// bar is scrolled.
  final double bottomOpacity;

  /// A size whose height is the sum of [kToolbarHeight] and the [bottom] widget's
  /// preferred height.
  ///
  /// [Scaffold] uses this this size to set its app bar's height.
  @override
  final Size preferredSize;

  bool _getEffectiveCenterTitle(ThemeData themeData) {
    if (centerTitle != null) return centerTitle;
    assert(themeData.platform != null);
    switch (themeData.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return false;
      case TargetPlatform.iOS:
        return actions == null || actions.length < 2;
    }
    return null;
  }

  @override
  BreathingAppBarState createState() => new BreathingAppBarState();
}

class BreathingAppBarState extends State<BreathingAppBar>
    with TickerProviderStateMixin {
  List<Color> breathColors;

  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  void _handleDrawerButtonEnd() {
    Scaffold.of(context).openEndDrawer();
  }

  AnimationController breathColorController;
  Animation<int> breathColorAnimation;
  Animation<double> breathOpacityAnimation;

  @override
  void initState() {
    super.initState();
    breathColors = widget.breathColors;
    breathColorController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 7000))
          ..repeat();

    setColorAnimation();
    setOpacityAnimation(0.3);
  }

  @override
  void dispose() {
    breathColorController?.dispose();
    super.dispose();
  }

  void setOpacityAnimation(double begin) {
    breathOpacityAnimation = Tween<double>(
      begin: begin,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: breathColorController,
      curve: Curves.linear,
    ));
  }

  void setColorAnimation() {
    breathColorAnimation = IntTween(
      begin: 0,
      end: breathColors.length - 1,
    ).animate(breathColorController);
  }

  stopBreath(var fixedColor) {
    setState(() {
      breathColors = [fixedColor];
      setColorAnimation();
      setOpacityAnimation(1.0);
    });
    breathColorController.stop();
  }

  void startBreath() {
    setState(() {
      breathColors = widget.breathColors;
      setColorAnimation();
      setOpacityAnimation(0.3);
    });
    breathColorController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    final ThemeData themeData = Theme.of(context);
    final ScaffoldState scaffold = Scaffold.of(context, nullOk: true);
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);

    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    IconThemeData appBarIconTheme =
        widget.iconTheme ?? themeData.primaryIconTheme;
    TextStyle centerStyle =
        widget.textTheme?.title ?? themeData.primaryTextTheme.title;
    TextStyle sideStyle =
        widget.textTheme?.body1 ?? themeData.primaryTextTheme.body1;

    if (widget.toolbarOpacity != 1.0) {
      final double opacity =
          const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)
              .transform(widget.toolbarOpacity);
      if (centerStyle?.color != null)
        centerStyle =
            centerStyle.copyWith(color: centerStyle.color.withOpacity(opacity));
      if (sideStyle?.color != null)
        sideStyle =
            sideStyle.copyWith(color: sideStyle.color.withOpacity(opacity));
      appBarIconTheme = appBarIconTheme.copyWith(
          opacity: opacity * (appBarIconTheme.opacity ?? 1.0));
    }

    Widget leading = widget.leading;
    if (leading == null && widget.automaticallyImplyLeading) {
      if (hasDrawer) {
        leading = new IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _handleDrawerButton,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      } else {
        if (canPop)
          leading = useCloseButton ? const CloseButton() : const BackButton();
      }
    }
    if (leading != null) {
      leading = new ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: _kLeadingWidth),
        child: leading,
      );
    }

    Widget title = widget.title;
    if (title != null) {
      bool namesRoute;
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          namesRoute = true;
          break;
        case TargetPlatform.iOS:
          break;
      }
      title = new DefaultTextStyle(
        style: centerStyle,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        child: new Semantics(
          namesRoute: namesRoute,
          child: title,
          header: true,
        ),
      );
    }

    Widget actions;
    if (widget.actions != null && widget.actions.isNotEmpty) {
      actions = new Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.actions,
      );
    } else if (hasEndDrawer) {
      actions = new IconButton(
        icon: const Icon(Icons.menu),
        onPressed: _handleDrawerButtonEnd,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }

    final Widget toolbar = new NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: widget._getEffectiveCenterTitle(themeData),
      middleSpacing: widget.titleSpacing,
    );

    // If the toolbar is allocated less than kToolbarHeight make it
    // appear to scroll upwards within its shrinking container.
    Widget appBar = new ClipRect(
      child: new CustomSingleChildLayout(
        delegate: const _ToolbarContainerLayout(),
        child: IconTheme.merge(
          data: appBarIconTheme,
          child: new DefaultTextStyle(
            style: sideStyle,
            child: toolbar,
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: kToolbarHeight),
              child: appBar,
            ),
          ),
          widget.bottomOpacity == 1.0
              ? widget.bottom
              : new Opacity(
                  opacity:
                      const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)
                          .transform(widget.bottomOpacity),
                  child: widget.bottom,
                ),
        ],
      );
    }

    // The padding applies to the toolbar and tabbar, not the flexible space.
    if (widget.primary) {
      appBar = new SafeArea(
        top: true,
        child: appBar,
      );
    }

    appBar = new Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    if (widget.flexibleSpace != null) {
      appBar = new Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          widget.flexibleSpace,
          appBar,
        ],
      );
    }
    final Brightness brightness =
        widget.brightness ?? themeData.primaryColorBrightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return new Semantics(
      container: true,
      explicitChildNodes: true,
      child: new AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: AnimatedBuilder(
            animation: breathOpacityAnimation,
            builder: (context, child) => FadeTransition(
                  opacity: breathOpacityAnimation,
                  child: new Material(
                    color: breathColors[breathColorAnimation.value],
                    elevation: widget.elevation,
                    child: appBar,
                  ),
                )),
      ),
    );
  }
}

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout();

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: kToolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return new Size(constraints.maxWidth, kToolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return new Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) => false;
}
