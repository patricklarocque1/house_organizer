import 'package:firebase_performance/firebase_performance.dart';
import 'package:house_organizer/core/logging.dart';

class PerformanceService {
  static final FirebasePerformance _performance = FirebasePerformance.instance;
  static final _log = buildLogger();

  // Trace management
  static Trace startTrace(String name) {
    final trace = _performance.newTrace(name);
    trace.start();
    _log.d('⚡ Performance: Started trace - $name');
    return trace;
  }

  static Future<Trace> startAsyncTrace(String name) async {
    final trace = _performance.newTrace(name);
    await trace.start();
    _log.d('⚡ Performance: Started async trace - $name');
    return trace;
  }

  // Custom metrics
  static void recordFirestoreOperation(String operation, Duration duration) {
    try {
      final metric = _performance.newMetric('firestore_$operation');
      metric.value = duration.inMilliseconds;
      _log.d('⚡ Performance: Firestore $operation took ${duration.inMilliseconds}ms');
    } catch (e) {
      _log.e('⚡ Performance: Failed to record Firestore metric: $e');
    }
  }

  static void recordAuthOperation(String operation, Duration duration) {
    try {
      final metric = _performance.newMetric('auth_$operation');
      metric.value = duration.inMilliseconds;
      _log.d('⚡ Performance: Auth $operation took ${duration.inMilliseconds}ms');
    } catch (e) {
      _log.e('⚡ Performance: Failed to record Auth metric: $e');
    }
  }

  static void recordNetworkOperation(String operation, Duration duration, int? responseSize) {
    try {
      final metric = _performance.newMetric('network_$operation');
      metric.value = duration.inMilliseconds;
      _log.d('⚡ Performance: Network $operation took ${duration.inMilliseconds}ms');
      
      if (responseSize != null) {
        final sizeMetric = _performance.newMetric('network_${operation}_size');
        sizeMetric.value = responseSize;
        _log.d('⚡ Performance: Network $operation response size: ${responseSize}bytes');
      }
    } catch (e) {
      _log.e('⚡ Performance: Failed to record network metric: $e');
    }
  }

  static void recordTaskOperation(String operation, Duration duration) {
    try {
      final metric = _performance.newMetric('task_$operation');
      metric.value = duration.inMilliseconds;
      _log.d('⚡ Performance: Task $operation took ${duration.inMilliseconds}ms');
    } catch (e) {
      _log.e('⚡ Performance: Failed to record task metric: $e');
    }
  }

  static void recordListOperation(String operation, Duration duration) {
    try {
      final metric = _performance.newMetric('list_$operation');
      metric.value = duration.inMilliseconds;
      _log.d('⚡ Performance: List $operation took ${duration.inMilliseconds}ms');
    } catch (e) {
      _log.e('⚡ Performance: Failed to record list metric: $e');
    }
  }

  static void recordUserOperation(String operation, Duration duration) {
    try {
      final metric = _performance.newMetric('user_$operation');
      metric.value = duration.inMilliseconds;
      _log.d('⚡ Performance: User $operation took ${duration.inMilliseconds}ms');
    } catch (e) {
      _log.e('⚡ Performance: Failed to record user metric: $e');
    }
  }

  // Custom attributes for traces
  static void setTraceAttribute(Trace trace, String attribute, String value) {
    try {
      trace.putAttribute(attribute, value);
      _log.d('⚡ Performance: Set trace attribute - $attribute: $value');
    } catch (e) {
      _log.e('⚡ Performance: Failed to set trace attribute: $e');
    }
  }

  static void incrementTraceCounter(Trace trace, String counter) {
    try {
      trace.incrementCounter(counter);
      _log.d('⚡ Performance: Incremented counter - $counter');
    } catch (e) {
      _log.e('⚡ Performance: Failed to increment counter: $e');
    }
  }

