import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/color.dart';

class Defaults {
  static const double spacing = 16.0;
  static const double radius = 4.0;
  static const double edge = 1.0;

  static const Color background = Colors.transparent;
  static const Color normal = Colors.black;
  static const Color active = Colors.blue;
}

class ListItem<T> extends StatelessWidget {
  final String title;
  final T? value;
  final VoidCallback? onTap;

  const ListItem(
    this.title, {
    super.key,
    this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Defaults.spacing),
          child: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class DropDownList<T> extends StatefulWidget {
  final List<ListItem<T>> listItems;
  final T? value;
  final ValueChanged<T?>? onChange;

  const DropDownList({
    super.key,
    required this.listItems,
    this.value,
    this.onChange,
  });

  @override
  _DropDownListState<T> createState() => _DropDownListState<T>();
}

class _DropDownListState<T> extends State<DropDownList<T>> {
  final GlobalKey _key = GlobalKey();
  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  ListItem? _selected;
  bool _isHovered = false;
  bool _isFocused = false;
  bool _isOverlayShown = false;
  OverlayEntry? _overlay;
  FocusScopeNode? _focusScopeNode;

  @override
  void initState() {
    super.initState();
    if (widget.listItems.isNotEmpty) {
      _selected = widget.value == null
          ? widget.listItems.first
          : widget.listItems
              .firstWhere((listItem) => listItem.value == widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _onTap,
        child: FocusableActionDetector(
          focusNode: _focusNode,
          mouseCursor: SystemMouseCursors.click,
          actions: {
            ActivateIntent: CallbackAction<Intent>(onInvoke: (_) => _onTap()),
          },
          onShowFocusHighlight: (isFocused) =>
              setState(() => _isFocused = isFocused),
          onShowHoverHighlight: (isHovered) =>
              setState(() => _isHovered = isHovered),
          child: Container(
            key: _key,
            width: sWidth * 0.3,
            padding: const EdgeInsets.all(Defaults.spacing),
            decoration: BoxDecoration(
              color: _isHovered || _isFocused || _isOverlayShown
                  ? ColorData.btn2BorderColor
                  : Colors.white12,
              border: Border.all(
                // color: _isHovered || _isFocused || _isOverlayShown
                //     ? Defaults.active
                //     : Defaults.normal,
                width: Defaults.edge,
              ),
              borderRadius: BorderRadius.circular(Defaults.radius),
            ),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: sWidth * 0.22,
                  child: Text(
                    _selected == null ? '' : _selected!.title,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _focusScopeNode?.dispose();
  }

  OverlayEntry _createOverlay() {
    _focusScopeNode = FocusScopeNode();
    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _removeOverlay,
        child: Stack(
          children: [
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              targetAnchor: Alignment.bottomRight,
              followerAnchor: Alignment.topRight,
              child: Material(
                color: Colors.transparent,
                child: FocusScope(
                  node: _focusScopeNode,
                  child: _createListItems(),
                  onKey: (node, event) {
                    if (event.logicalKey == LogicalKeyboardKey.escape) {
                      _removeOverlay();
                    }

                    return KeyEventResult.ignored;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _removeOverlay() {
    _overlay!.remove();
    _isOverlayShown = false;
    _focusScopeNode!.dispose();
    FocusScope.of(context).nextFocus();
  }

  Widget _createListItems() {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: Defaults.spacing / 2.0),
      decoration: BoxDecoration(
        color: _isHovered || _isFocused || _isOverlayShown
            ? Colors.green
            : Defaults.background,
        border: Border.all(
          color: Defaults.active,
          width: Defaults.edge,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(Defaults.radius),
        ),
      ),
      width: renderBox.size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.listItems
            .map((listItem) => ListItem(
                  listItem.title,
                  onTap: () => _onListItemTap(listItem),
                ))
            .toList(),
      ),
    );
  }

  void _onTap() {
    if (_isOverlayShown) {
      _removeOverlay();
    } else {
      _overlay = _createOverlay();
      Overlay.of(context).insert(_overlay!);
      _isOverlayShown = true;
      FocusScope.of(context).setFirstFocus(_focusScopeNode!);
    }
  }

  void _onListItemTap(ListItem listItem) {
    _removeOverlay();
    setState(() {
      _selected = listItem;
    });

    widget.onChange?.call(listItem.value);
  }
}
