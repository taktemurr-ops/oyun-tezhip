import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_tezhip/oyun_tezhip.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(tezhipConfig.title.length, 33);
    expect(tezhipConfig.tagline.length, 33);
    for (final s in tezhipConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(tezhipConfig.gameId, tezhipId);
    expect(tezhipRules.gameId, tezhipId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(tezhipRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: tezhipId, optionalMechanics: tezhipRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(tezhipRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