  // Predefined performance monitors for common operations
  static Future<T> monitorFirestoreOperation<T>(
    String operation,
    Future<T> Function() operationCallback,
  ) async {
    final trace = startTrace('firestore_$operation');
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await operationCallback();
      stopwatch.stop();
      recordFirestoreOperation(operation, stopwatch.elapsed);
      return result;
    } catch (e) {
      stopwatch.stop();
      setTraceAttribute(trace, 'error', e.toString());
      recordFirestoreOperation('${operation}_error', stopwatch.elapsed);
      rethrow;
    } finally {
      trace.stop();
    }
  }

  static Future<T> monitorAuthOperation<T>(
    String operation,
    Future<T> Function() operationCallback,
  ) async {
    final trace = startTrace('auth_$operation');
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await operationCallback();
      stopwatch.stop();
      recordAuthOperation(operation, stopwatch.elapsed);
      return result;
    } catch (e) {
      stopwatch.stop();
      setTraceAttribute(trace, 'error', e.toString());
      recordAuthOperation('${operation}_error', stopwatch.elapsed);
      rethrow;
    } finally {
      trace.stop();
    }
  }

  static Future<T> monitorTaskOperation<T>(
    String operation,
    Future<T> Function() operationCallback,
  ) async {
    final trace = startTrace('task_$operation');
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await operationCallback();
      stopwatch.stop();
      recordTaskOperation(operation, stopwatch.elapsed);
      return result;
    } catch (e) {
      stopwatch.stop();
      setTraceAttribute(trace, 'error', e.toString());
      recordTaskOperation('${operation}_error', stopwatch.elapsed);
      rethrow;
    } finally {
      trace.stop();
    }
  }

  static Future<T> monitorListOperation<T>(
    String operation,
    Future<T> Function() operationCallback,
  ) async {
    final trace = startTrace('list_$operation');
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await operationCallback();
      stopwatch.stop();
      recordListOperation(operation, stopwatch.elapsed);
      return result;
    } catch (e) {
      stopwatch.stop();
      setTraceAttribute(trace, 'error', e.toString());
      recordListOperation('${operation}_error', stopwatch.elapsed);
      rethrow;
    } finally {
      trace.stop();
    }
  }

  static Future<T> monitorUserOperation<T>(
    String operation,
    Future<T> Function() operationCallback,
  ) async {
    final trace = startTrace('user_$operation');
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await operationCallback();
      stopwatch.stop();
      recordUserOperation(operation, stopwatch.elapsed);
      return result;
    } catch (e) {
      stopwatch.stop();
      setTraceAttribute(trace, 'error', e.toString());
      recordUserOperation('${operation}_error', stopwatch.elapsed);
      rethrow;
    } finally {
      trace.stop();
    }
  }

  // App startup performance
  static Future<T> monitorAppStartup<T>(
    Future<T> Function() startupCallback,
  ) async {
    final trace = startTrace('app_startup');
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await startupCallback();
      stopwatch.stop();
      setTraceAttribute(trace, 'success', 'true');
      setTraceAttribute(trace, 'startup_time_ms', stopwatch.elapsedMilliseconds.toString());
      _log.d('⚡ Performance: App startup completed in ${stopwatch.elapsedMilliseconds}ms');
      return result;
    } catch (e) {
      stopwatch.stop();
      setTraceAttribute(trace, 'success', 'false');
      setTraceAttribute(trace, 'error', e.toString());
      _log.e('⚡ Performance: App startup failed after ${stopwatch.elapsedMilliseconds}ms: $e');
      rethrow;
    } finally {
      trace.stop();
    }
  }

  // Screen load performance
  static Future<T> monitorScreenLoad<T>(
    String screenName,
    Future<T> Function() loadCallback,
  ) async {
    final trace = startTrace('screen_load_$screenName');
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await loadCallback();
      stopwatch.stop();
      setTraceAttribute(trace, 'screen_name', screenName);
      setTraceAttribute(trace, 'load_time_ms', stopwatch.elapsedMilliseconds.toString());
      _log.d('⚡ Performance: Screen $screenName loaded in ${stopwatch.elapsedMilliseconds}ms');
      return result;
    } catch (e) {
      stopwatch.stop();
      setTraceAttribute(trace, 'screen_name', screenName);
      setTraceAttribute(trace, 'error', e.toString());
      _log.e('⚡ Performance: Screen $screenName failed to load after ${stopwatch.elapsedMilliseconds}ms: $e');
      rethrow;
    } finally {
      trace.stop();
    }
  }

  // Memory usage monitoring
  static void recordMemoryUsage(String context, int memoryUsageBytes) {
    try {
      final metric = _performance.newMetric('memory_usage_$context');
      metric.value = memoryUsageBytes;
      _log.d('⚡ Performance: Memory usage in $context: ${memoryUsageBytes}bytes');
    } catch (e) {
      _log.e('⚡ Performance: Failed to record memory usage: $e');
    }
  }

  // Battery usage monitoring
  static void recordBatteryUsage(String context, double batteryPercentage) {
    try {
      final metric = _performance.newMetric('battery_usage_$context');
      metric.value = (batteryPercentage * 100).round(); // Convert to percentage
      _log.d('⚡ Performance: Battery usage in $context: ${batteryPercentage * 100}%');
    } catch (e) {
      _log.e('⚡ Performance: Failed to record battery usage: $e');
    }
  }

  // Custom performance counters for business metrics
  static void recordBusinessMetric(String metricName, int value, String context) {
    try {
      final metric = _performance.newMetric('business_$metricName');
      metric.value = value;
      _log.d('⚡ Performance: Business metric $metricName in $context: $value');
    } catch (e) {
      _log.e('⚡ Performance: Failed to record business metric: $e');
    }
  }

  // Enable/disable performance monitoring
  static Future<void> enablePerformanceMonitoring() async {
    try {
      await _performance.setPerformanceCollectionEnabled(true);
      _log.d('⚡ Performance: Performance monitoring enabled');
    } catch (e) {
      _log.e('⚡ Performance: Failed to enable performance monitoring: $e');
    }
  }

  static Future<void> disablePerformanceMonitoring() async {
    try {
      await _performance.setPerformanceCollectionEnabled(false);
      _log.d('⚡ Performance: Performance monitoring disabled');
    } catch (e) {
      _log.e('⚡ Performance: Failed to disable performance monitoring: $e');
    }
  }
}