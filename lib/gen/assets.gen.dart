/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetImageGen {
  const $AssetImageGen();

  /// File path: asset/image/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('asset/image/splash_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [splashLogo];
}

class $AssetLanguageGen {
  const $AssetLanguageGen();

  /// File path: asset/language/en-US.json
  String get enUS => 'asset/language/en-US.json';

  /// File path: asset/language/tr-TR.json
  String get trTR => 'asset/language/tr-TR.json';

  /// List of all assets
  List<String> get values => [enUS, trTR];
}

class $AssetLottieGen {
  const $AssetLottieGen();

  /// File path: asset/lottie/splash_animation.json
  String get splashAnimation => 'asset/lottie/splash_animation.json';

  /// List of all assets
  List<String> get values => [splashAnimation];
}

class Assets {
  Assets._();

  static const $AssetImageGen image = $AssetImageGen();
  static const $AssetLanguageGen language = $AssetLanguageGen();
  static const $AssetLottieGen lottie = $AssetLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
