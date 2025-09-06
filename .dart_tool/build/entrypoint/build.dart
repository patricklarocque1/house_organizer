// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:freezed/builder.dart' as _i2;
import 'package:json_serializable/builder.dart' as _i3;
import 'package:hive_ce_generator/hive_generator.dart' as _i4;
import 'package:source_gen/builder.dart' as _i5;
import 'package:mockito/src/builder.dart' as _i6;
import 'package:build_config/build_config.dart' as _i7;
import 'package:build_resolvers/builder.dart' as _i8;
import 'dart:isolate' as _i9;
import 'package:build_runner/build_runner.dart' as _i10;
import 'dart:io' as _i11;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
    r'freezed:freezed',
    [_i2.freezed],
    _i1.toDependentsOf(r'freezed'),
    hideOutput: false,
  ),
  _i1.apply(
    r'json_serializable:json_serializable',
    [_i3.jsonSerializable],
    _i1.toDependentsOf(r'json_serializable'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'hive_ce_generator:hive_type_adapter_generator',
    [_i4.getTypeAdapterBuilder],
    _i1.toDependentsOf(r'hive_ce_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'hive_ce_generator:hive_adapters_generator',
    [_i4.getAdaptersBuilder],
    _i1.toDependentsOf(r'hive_ce_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'source_gen:combining_builder',
    [_i5.combiningBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'source_gen:part_cleanup'],
  ),
  _i1.apply(
    r'mockito:mockBuilder',
    [_i6.buildMocks],
    _i1.toDependentsOf(r'mockito'),
    hideOutput: false,
    defaultGenerateFor: const _i7.InputSet(include: [r'test/**']),
  ),
  _i1.apply(
    r'hive_ce_generator:hive_schema_migrator',
    [_i4.getSchemaMigratorBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
  ),
  _i1.apply(
    r'hive_ce_generator:hive_registrar_intermediate_generator',
    [_i4.getRegistrarIntermediateBuilder],
    _i1.toDependentsOf(r'hive_ce_generator'),
    hideOutput: true,
  ),
  _i1.apply(
    r'hive_ce_generator:hive_registrar_generator',
    [_i4.getRegistrarBuilder],
    _i1.toDependentsOf(r'hive_ce_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'build_resolvers:transitive_digests',
    [_i8.transitiveDigestsBuilder],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_resolvers:transitive_digest_cleanup'],
  ),
  _i1.applyPostProcess(
    r'build_resolvers:transitive_digest_cleanup',
    _i8.transitiveDigestCleanup,
  ),
  _i1.applyPostProcess(
    r'source_gen:part_cleanup',
    _i5.partCleanup,
  ),
];
void main(
  List<String> args, [
  _i9.SendPort? sendPort,
]) async {
  var result = await _i10.run(
    args,
    _builders,
  );
  sendPort?.send(result);
  _i11.exitCode = result;
}
