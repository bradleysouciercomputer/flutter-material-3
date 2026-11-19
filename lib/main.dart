import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialLabApp());
}

const _seedColors = <Color>[
  Color(0xFF6750A4),
  Color(0xFF006A6A),
  Color(0xFF315DA8),
  Color(0xFF9A4522),
  Color(0xFF7A5260),
  Color(0xFF386A20),
];

class MaterialLabApp extends StatefulWidget {
  const MaterialLabApp({super.key});

  @override
  State<MaterialLabApp> createState() => _MaterialLabAppState();
}

class _MaterialLabAppState extends State<MaterialLabApp> {
  bool _darkMode = false;
  Color _seedColor = _seedColors.first;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Material Lab',
      debugShowCheckedModeBanner: false,
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.dark,
        ),
      ),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('en', 'US')],
      home: LabHomePage(
        darkMode: _darkMode,
        seedColor: _seedColor,
        onThemeModeChanged: (value) => setState(() => _darkMode = value),
        onSeedColorChanged: (value) => setState(() => _seedColor = value),
      ),
    );
  }
}

class LabCategory {
  const LabCategory(this.label, this.icon);

  final String label;
  final IconData icon;
}

const _categories = <LabCategory>[
  LabCategory('All components', Icons.widgets_outlined),
  LabCategory('Bottom sheets', Icons.vertical_align_bottom),
  LabCategory('Buttons', Icons.smart_button_outlined),
  LabCategory('Inputs', Icons.tune),
  LabCategory('Surfaces', Icons.dashboard_outlined),
  LabCategory('Feedback', Icons.notifications_none),
  LabCategory('Navigation', Icons.navigation_outlined),
  LabCategory('Foundations', Icons.palette_outlined),
];

class ComponentExample {
  const ComponentExample({
    required this.title,
    required this.category,
    required this.description,
    required this.docsUrl,
    required this.source,
    required this.builder,
  });

  final String title;
  final String category;
  final String description;
  final String docsUrl;
  final String source;
  final WidgetBuilder builder;
}

final _examples = <ComponentExample>[
  ComponentExample(
    title: 'Bottom sheets',
    category: 'Bottom sheets',
    description:
        'Explore modal and persistent sheets, drag handles, dismissal, elevation, and rounded corners.',
    docsUrl:
        'https://pub.dev/documentation/material_ui/latest/material_ui/BottomSheet-class.html',
    source: '''showModalBottomSheet<void>(
  context: context,
  showDragHandle: true,
  isScrollControlled: true,
  builder: (context) => const SheetContent(),
);

// Persistent alternative:
Scaffold.of(context).showBottomSheet(
  (context) => const SheetContent(),
);''',
    builder: (_) => const BottomSheetPlayground(),
  ),
  ComponentExample(
    title: 'Buttons',
    category: 'Buttons',
    description:
        'Compare filled, tonal, outlined, elevated, text, icon, and segmented button treatments.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''FilledButton(
  onPressed: () {},
  child: const Text('Continue'),
);

FilledButton.tonal(
  onPressed: () {},
  child: const Text('Secondary'),
);

OutlinedButton(
  onPressed: () {},
  child: const Text('Outlined'),
);''',
    builder: (_) => const ButtonsPlayground(),
  ),
  ComponentExample(
    title: 'Text fields',
    category: 'Inputs',
    description:
        'Try labels, helper text, leading icons, multiline input, and live text entry.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''TextField(
  decoration: InputDecoration(
    labelText: 'Display name',
    helperText: 'This appears on your profile',
    prefixIcon: Icon(Icons.person_outline),
    border: OutlineInputBorder(),
  ),
);''',
    builder: (_) => const TextFieldPlayground(),
  ),
  ComponentExample(
    title: 'Selection controls',
    category: 'Inputs',
    description:
        'Test Material switches, checkboxes, and list-tile selection patterns.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''Switch(
  value: enabled,
  onChanged: (value) => setState(() => enabled = value),
);

