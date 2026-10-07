import 'package:flutter/material.dart';

// Index screen for the LBRCE Flutter Lab project.
// Every experiment lives in its own file under lib/ and has its own main().
// To run one: open that file in Android Studio, then click the green Run
// arrow beside its main() (or right-click the file > Run '<file>').
void main() => runApp(const LabIndexApp());

class _Item {
  final String caption;
  final String file;
  const _Item(this.caption, this.file);
}

class LabIndexApp extends StatelessWidget {
  const LabIndexApp({super.key});

  static const List<_Item> items = [
    _Item('1(b) First Dart program', 'lib/exp01_basics.dart'),
    _Item('2(a) Exploring widgets', 'lib/exp02_exploring_widgets.dart'),
    _Item('2(b) Row, Column & Stack', 'lib/exp02_row_column_stack.dart'),
    _Item('3(a) LayoutBuilder', 'lib/exp03_layout_builder.dart'),
    _Item('3(b) MediaQuery & breakpoints', 'lib/exp03_media_query.dart'),
    _Item('4(a) Navigator.push and pop', 'lib/exp04_navigator_push_pop.dart'),
    _Item('4(b) Named routes', 'lib/exp04_named_routes.dart'),
    _Item('5(a) setState', 'lib/exp05_setstate_counter.dart'),
    _Item('5(b) Provider', 'lib/exp05_provider_counter.dart'),
    _Item('6(a) Reusable custom widget', 'lib/exp06_custom_widget.dart'),
    _Item('6(b) Themes & styles', 'lib/exp06_themes.dart'),
    _Item('7(a)&(b) Form with validation', 'lib/exp07_form_validation.dart'),
    _Item('8(a)&(b) ListView, add items, selection', 'lib/exp08_listview_selection.dart'),
    _Item('9(a)&(b) Fade and slide', 'lib/exp09_fade_slide.dart'),
    _Item('10(a)&(b) Fetch JSON, render list', 'lib/exp10_rest_api.dart'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Lab - Experiment Index')),
        body: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) => ListTile(
            leading: CircleAvatar(child: Text('${i + 1}')),
            title: Text(items[i].caption),
            subtitle: Text(items[i].file),
          ),
        ),
      ),
    );
  }
}
