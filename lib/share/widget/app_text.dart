import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/material.dart';


class AppText extends StatelessWidget {
  /// This filed defines the content of text widget.
  final String text;

  /// This filed defines the style of text widget.
  final TextStyle? style;

  /// This filed show start (*) for required
  final bool isRequired;

  /// This filed defines the type of text widget by an enum called[AppTextEnum]
  final AppTextEnum? type;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  ///
  /// It's rarely necessary to set this property. By default its value
  /// is inherited from the enclosing app with `Localizations.localeOf(context)`.
  ///
  /// See [RenderParagraph.locale] for more information.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// How visual overflow should be handled.
  ///
  /// If this is null [TextStyle.overflow] will be used, otherwise the value
  /// from the nearest [DefaultTextStyle] ancestor will be used.
  final TextOverflow? overflow;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  ///
  /// The value given to the constructor as textScaleFactor. If null, will
  /// use the [MediaQueryData.textScaleFactor] obtained from the ambient
  /// [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
  final double? textScaleFactor;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int? maxLines;

  /// {@template flutter.widgets.Text.semanticsLabel}
  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value instead
  /// of the actual text. This will overwrite any of the semantics labels applied
  /// directly to the [TextSpan]s.
  ///
  /// This is useful for replacing abbreviations or shorthands with the full
  /// text value:
  ///
  /// ```dart
  /// const Text(r'$$', semanticsLabel: 'Double dollars')
  /// ```
  /// {@endtemplate}
  final String? semanticsLabel;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro dart.ui.textHeightBehavior}
  final ui.TextHeightBehavior? textHeightBehavior;

  /// The color to use when painting the selection.
  ///
  /// This is ignored if [SelectionContainer.maybeOf] returns null
  /// in the [BuildContext] of the [Text] widget.
  ///
  /// If null, the ambient [DefaultSelectionStyle] is used (if any); failing
  /// that, the selection color defaults to [DefaultSelectionStyle.defaultColor]
  /// (semi-transparent grey).
  final Color? selectionColor;

  ///This field adds a currency string to the end of text if true.
  final String? currencyType;

  const AppText(
      this.text, {
        this.isRequired = false,
        this.type,
        this.style,
        super.key,
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.selectionColor,
        this.currencyType,
      });

  factory AppText.bodyLarge(
      final String text, {
        final bool isRequired = false,
        final TextStyle? style,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        isRequired: isRequired,
        style: style,
        textAlign: textAlign,
        type: AppTextEnum.bodyLarge,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.bodyMedium(
      final String text, {
        final bool isRequired = false,
        final TextStyle? style,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.bodyMedium,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.bodySmall(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.bodySmall,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.displayLarge(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.displayLarge,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.displayMedium(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.displayMedium,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.displaySmall(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.displaySmall,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.headlineLarge(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.headlineLarge,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.headlineMedium(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.headlineMedium,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.headlineSmall(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.headlineSmall,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.labelLarge(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        textAlign: textAlign,
        type: AppTextEnum.labelLarge,
        currencyType: currencyType,
        maxLines: maxLines,

        overflow: overflow,
      );

  factory AppText.labelMedium(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.labelMedium,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.labelSmall(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.labelSmall,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.titleSmall(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        textAlign: textAlign,
        type: AppTextEnum.titleSmall,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.titleMedium(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.titleMedium,
        textAlign: textAlign,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.titleLarge(
      final String text, {
        final TextStyle? style,
        final bool isRequired = false,
        final TextAlign? textAlign,
        final String? currencyType,
        final int? maxLines,
        final TextOverflow? overflow,
      }) =>
      AppText(
        text,
        style: style,
        isRequired: isRequired,
        type: AppTextEnum.titleLarge,
        textAlign: textAlign ?? TextAlign.center,
        currencyType: currencyType,
        maxLines: maxLines,
        overflow: overflow,
      );

  @override
  Widget build(final BuildContext context) {
    final TextStyle? finalStyle = style ??
        _getTextStyle(context) ??
        Theme.of(context).textTheme.bodyMedium;
    final child = Text(
      text,
      style: finalStyle,
      key: key,
      maxLines: maxLines,
      overflow: overflow,
      textDirection: textDirection,
      textAlign: textAlign,
    );

    return isRequired
        ? Row(
      children: [
        child,
        const SizedBox(
          width: 2,
        ),
        if (isRequired)
          Text(
            '*',
            style: finalStyle!.copyWith(color: Colors.red),
          ),
      ],
    )
        : child;
  }

  TextStyle? _getTextStyle(final BuildContext context) {
    switch (type ?? false) {
      case AppTextEnum.bodyLarge:
        return Theme.of(context).textTheme.bodyLarge!;
      case AppTextEnum.bodySmall:
        return Theme.of(context).textTheme.bodySmall!;
      case AppTextEnum.bodyMedium:
        return Theme.of(context).textTheme.bodyMedium!;
      case AppTextEnum.displayLarge:
        return Theme.of(context).textTheme.displayLarge!;
      case AppTextEnum.displayMedium:
        return Theme.of(context).textTheme.displayMedium!;
      case AppTextEnum.displaySmall:
        return Theme.of(context).textTheme.displaySmall!;
      case AppTextEnum.headlineLarge:
        return Theme.of(context).textTheme.headlineLarge!;
      case AppTextEnum.headlineMedium:
        return Theme.of(context).textTheme.headlineMedium!;
      case AppTextEnum.headlineSmall:
        return Theme.of(context).textTheme.headlineSmall!;
      case AppTextEnum.labelLarge:
        return Theme.of(context).textTheme.labelLarge!;
      case AppTextEnum.labelMedium:
        return Theme.of(context).textTheme.labelMedium!;
      case AppTextEnum.labelSmall:
        return Theme.of(context).textTheme.labelSmall!;
      case AppTextEnum.titleLarge:
        return Theme.of(context).textTheme.titleLarge!;
      case AppTextEnum.titleMedium:
        return Theme.of(context).textTheme.titleMedium!;
      default:
        return Theme.of(context).textTheme.titleSmall!;
    }
  }
}

enum AppTextEnum {
  bodyLarge,
  bodyMedium,
  bodySmall,
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  labelLarge,
  labelMedium,
  labelSmall,
  titleLarge,
  titleSmall,
  titleMedium,
}