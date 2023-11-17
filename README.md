# any_of

A Flutter package that provides utility classes for working with algebraic data types (ADTs) known as "one-of" types. These types allow you to represent a value that can be one of several possible options.

[![Pub Version](https://img.shields.io/pub/v/package_name.svg)](https://pub.dev/packages/package_name)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/your_username/package_name/blob/main/LICENSE)

## Overview

The `any_of` package simplifies working with one-of types in your Flutter applications. It provides the following classes:

- `Doublet`: Represents a pair of values where one of the values is selected.
- `Triplet`: Represents a triplet of values where one of the values is selected.
- `Quartet`: ---
- ... Up to `Nonet`

These classes provide convenient methods for mapping, handling different cases, and ensuring the presence of a value.

## Installation

To use this package, add `any_of` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  any_of: <latest>
```

# Usage

## Importing the package

``` yaml
import 'package:any_of/any_of.dart';
```

## Doublet Usage

A Doublet represents a pair of values where one value is selected. Here's an example of how to create and work with a Doublet:

``` dart

class TestDoubletClass extends Doublet<String, NotFound> {
  TestDoubletClass.success(super.value) : super.first();
  TestDoubletClass.notFound(super.value) : super.second();
}

// or

class TestDoubletClass extends Doublet<String, NotFound> {
  TestDoubletClass.success(String value) : super.first(value);
  TestDoubletClass.notFound(NotFound value) : super.second(value);
}

// or

class TestDoubletClass extends Doublet<String, NotFound> {
  TestDoubletClass.success() : super.first('Default String');
  TestDoubletClass.notFound(NotFound value) : super.second(value);
}

void main() {
  var response = TestDoubletClass.success('Success');

  if (response.isFirst) {
    print(response.first);  // Output: 'Success'
  } else if (response.isSecond) {
    print(response.second); // Is not executed
  }
}
```

For more detailed examples and usage instructions, please refer to the API Reference section.

# API Reference

## `Doublet` Class
A class that represents a pair of values where one of the values is selected.

### Constructors
- `Doublet.first(T0 value)`: Constructs a Doublet instance with the first value selected.
- `Doublet.second(T1 value)`: Constructs a Doublet instance with the second value selected.

### Properties
- `isFirst`: Returns true if the first value is selected, otherwise false.
- `isSecond`: Returns true if the second value is selected, otherwise false.
- `first`: Returns the first value. Throws a TypeError if the first value is not selected.
- `second`: Returns the second value. Throws a TypeError if the second value is not selected.
- `props`: A list of the first and second values.


### Methods
- `map<R>({required R Function(T0) first, required R Function(T1) second})`: Applies a mapping function to the selected value and returns the result. Throws an Exception if no value is selected.
- `on<R>({required void Function(T0) first, required void Function(T1) second})`: Executes a callback function based on the selected value. Throws an Exception if no value is selected.
- `ifType<R>({required void Function(R) callback})`: Executes a callback function if the selected value matches the specified type. Does nothing if no value is selected or if the selected value does not match the type.

## `Triplet` class

The same Constructors, Properties and Methods on `Doublet` are applied to `Triplet`, but with an extra value. This is equivalent up until `Nonet`.

The classes are:

- Doublet
- Triplet
- Quartet
- Quintet
- Sextet
- Septet
- Octet
- Nonet

# Contributing
Contributions are welcome! If you encounter any issues or have suggestions for improvements, please create an issue on the GitHub repository. Pull requests are also encouraged.

Before contributing, please review the contribution guidelines and ensure adherence to the code of conduct.

# Changelog
See the CHANGELOG for a complete list of changes and releases in the package.

# License
MIT