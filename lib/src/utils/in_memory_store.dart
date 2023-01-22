import 'package:rxdart/rxdart.dart';

/// an in-memory store backed by  BehaviourSubject that can be used to 
/// store the data for all the fake repositories in the app
class InMemoryStore<T> {
  InMemoryStore(T initial) : _subject = BehaviorSubject<T>.seeded(initial);

  /// The BehaviourSubject that holds the data
  final BehaviorSubject<T> _subject;

  /// The output stream that can be used to listen to the data
  Stream<T> get stream => _subject.stream;

  /// A synchoronous getter for the current value
  T get value => _subject.value;

  /// A setter for updating the calue
  set value(T value) => _subject.add(value);

  /// Dont forget to call when done
  void close() => _subject.close();
}
