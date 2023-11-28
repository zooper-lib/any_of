import 'package:any_of/any_of.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Returns', () {
    test('String', () {
      var response = TestTripletClass.success('Success');

      expect(response.first, isA<String>());
      expect(response.first, 'Success');
      expect(() => response.second, throwsA(isA<TypeError>()));
      expect(() => response.third, throwsA(isA<TypeError>()));
    });

    test('NotFound', () {
      var response = TestTripletClass.notFound(NotFound('Not found'));

      expect(() => response.first, throwsA(isA<TypeError>()));
      expect(response.second, isA<NotFound>());
      expect(response.second.message, 'Not found');
      expect(() => response.third, throwsA(isA<TypeError>()));
    });

    test('Int', () {
      var response = TestTripletClass.count(10);

      expect(() => response.first, throwsA(isA<TypeError>()));
      expect(() => response.second, throwsA(isA<TypeError>()));
      expect(response.third, isA<int>());
      expect(response.third, 10);
    });
  });

  group('Equality', () {
    test('Instances with same values are equal', () {
      var response1 = TestTripletClass.success('Success');
      var response2 = TestTripletClass.success('Success');

      expect(response1, response2);
    });

    test('Instances with different values are not equal', () {
      var response1 = TestTripletClass.success('Success');
      var response2 = TestTripletClass.success('Different');

      expect(response1, isNot(response2));
    });

    test('Instances with different types are not equal', () {
      var response1 = TestTripletClass.success('Success');
      var response2 = TestTripletClass.notFound(NotFound('Not found'));

      expect(response1, isNot(response2));
    });
  });

  group('map', () {
    test('Executes first mapping function when isFirst is true', () {
      var instance = TestTripletClass.success('Success');

      var result = instance.map(
        first: (value) => 'Mapped: $value',
        second: (value) => 'Not executed',
        third: (value) => 'Not executed',
      );

      expect(result, 'Mapped: Success');
    });

    test('Executes second mapping function when isSecond is true', () {
      var instance = TestTripletClass.notFound(NotFound('Not found'));

      var result = instance.map(
        first: (value) => 'Not executed',
        second: (value) => 'Mapped: ${value.message}',
        third: (value) => 'Not executed',
      );

      expect(result, 'Mapped: Not found');
    });

    test('Executes third mapping function when isThird is true', () {
      var instance = TestTripletClass.count(10);

      var result = instance.map(
        first: (value) => 'Not executed',
        second: (value) => 'Not executed',
        third: (value) => 'Mapped: $value',
      );

      expect(result, 'Mapped: 10');
    });
  });

  group('on', () {
    test('Executes first callback function when isFirst is true', () {
      var instance = TestTripletClass.success('Success');

      var result = '';
      instance.on(
        first: (value) async {
          result = 'Callback executed with value: $value';
        },
        second: (value) async {
          result = 'Not executed';
        },
        third: (value) async {
          result = 'Not executed';
        },
      );

      expect(result, 'Callback executed with value: Success');
    });

    test('Executes second callback function when isSecond is true', () {
      var instance = TestTripletClass.notFound(NotFound('Not found'));

      var result = '';
      instance.on(
        first: (value) async {
          result = 'Not executed';
        },
        second: (value) async {
          result = 'Callback executed with value: ${value.message}';
        },
        third: (value) async {
          result = 'Not executed';
        },
      );

      expect(result, 'Callback executed with value: Not found');
    });

    test('Executes third callback function when isThird is true', () {
      var instance = TestTripletClass.count(10);

      var result = '';
      instance.on(
        first: (value) async {
          result = 'Not executed';
        },
        second: (value) async {
          result = 'Not executed';
        },
        third: (value) async {
          result = 'Callback executed with value: $value';
        },
      );

      expect(result, 'Callback executed with value: 10');
    });
  });

  group('ifType', () {
    test('Executes callback for matching type in first position', () {
      var result = '';
      var instance = TestTripletClass.success('Success');

      instance.ifType<String>(callback: (value) {
        result = 'Callback executed with value: $value';
      });

      expect(result, 'Callback executed with value: Success');
    });

    test('Executes callback for matching type in second position', () {
      var result = '';
      var instance = TestTripletClass.notFound(NotFound('Not found'));

      instance.ifType<NotFound>(callback: (value) {
        result = 'Callback executed with value: ${value.message}';
      });

      expect(result, 'Callback executed with value: Not found');
    });

    test('Executes callback for matching type in third position', () {
      var result = '';
      var instance = TestTripletClass.count(10);

      instance.ifType<int>(callback: (value) {
        result = 'Callback executed with value: $value';
      });

      expect(result, 'Callback executed with value: 10');
    });

    test('Does not execute callback for non-matching type', () {
      var result = '';
      var instance = TestTripletClass.success('Success');

      instance.ifType<int>(callback: (value) {
        result = 'Callback executed';
      });

      expect(result, '');
    });

    test('Does not execute callback when no matching type is present', () {
      var result = '';
      var instance = TestTripletClass.success('Success');

      instance.ifType<NotFound>(callback: (value) {
        result = 'Callback executed';
      });

      expect(result, '');
    });
  });
}

class TestTripletClass extends Triplet<String, NotFound, int> {
  TestTripletClass.success(super.value) : super.first();
  TestTripletClass.notFound(super.value) : super.second();
  TestTripletClass.count(super.value) : super.third();
}
