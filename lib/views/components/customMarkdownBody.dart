import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

class CustomMarkdownBody extends MarkdownBody {
  CustomMarkdownBody({
    Key? key,
    required String data,
    bool selectable = false,
    MarkdownStyleSheet? styleSheet,
    MarkdownStyleSheetBaseTheme? styleSheetTheme,
    SyntaxHighlighter? syntaxHighlighter,
    MarkdownTapLinkCallback? onTapLink,
    VoidCallback? onTapText,
    String? imageDirectory,
    List<md.BlockSyntax>? blockSyntaxes,
    List<md.InlineSyntax>? inlineSyntaxes,
    md.ExtensionSet? extensionSet,
    MarkdownImageBuilder? imageBuilder,
    MarkdownCheckboxBuilder? checkboxBuilder,
    MarkdownBulletBuilder? bulletBuilder,
    Map<String, MarkdownElementBuilder> builders =
        const <String, MarkdownElementBuilder>{},
    MarkdownListItemCrossAxisAlignment listItemCrossAxisAlignment =
        MarkdownListItemCrossAxisAlignment.baseline,
    shrinkWrap = true,
    bool fitContent = true,
  }) : super(
          key: key,
          data: data,
          selectable: selectable,
          styleSheet: styleSheet,
          styleSheetTheme: styleSheetTheme,
          syntaxHighlighter: syntaxHighlighter,
          onTapLink: onTapLink,
          onTapText: onTapText,
          imageDirectory: imageDirectory,
          blockSyntaxes: blockSyntaxes,
          inlineSyntaxes: inlineSyntaxes,
          extensionSet: extensionSet,
          imageBuilder: imageBuilder,
          checkboxBuilder: checkboxBuilder,
          builders: builders,
          listItemCrossAxisAlignment: listItemCrossAxisAlignment,
          bulletBuilder: bulletBuilder,
          fitContent: fitContent,
        ) {
    styleSheet = styleSheet ??
        MarkdownStyleSheet(
          textAlign: WrapAlignment.spaceEvenly,
          p: TextStyle(
            height: 2,
          ),
        );

    onTapLink = onTapLink ??
        (String text, String? url, String title) {
          launch(url!);
        };
  }
}