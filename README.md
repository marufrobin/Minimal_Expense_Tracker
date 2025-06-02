# Minimal Expense Tracker a POC for Bar Chart and data base 

table of contents

- [📊 ExpanseChartScreen - Flutter Bar Chart POC](#-expansechartscreen---flutter-bar-chart-poc)

## 📊 ExpanseChartScreen - Flutter Bar Chart POC

This project demonstrates a simple **Bar Chart** using the [`fl_chart`](https://pub.dev/packages/fl_chart) package in Flutter. The chart visualizes dummy expense data over time in a stateless widget setup.

## 🔧 Features

* Uses `fl_chart` for rendering bar charts.
* Demonstrates use of custom `BarChartDataModel`.
* Fully responsive using `MediaQuery` for width.
* Clean and minimal example for integrating bar charts in your own app.

### 📸 Preview

> 📌 Add a screenshot or screen recording here if available.

### 📦 Dependencies

Make sure to add the `fl_chart` package to your `pubspec.yaml`:

```yaml
dependencies:
  fl_chart: ^0.64.0 # Check pub.dev for the latest version
```

### 🧱 Project Structure

```bash
lib/
├── screens/
│   └── expanse_chart_screen.dart
```

### 🧪 How It Works

#### `BarChartDataModel`

A simple data model used to pass X and Y axis values into the chart:

```dart
class BarChartDataModel {
  final int? x;
  final double? y;

  BarChartDataModel({this.x, this.y});
}
```

#### `ExpanseChartScreen`

This widget:

* Initializes a dummy list of `BarChartDataModel` items.
* Maps them into `BarChartGroupData` using `fl_chart`.
* Renders the chart inside a `SizedBox`.

```dart
final List<BarChartDataModel> data = [
  BarChartDataModel(x: 0, y: 10),
  BarChartDataModel(x: 1, y: 20),
  // ...
  BarChartDataModel(x: 9, y: 100),
];
```

### 🚀 Getting Started

1. Clone the repository or copy the widget into your project.
2. Add `fl_chart` to your `pubspec.yaml`.
3. Import the widget:

```dart
import 'screens/expanse_chart_screen.dart';
```

4. Use the widget in your app:

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Expense Chart")),
    body: Center(child: ExpanseChartScreen()),
  );
}
```

### 🧱 Widget Structure

```dart
ExpanseChartScreen()
```

* Displays a bar chart with 10 data points (example values: 10, 20, ..., 100).
* X-axis represents **days of the week** (Sun to Sat).
* Y-axis represents **expense amounts**.
* Customizable border colors based on current app theme.
* No grid lines for a clean, minimalist appearance.

---

### 🗂️ File: `expanse_chart_screen.dart`

#### Key Features:

* **Dynamic data mapping**:

  ```dart
  List<BarChartGroupData> _barChartDataBuilder(List<BarChartDataModel> data)
  ```

* **Custom X-axis labels**:

  ```dart
  String daysName(int days)
  ```

* **Minimal border rendering**:

  ```dart
  FlBorderData _borderDesign(ThemeData theme)
  ```

---

### 🧪 Example Use:

```dart
import 'path/to/expanse_chart_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weekly Expenses")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ExpanseChartScreen(),
      ),
    );
  }
}
```

---

### 📌 Customization Tips:

* Change chart data dynamically by injecting a list of `BarChartDataModel`.
* Theme-aware colors make it compatible with light/dark modes.
* Can extend to show monthly data or user interactions.

---

Let me know if you want me to include screenshots, dynamic chart data from BLoC, or localization support in the README!


### ✅ To Do (for future improvements)

* Add axis titles and labels.
* Customize bar colors based on values.
* Animate bars.
* Add dynamic data input.
* Support dark/light themes.

### 📄 License

This is a proof-of-concept. Feel free to use, modify, and improve!