Checkbox(
  value: checked,
  onChanged: (value) => setState(() => checked = value ?? false),
);''',
    builder: (_) => const SelectionPlayground(),
  ),
  ComponentExample(
    title: 'Sliders',
    category: 'Inputs',
    description:
        'Adjust a continuous value and compare the active and inactive track states.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''Slider(
  value: volume,
  min: 0,
  max: 100,
  divisions: 10,
  label: volume.round().toString(),
  onChanged: (value) => setState(() => volume = value),
);''',
    builder: (_) => const SliderPlayground(),
  ),
  ComponentExample(
    title: 'Dropdown menus',
    category: 'Inputs',
    description:
        'Open a Material dropdown menu and change the current selection.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''DropdownMenu<String>(
  initialSelection: 'System',
  dropdownMenuEntries: const [
    DropdownMenuEntry(value: 'System', label: 'System'),
    DropdownMenuEntry(value: 'Light', label: 'Light'),
    DropdownMenuEntry(value: 'Dark', label: 'Dark'),
  ],
);''',
    builder: (_) => const DropdownPlayground(),
  ),
  ComponentExample(
    title: 'Cards & list tiles',
    category: 'Surfaces',
    description:
        'Preview filled, outlined, and elevated cards with common list tile layouts.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''Card(
  child: ListTile(
    leading: const Icon(Icons.folder_outlined),
    title: const Text('Project files'),
    subtitle: const Text('12 items'),
    trailing: const Icon(Icons.chevron_right),
  ),
);''',
    builder: (_) => const SurfacePlayground(),
  ),
  ComponentExample(
    title: 'Chips',
    category: 'Surfaces',
    description:
        'Try action, input, filter, and choice chip interaction states.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''FilterChip(
  label: const Text('Design'),
  selected: selected,
  onSelected: (value) => setState(() => selected = value),
);

ActionChip(
  label: const Text('Add filter'),
  onPressed: () {},
);''',
    builder: (_) => const ChipPlayground(),
  ),
  ComponentExample(
    title: 'Badges & progress',
    category: 'Feedback',
    description:
        'See notification badges, determinate progress, and an indeterminate loader.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''Badge.count(
  count: 3,
  child: const Icon(Icons.notifications_outlined),
);

const LinearProgressIndicator(value: 0.68);''',
    builder: (_) => const ProgressPlayground(),
  ),
  ComponentExample(
    title: 'Snack bars',
    category: 'Feedback',
    description:
        'Trigger a snackbar, test an action, and inspect its placement and duration.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: const Text('Changes saved'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  ),
);''',
    builder: (_) => const SnackBarPlayground(),
  ),
  ComponentExample(
    title: 'Dialogs',
    category: 'Feedback',
    description:
        'Open an alert dialog with cancel and confirm actions.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''showDialog<void>(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('Discard changes?'),
    content: const Text('Your edits will be lost.'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Discard'),
      ),
    ],
  ),
);''',
    builder: (_) => const DialogPlayground(),
  ),
  ComponentExample(
    title: 'Date & time pickers',
    category: 'Inputs',
    description:
        'Launch the native Material date and time picker routes.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''final date = await showDatePicker(
  context: context,
  firstDate: DateTime(2020),
  lastDate: DateTime(2100),
  initialDate: DateTime.now(),
);

