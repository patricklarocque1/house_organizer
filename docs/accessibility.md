# Accessibility (WCAG 2.2 AA)

This app aims to meet WCAG 2.2 AA through:

- Color and contrast: Use Material color scheme with contrast-conscious colors; ensure text contrasts 4.5:1 minimum.
- Text resizing: Supports system text scaling without layout breakage.
- Touch target size: Primary actions use minimum 48x48 logical pixels.
- Keyboard and switch access: Focusable interactive elements and visible focus indicators.
- Labels and semantics: All icon-only controls have labels for screen readers.
- Error prevention and messages: Form validation with descriptive errors.
- Motion and timing: No time limits or motion-only information for critical content.

Implemented examples:
- `list_item_card.dart`: Semantics on checkbox and action menu items.
- `add_item_dialog.dart`: Labeled controls, min target size for primary action, semantic labels.
- `notification_settings_screen.dart`: Semantic labels for time pickers and switches.
- `supervisor_dashboard_screen.dart`: Overview cards expose semantic labels per stat.

Testing:
- Widget tests verify presence of semantics and labels.
- Manual checks with TalkBack/VoiceOver and large font settings.

Future improvements:
- App-wide focus traversal policies.
- Theming audit with automated contrast checks.

