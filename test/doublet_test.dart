import 'package:any_of/any_of.dart';
import 'package:test/test.dart';

void main() {
  group('Returns', () {
    test('String', () {
      var response = TestDoubletClass.success('Success');

      expect(response.first, isA<String>());
      expect(response.first, 'Success');
      expect(() => response.second, throwsA(isA<TypeError>()));
    });

    test('NotFound', () {
      var response = TestDoubletClass.notFound(NotFound('Not found'));

      expect(() => response.first, throwsA(isA<TypeError>()));
      expect(response.second, isA<NotFound>());
      expect(response.second.message, 'Not found');
    });
  });

  group('Equality', () {
    test('Instances with same values are equal', () {
      var response1 = TestDoubletClass.success('Success');
      var response2 = TestDoubletClass.success('Success');

      expect(response1, response2);
    });

    test('Instances with different values are not equal', () {
      var response1 = TestDoubletClass.success('Success');
      var response2 = TestDoubletClass.success('Different');

      expect(response1, isNot(response2));
    });

    test('Instances with different types are not equal', () {
      var response1 = TestDoubletClass.success('Success');
      var response2 = TestDoubletClass.notFound(NotFound('Not found'));

      expect(response1, isNot(response2));
    });
  });

  group('map', () {
    test('Executes first mapping function when isFirst is true', () {
      var instance = TestDoubletClass.success('Success');

      var result = instance.map(
        first: (value) => 'Mapped: $value',
        second: (value) => 'Not executed',
      );

      expect(result, 'Mapped: Success');
    });

    test('Executes second mapping function when isSecond is true', () {
      var instance = TestDoubletClass.notFound(NotFound('Not found'));

      var result = instance.map(
        first: (value) => 'Not executed',
        second: (value) => 'Mapped: ${value.message}',
      );

      expect(result, 'Mapped: Not found');
    });
  });

  group('on', () {
    test('Executes first callback function when isFirst is true', () {
      var instance = TestDoubletClass.success('Success');

      var result = '';
      instance.on(
        first: (value) async {
          result = 'Callback executed with value: $value';
        },
        second: (value) async {
          result = 'Not executed';
        },
      );

      expect(result, 'Callback executed with value: Success');
    });

    test('Executes second callback function when isSecond is true', () {
      var instance = TestDoubletClass.notFound(NotFound('Not found'));

      var result = '';
      instance.on(
        first: (value) async {
          result = 'Not executed';
        },
        second: (value) async {
          result = 'Callback executed with value: ${value.message}';
        },
      );

      expect(result, 'Callback executed with value: Not found');
    });
  });

  group('ifType', () {
    test('Executes callback for matching type in first position', () {
      var result = '';
      var instance = TestDoubletClass.success('Success');

      instance.ifType<String>(callback: (value) {
        result = 'Callback executed with value: $value';
      });

      expect(result, 'Callback executed with value: Success');
    });

    test('Executes callback for matching type in second position', () {
      var result = '';
      var instance = TestDoubletClass.notFound(NotFound('Not found'));

      instance.ifType<NotFound>(callback: (value) {
        result = 'Callback executed with value: ${value.message}';
      });

      expect(result, 'Callback executed with value: Not found');
    });

    test('Does not execute callback for non-matching type', () {
      var result = '';
      var instance = TestDoubletClass.success('Success');

      instance.ifType<int>(callback: (value) {
        result = 'Callback executed';
      });

      expect(result, '');
    });

    test('Does not execute callback when no matching type is present', () {
      var result = '';
      var instance = TestDoubletClass.success('Success');

      instance.ifType<NotFound>(callback: (value) {
        result = 'Callback executed';
      });

      expect(result, '');
    });
  });

  group('run', () {
    test('Awaits first callback', () async {
      var result = '';
      var instance = TestDoubletClass.success('Success');

      await DoubletUtils.run(
        functionToExecute: () async {
          await Future.delayed(const Duration(milliseconds: 100));
          return instance;
        },
        onFirst: (value) async {
          result = 'Callback executed with value: $value';
        },
      );

      expect(result, 'Callback executed with value: Success');
    });

    test('Awaits second callback', () async {
      var result = 'Not executed';
      var instance = TestDoubletClass.success('Success');

      await DoubletUtils.run(
        functionToExecute: () async {
          await Future.delayed(const Duration(milliseconds: 100));
          return instance;
        },
        onFirst: (value) async {
          await Future.delayed(const Duration(milliseconds: 100));
          result = 'Callback executed with value: $value';
        },
      );

      expect(result, 'Callback executed with value: Success');
    });

    test('Executes first callback for String type', () async {
      var result = '';
      var instance = TestDoubletClass.success('Success');

      await DoubletUtils.run(
        functionToExecute: () async => instance,
        onFirst: (value) async {
          result = 'Callback executed with value: $value';
        },
      );

      expect(result, 'Callback executed with value: Success');
    });

    test('Executes second callback for NotFound type', () async {
      var result = '';
      var instance = TestDoubletClass.notFound(NotFound('Not found'));

      await DoubletUtils.run(
        functionToExecute: () async => instance,
        onSecond: (value) async {
          result = 'Callback executed with value: ${value.message}';
        },
      );

      expect(result, 'Callback executed with value: Not found');
    });

    test('Does not execute first callback for NotFound type', () async {
      var result = '';
      var instance = TestDoubletClass.notFound(NotFound('Not found'));

      await DoubletUtils.run(
        functionToExecute: () async => instance,
        onFirst: (value) async {
          result = 'Callback executed';
        },
      );

      expect(result, '');
    });

    test('Does not execute second callback for String type', () async {
      var result = '';
      var instance = TestDoubletClass.success('Success');

      await DoubletUtils.run(
        functionToExecute: () async => instance,
        onSecond: (value) async {
          result = 'Callback executed';
        },
      );

      expect(result, '');
    });
  });
}

class TestDoubletClass extends Doublet<String, NotFound> {
  TestDoubletClass.success(super.value) : super.first();
  TestDoubletClass.notFound(super.value) : super.second();
}