final time = await showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
);''',
    builder: (_) => const DateTimePlayground(),
  ),
  ComponentExample(
    title: 'Tabs',
    category: 'Navigation',
    description:
        'Switch between tab destinations with a TabBar and TabBarView.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''DefaultTabController(
  length: 3,
  child: Column(
    children: [
      const TabBar(tabs: [
        Tab(text: 'Overview'),
        Tab(text: 'Activity'),
        Tab(text: 'Files'),
      ]),
      Expanded(
        child: TabBarView(
          children: [...],
        ),
      ),
    ],
  ),
);''',
    builder: (_) => const TabsPlayground(),
  ),
  ComponentExample(
    title: 'Navigation bar',
    category: 'Navigation',
    description:
        'Explore Material navigation destinations and selected states.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''NavigationBar(
  selectedIndex: selectedIndex,
  onDestinationSelected: (index) {
    setState(() => selectedIndex = index);
  },
  destinations: const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
  ],
);''',
    builder: (_) => const NavigationPlayground(),
  ),
  ComponentExample(
    title: 'Tooltips & menus',
    category: 'Navigation',
    description:
        'Inspect contextual tooltips and a popup menu with selectable actions.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''Tooltip(
  message: 'More options',
  child: IconButton(
    onPressed: () {},
    icon: const Icon(Icons.more_vert),
  ),
);

PopupMenuButton<String>(
  itemBuilder: (context) => const [
    PopupMenuItem(value: 'edit', child: Text('Edit')),
    PopupMenuItem(value: 'share', child: Text('Share')),
  ],
);''',
    builder: (_) => const TooltipMenuPlayground(),
  ),
  ComponentExample(
    title: 'Typography',
    category: 'Foundations',
    description:
        'Preview Material type roles directly from the active theme.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''final textTheme = Theme.of(context).textTheme;

Text('Display', style: textTheme.displayMedium);
Text('Headline', style: textTheme.headlineMedium);
Text('Body', style: textTheme.bodyLarge);''',
    builder: (_) => const TypographyPlayground(),
  ),
  ComponentExample(
    title: 'Color scheme',
    category: 'Foundations',
    description:
        'Inspect key Material color roles. Change the seed color in the app bar.',
    docsUrl: 'https://pub.dev/documentation/material_ui/latest/material_ui/',
    source: '''ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
  ),
);''',
    builder: (_) => const ColorSchemePlayground(),
  ),
];

class LabHomePage extends StatefulWidget {
  const LabHomePage({
    super.key,
    required this.darkMode,
    required this.seedColor,
    required this.onThemeModeChanged,
    required this.onSeedColorChanged,
  });

  final bool darkMode;
  final Color seedColor;
  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<Color> onSeedColorChanged;

  @override
  State<LabHomePage> createState() => _LabHomePageState();
}

class _LabHomePageState extends State<LabHomePage> {
  final _searchController = TextEditingController();
  String _query = '';
  int _selectedCategory = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ComponentExample> get _visibleExamples {
    final category = _categories[_selectedCategory].label;
    final query = _query.trim().toLowerCase();

    return _examples.where((example) {
      final matchesCategory =
          _selectedCategory == 0 || example.category == category;
      final matchesQuery = query.isEmpty ||
          example.title.toLowerCase().contains(query) ||
          example.description.toLowerCase().contains(query) ||
          example.category.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  void _selectCategory(int index) {
    setState(() => _selectedCategory = index);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width >= 940;
    final theme = Theme.of(context);

    return Scaffold(
      drawer: wide
          ? null
          : Drawer(
              child: SafeArea(
                child: NavigationDrawer(
                  selectedIndex: _selectedCategory,
                  onDestinationSelected: (index) {
                    _selectCategory(index);
                    Navigator.of(context).pop();
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 18, 16, 12),
                      child: Text(
                        'COMPONENT LIBRARY',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    for (var i = 0; i < _categories.length; i++)
                      NavigationDrawerDestination(
                        icon: Icon(_categories[i].icon),
                        label: Text(_categories[i].label),
                      ),
                  ],
                ),
              ),
            ),
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.widgets_outlined, color: theme.colorScheme.primary),
            const SizedBox(width: 10),
            const Flexible(
              child: Text(
                'Flutter Material Lab',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          if (width >= 940)
            SizedBox(
              width: 260,
              child: Center(
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => setState(() => _query = value),
                  decoration: InputDecoration(
                    hintText: 'Search components',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _query.isEmpty
                        ? null
                        : IconButton(
                            tooltip: 'Clear search',
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _query = '');
                            },
                            icon: const Icon(Icons.close),
                          ),
                    isDense: true,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          PopupMenuButton<Color>(
            tooltip: 'Change seed color',
            icon: const Icon(Icons.palette_outlined),
            onSelected: widget.onSeedColorChanged,
            itemBuilder: (context) => [
              for (final color in _seedColors)
                PopupMenuItem<Color>(
                  value: color,
                  child: Row(
                    children: [
                      CircleAvatar(radius: 10, backgroundColor: color),
                      const SizedBox(width: 12),
                      Text(_colorName(color)),
                    ],
                  ),
                ),
            ],
          ),
          IconButton(
            tooltip: widget.darkMode ? 'Use light theme' : 'Use dark theme',
            onPressed: () => widget.onThemeModeChanged(!widget.darkMode),
            icon: Icon(
              widget.darkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final showRail = constraints.maxWidth >= 940;
          return Row(
            children: [
              if (showRail) ...[
                NavigationRail(
                  selectedIndex: _selectedCategory,
                  onDestinationSelected: _selectCategory,
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    for (final category in _categories)
                      NavigationRailDestination(
                        icon: Icon(category.icon),
                        label: Text(category.label),
                      ),
                  ],
                ),
                const VerticalDivider(width: 1),
              ],
              Expanded(
                child: Column(
                  children: [
                    if (!showRail)
                      SizedBox(
                        height: 58,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: _categories.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 8),
                          itemBuilder: (context, index) => ChoiceChip(
                            label: Text(_categories[index].label),
                            selected: _selectedCategory == index,
                            onSelected: (_) => _selectCategory(index),
                          ),
                        ),
                      ),
                    Expanded(child: _buildExamples(showSearch: !showRail)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildExamples({required bool showSearch}) {
    final theme = Theme.of(context);
    final selectedLabel = _categories[_selectedCategory].label;
    final examples = _visibleExamples;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 48),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showSearch) ...[
                  TextField(
                    controller: _searchController,
                    onChanged: (value) => setState(() => _query = value),
                    decoration: InputDecoration(
                      hintText: 'Search components',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _query.isEmpty
                          ? null
                          : IconButton(
                              tooltip: 'Clear search',
                              onPressed: () {
                                _searchController.clear();
                                setState(() => _query = '');
                              },
                              icon: const Icon(Icons.close),
                            ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                Text(
                  _query.isEmpty ? selectedLabel : 'Search results',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  _query.isEmpty
                      ? 'Interactive examples built with Flutter’s official material_ui package.'
                      : 'Components matching “' + _query + '”.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 22),
                if (examples.isEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 36,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(height: 12),
                          Text('No components found',
                              style: theme.textTheme.titleMedium),
                          const SizedBox(height: 4),
                          Text(
                            'Try another search term or choose a different category.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  for (final example in examples)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: ComponentShowcase(example: example),
                    ),
                const SizedBox(height: 18),
                Center(
                  child: Text(
                    'Flutter Material Lab · material_ui',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String _colorName(Color color) {
  if (color == _seedColors[0]) return 'Violet';
  if (color == _seedColors[1]) return 'Teal';
  if (color == _seedColors[2]) return 'Blue';
  if (color == _seedColors[3]) return 'Terracotta';
  if (color == _seedColors[4]) return 'Rose';
  return 'Green';
}

class ComponentShowcase extends StatelessWidget {
  const ComponentShowcase({super.key, required this.example});

  final ComponentExample example;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 18, 14, 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(example.title, style: theme.textTheme.titleLarge),
                      const SizedBox(height: 4),
                      Text(
                        example.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Chip(
                  label: Text(example.category),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: theme.colorScheme.outlineVariant),
          Padding(
            padding: const EdgeInsets.all(22),
            child: example.builder(context),
          ),
          Divider(height: 1, color: theme.colorScheme.outlineVariant),
          ExpansionTile(
            leading: const Icon(Icons.code),
            title: const Text('View example code'),
            subtitle: const Text('Dart · material_ui'),
            children: [
              Container(
                width: double.infinity,
                color: theme.colorScheme.surfaceContainerLow,
                padding: const EdgeInsets.all(18),
                child: SelectableText(
                  example.source,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'monospace',
                    height: 1.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 4, 14, 12),
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: example.source),
                        );
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Code copied')),
                          );
                        }
                      },
                      icon: const Icon(Icons.copy_outlined),
                      label: const Text('Copy code'),
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: example.docsUrl),
                        );
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Documentation URL copied'),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.link),
                      label: const Text('Copy API link'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomSheetPlayground extends StatefulWidget {
  const BottomSheetPlayground({super.key});

  @override
  State<BottomSheetPlayground> createState() => _BottomSheetPlaygroundState();
}

class _BottomSheetPlaygroundState extends State<BottomSheetPlayground> {
  bool _showHandle = true;
  bool _enableDrag = true;
  bool _dismissible = true;
  double _cornerRadius = 28;
  double _elevation = 4;

  ShapeBorder _sheetShape() => RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(_cornerRadius),
        ),
      );

  Widget _sheetContents(BuildContext context) {
    return _SheetContents(
      onAction: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Action selected from the sheet')),
        );
      },
    );
  }

  void _openModal(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      isDismissible: _dismissible,
      enableDrag: _enableDrag,
      showDragHandle: _showHandle,
      backgroundColor: colors.surfaceContainerHigh,
      elevation: _elevation,
      shape: _sheetShape(),
      builder: _sheetContents,
    );
  }

  void _openPersistent(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Scaffold.of(context).showBottomSheet(
      _sheetContents,
      enableDrag: _enableDrag,
      showDragHandle: _showHandle,
      backgroundColor: colors.surfaceContainerHigh,
      elevation: _elevation,
      shape: _sheetShape(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Builder(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Configure the sheet',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Show drag handle'),
            value: _showHandle,
            onChanged: (value) => setState(() => _showHandle = value),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Enable drag gestures'),
            value: _enableDrag,
            onChanged: (value) => setState(() => _enableDrag = value),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Tap outside to dismiss'),
            value: _dismissible,
            onChanged: (value) => setState(() => _dismissible = value),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Expanded(child: Text('Top corner radius')),
              Text(_cornerRadius.round().toString() + ' px'),
            ],
          ),
          Slider(
            min: 0,
            max: 40,
            divisions: 8,
            value: _cornerRadius,
            onChanged: (value) => setState(() => _cornerRadius = value),
          ),
          Row(
            children: [
              const Expanded(child: Text('Elevation')),
              Text(_elevation.round().toString()),
            ],
          ),
          Slider(
            min: 0,
            max: 24,
            divisions: 12,
            value: _elevation,
            onChanged: (value) => setState(() => _elevation = value),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FilledButton.icon(
                onPressed: () => _openModal(context),
                icon: const Icon(Icons.vertical_align_top),
                label: const Text('Show modal sheet'),
              ),
              OutlinedButton.icon(
                onPressed: () => _openPersistent(context),
                icon: const Icon(Icons.vertical_align_bottom),
                label: const Text('Show persistent sheet'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'The persistent example stays attached to the page scaffold. Drag it down to close when dragging is enabled.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _SheetContents extends StatelessWidget {
  const _SheetContents({required this.onAction});

  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quick actions', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text(
              'This is a live Flutter Material bottom sheet.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 14),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.edit_outlined),
              title: Text('Edit details'),
              subtitle: Text('Update the selected item'),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.share_outlined),
              title: Text('Share'),
              subtitle: Text('Send this item to someone'),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.archive_outlined),
              title: Text('Archive'),
              subtitle: Text('Move it out of your main list'),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: onAction,
              child: const Text('Try sheet action'),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsPlayground extends StatefulWidget {
  const ButtonsPlayground({super.key});

  @override
  State<ButtonsPlayground> createState() => _ButtonsPlaygroundState();
}

class _ButtonsPlaygroundState extends State<ButtonsPlayground> {
  String _lastAction = 'Choose a button to test its callback.';
  String _segment = 'Day';

  void _tap(String label) => setState(() => _lastAction = label + ' pressed');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            FilledButton(
              onPressed: () => _tap('Filled'),
              child: const Text('Filled'),
            ),
            FilledButton.tonal(
              onPressed: () => _tap('Tonal'),
              child: const Text('Tonal'),
            ),
            ElevatedButton(
              onPressed: () => _tap('Elevated'),
              child: const Text('Elevated'),
            ),
            OutlinedButton(
              onPressed: () => _tap('Outlined'),
              child: const Text('Outlined'),
            ),
            TextButton(
              onPressed: () => _tap('Text'),
              child: const Text('Text'),
            ),
            IconButton.filled(
              tooltip: 'Favorite',
              onPressed: () => _tap('Favorite icon'),
              icon: const Icon(Icons.favorite),
            ),
          ],
        ),
        const SizedBox(height: 22),
        SegmentedButton<String>(
          segments: const [
            ButtonSegment(value: 'Day', label: Text('Day'), icon: Icon(Icons.sunny)),
            ButtonSegment(value: 'Week', label: Text('Week'), icon: Icon(Icons.view_week)),
            ButtonSegment(value: 'Month', label: Text('Month'), icon: Icon(Icons.calendar_month)),
          ],
          selected: {_segment},
          onSelectionChanged: (value) =>
              setState(() => _segment = value.first),
        ),
        const SizedBox(height: 14),
        Text(_lastAction),
        Text('Selected segment: ' + _segment),
      ],
    );
  }
}

class TextFieldPlayground extends StatefulWidget {
  const TextFieldPlayground({super.key});

  @override
  State<TextFieldPlayground> createState() => _TextFieldPlaygroundState();
}

class _TextFieldPlaygroundState extends State<TextFieldPlayground> {
  final _controller = TextEditingController(text: 'Material Design');
  bool _obscure = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          onChanged: (_) => setState(() {}),
          obscureText: _obscure,
          decoration: InputDecoration(
            labelText: 'Text field label',
            hintText: 'Type something here',
            helperText: 'Helper text explains what belongs here.',
            prefixIcon: const Icon(Icons.edit_outlined),
            suffixIcon: IconButton(
              tooltip: _obscure ? 'Show text' : 'Hide text',
              onPressed: () => setState(() => _obscure = !_obscure),
              icon: Icon(
                _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              ),
            ),
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          maxLines: 2,
          decoration: const InputDecoration(
            labelText: 'Multiline field',
            hintText: 'Add a longer description',
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        Text('Current value: ' + _controller.text),
        TextButton(
          onPressed: () => setState(() => _controller.clear()),
          child: const Text('Clear first field'),
        ),
      ],
    );
  }
}

class SelectionPlayground extends StatefulWidget {
  const SelectionPlayground({super.key});

  @override
  State<SelectionPlayground> createState() => _SelectionPlaygroundState();
}

class _SelectionPlaygroundState extends State<SelectionPlayground> {
  bool _checked = true;
  bool _notifications = false;
  bool _marketing = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Enable workspace sync'),
          subtitle: const Text('Keep this device up to date'),
          value: _checked,
          onChanged: (value) =>
              setState(() => _checked = value ?? false),
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Push notifications'),
          subtitle: const Text('Receive activity alerts'),
          value: _notifications,
          onChanged: (value) => setState(() => _notifications = value),
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Product updates'),
          value: _marketing,
          onChanged: (value) => setState(() => _marketing = value),
        ),
      ],
    );
  }
}

class SliderPlayground extends StatefulWidget {
  const SliderPlayground({super.key});

  @override
  State<SliderPlayground> createState() => _SliderPlaygroundState();
}

class _SliderPlaygroundState extends State<SliderPlayground> {
  double _value = 65;
  double _temperature = 22;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(child: Text('Volume')),
            Text(_value.round().toString() + '%'),
          ],
        ),
        Slider(
          value: _value,
          min: 0,
          max: 100,
          divisions: 10,
          label: _value.round().toString(),
          onChanged: (value) => setState(() => _value = value),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            const Expanded(child: Text('Temperature')),
            Text(_temperature.round().toString() + '°'),
          ],
        ),
        Slider(
          value: _temperature,
          min: 10,
          max: 35,
          divisions: 25,
          onChanged: (value) => setState(() => _temperature = value),
        ),
      ],
    );
  }
}

class DropdownPlayground extends StatefulWidget {
  const DropdownPlayground({super.key});

  @override
  State<DropdownPlayground> createState() => _DropdownPlaygroundState();
}

class _DropdownPlaygroundState extends State<DropdownPlayground> {
  String _selected = 'System';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownMenu<String>(
          initialSelection: _selected,
          label: const Text('Appearance'),
          leadingIcon: const Icon(Icons.brightness_6_outlined),
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: 'System', label: 'System'),
            DropdownMenuEntry(value: 'Light', label: 'Light'),
            DropdownMenuEntry(value: 'Dark', label: 'Dark'),
          ],
          onSelected: (value) {
            if (value != null) setState(() => _selected = value);
          },
        ),
        const SizedBox(height: 12),
        Text('Selected: ' + _selected),
      ],
    );
  }
}

class SurfacePlayground extends StatelessWidget {
  const SurfacePlayground({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Card(
          child: const ListTile(
            leading: CircleAvatar(child: Icon(Icons.folder_outlined)),
            title: Text('Project files'),
            subtitle: Text('12 items · Updated just now'),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          color: colors.surfaceContainerHighest,
          child: const ListTile(
            leading: Icon(Icons.cloud_done_outlined),
            title: Text('Cloud backup'),
            subtitle: Text('Your files are up to date'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        const SizedBox(height: 8),
        const Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.star_outline),
            title: Text('Elevated card'),
            subtitle: Text('A raised surface with a shadow'),
          ),
        ),
        ExpansionTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Expandable list tile'),
          subtitle: const Text('Tap to reveal more content'),
          children: const [
            ListTile(title: Text('Additional information')),
            ListTile(title: Text('More details')),
          ],
        ),
      ],
    );
  }
}

class ChipPlayground extends StatefulWidget {
  const ChipPlayground({super.key});

  @override
  State<ChipPlayground> createState() => _ChipPlaygroundState();
}

class _ChipPlaygroundState extends State<ChipPlayground> {
  bool _selected = true;
  bool _choice = false;
  bool _showInput = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Chip(
          avatar: Icon(Icons.tag, size: 18),
          label: Text('Basic chip'),
        ),
        InputChip(
          avatar: const Icon(Icons.person_outline, size: 18),
          label: const Text('Bradley'),
          selected: _showInput,
          onSelected: (value) => setState(() => _showInput = value),
          onDeleted: () => setState(() => _showInput = false),
        ),
        FilterChip(
          label: const Text('Design'),
          selected: _selected,
          onSelected: (value) => setState(() => _selected = value),
        ),
        ChoiceChip(
          label: const Text('Featured'),
          selected: _choice,
          onSelected: (value) => setState(() => _choice = value),
        ),
        ActionChip(
          avatar: const Icon(Icons.add, size: 18),
          label: const Text('Add filter'),
          onPressed: () => setState(() => _selected = !_selected),
        ),
      ],
    );
  }
}

class ProgressPlayground extends StatelessWidget {
  const ProgressPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Badge.count(
              count: 3,
              child: Icon(Icons.notifications_outlined,
                  size: 30, color: colors.primary),
            ),
            const SizedBox(width: 28),
            const Badge(
              label: Text('NEW'),
              child: Icon(Icons.mail_outline, size: 30),
            ),
            const SizedBox(width: 28),
            const CircularProgressIndicator(value: 0.72),
            const SizedBox(width: 18),
            const Text('72%'),
          ],
        ),
        const SizedBox(height: 24),
        const LinearProgressIndicator(value: 0.68),
        const SizedBox(height: 16),
        const LinearProgressIndicator(),
      ],
    );
  }
}

class SnackBarPlayground extends StatelessWidget {
  const SnackBarPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        FilledButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Your changes have been saved.')),
            );
          },
          child: const Text('Show snackbar'),
        ),
        OutlinedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('File moved to trash'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Move undone')),
                    );
                  },
                ),
              ),
            );
          },
          child: const Text('Snackbar with action'),
        ),
      ],
    );
  }
}

class DialogPlayground extends StatelessWidget {
  const DialogPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      icon: const Icon(Icons.open_in_new),
      label: const Text('Open alert dialog'),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            icon: const Icon(Icons.delete_outline),
            title: const Text('Delete this item?'),
            content: const Text(
              'This action cannot be undone. The item will be permanently removed.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Demo item deleted')),
                  );
                },
                child: const Text('Delete'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DateTimePlayground extends StatefulWidget {
  const DateTimePlayground({super.key});

  @override
  State<DateTimePlayground> createState() => _DateTimePlaygroundState();
}

class _DateTimePlaygroundState extends State<DateTimePlayground> {
  DateTime? _date;
  TimeOfDay? _time;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        FilledButton.tonalIcon(
          icon: const Icon(Icons.calendar_month_outlined),
          label: const Text('Choose date'),
          onPressed: () async {
            final selected = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
            );
            if (selected != null && mounted) {
              setState(() => _date = selected);
            }
          },
        ),
        OutlinedButton.icon(
          icon: const Icon(Icons.schedule),
          label: const Text('Choose time'),
          onPressed: () async {
            final selected = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (selected != null && mounted) {
              setState(() => _time = selected);
            }
          },
        ),
        Text(
          'Date: ' +
              (_date == null
                  ? 'Not selected'
                  : MaterialLocalizations.of(context).formatShortDate(_date!)),
        ),
        Text(
          'Time: ' +
              (_time == null
                  ? 'Not selected'
                  : _time!.format(context)),
        ),
      ],
    );
  }
}

class TabsPlayground extends StatelessWidget {
  const TabsPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.dashboard_outlined), text: 'Overview'),
              Tab(icon: Icon(Icons.timeline), text: 'Activity'),
              Tab(icon: Icon(Icons.folder_outlined), text: 'Files'),
            ],
          ),
          SizedBox(
            height: 112,
            child: TabBarView(
              children: [
                Center(child: Text('Overview content', style: TextStyle(color: colors.primary))),
                const Center(child: Text('Recent activity appears here')),
                const Center(child: Text('Your files appear here')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationPlayground extends StatefulWidget {
  const NavigationPlayground({super.key});

  @override
  State<NavigationPlayground> createState() => _NavigationPlaygroundState();
}

class _NavigationPlaygroundState extends State<NavigationPlayground> {
  int _index = 0;

  static const _labels = ['Home', 'Search', 'Saved'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: NavigationBar(
            selectedIndex: _index,
            onDestinationSelected: (value) => setState(() => _index = value),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.bookmark),
                label: 'Saved',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text('Selected destination: ' + _labels[_index]),
      ],
    );
  }
}

class TooltipMenuPlayground extends StatelessWidget {
  const TooltipMenuPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Tooltip(
          message: 'This is a Material tooltip',
          child: IconButton.filledTonal(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tooltip button pressed')),
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
        ),
        const SizedBox(width: 12),
        PopupMenuButton<String>(
          tooltip: 'Open menu',
          onSelected: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(value + ' selected')),
            );
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'Edit', child: Text('Edit')),
            PopupMenuItem(value: 'Duplicate', child: Text('Duplicate')),
            PopupMenuItem(value: 'Share', child: Text('Share')),
          ],
          child: const Chip(
            avatar: Icon(Icons.more_horiz),
            label: Text('More options'),
          ),
        ),
      ],
    );
  }
}

class TypographyPlayground extends StatelessWidget {
  const TypographyPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display large', style: text.displaySmall),
        const SizedBox(height: 8),
        Text('Headline medium', style: text.headlineMedium),
        const SizedBox(height: 8),
        Text('Title large', style: text.titleLarge),
        const SizedBox(height: 8),
        Text('Body large — Material uses a type scale to create hierarchy.',
            style: text.bodyLarge),
        const SizedBox(height: 8),
        Text('Label medium · supporting metadata', style: text.labelMedium),
      ],
    );
  }
}

class ColorSchemePlayground extends StatelessWidget {
  const ColorSchemePlayground({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final swatches = <MapEntry<String, Color>>[
      MapEntry('Primary', colors.primary),
      MapEntry('On primary', colors.onPrimary),
      MapEntry('Secondary', colors.secondary),
      MapEntry('Tertiary', colors.tertiary),
      MapEntry('Surface', colors.surface),
      MapEntry('Surface container', colors.surfaceContainerHigh),
      MapEntry('Error', colors.error),
      MapEntry('Outline', colors.outline),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        for (final entry in swatches)
          SizedBox(
            width: 132,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: entry.value,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: colors.outlineVariant),
                  ),
                ),
                const SizedBox(height: 6),
                Text(entry.key, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ),
      ],
    );
  }
}
