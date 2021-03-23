import 'package:fluent_ui/fluent_ui.dart';

class Scaffold extends StatelessWidget {
  const Scaffold({
    Key? key,
    this.header,
    this.body,
    this.footer,
    this.backgroundColor,
    this.expandBody = true,
    this.left,
  }) : super(key: key);

  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final Widget? left;

  final Color? backgroundColor;

  /// Wheter the body expands. Set to false
  final bool expandBody;

  @override
  Widget build(BuildContext context) {
    debugCheckHasFluentTheme(context);
    final color = backgroundColor ??
        context.theme?.scaffoldBackgroundColor ??
        Colors.white;
    return AnimatedContainer(
      duration: context.theme!.mediumAnimationDuration ?? Duration.zero,
      curve: context.theme!.animationCurve ?? Curves.linear,
      color: color,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (this.left != null) left!,
        Expanded(
          child: Column(
            children: [
              if (header != null) header!,
              if (body != null) Expanded(child: body!),
              if (footer != null) footer!,
            ],
          ),
        ),
      ]),
    );
  }
}