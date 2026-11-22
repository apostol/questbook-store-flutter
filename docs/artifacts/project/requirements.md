---
doc: project-requirements
project: QuestBook.today
repository: apostol/questbook-store-flutter
updated: 2026-11-22
owner: Project Manager
source:
  kind: decision
  ref: docs/decisions/2026-11-22-nfr-and-target-platforms.md
canonical_requirements_dir: docs/artifacts/requirements
requirements:
  - REQ-QUE-001
  - REQ-QUE-002
  - REQ-QUE-003
  - REQ-QUE-004
  - REQ-QUE-005
  - REQ-QUE-006
---

# Требования к проекту: QuestBook.today

Канонический источник требований — файлы `docs/artifacts/requirements/QUE/REQ-QUE-*.md`;
эта таблица — реестр проекта для чтения человеком и для записи состава требований.
Численные пороги и целевая платформа первого среза заданы владельцем требований
(Project Manager) по решению Project Owner от 2026-11-22
(`docs/decisions/2026-11-22-nfr-and-target-platforms.md`). Значения — приёмочные границы
первого среза, а не измеренный baseline; Project Owner/QA не должны трактовать их как
подтверждённую продуктовую метрику.

## Требования

| ID | Требование | Тип | Приоритет | Источник | Критерий приёмки | Эпики | Статус |
|---|---|---|---|---|---|---|---|
| REQ-QUE-001 | Холодный запуск до первого фрагмента не позднее 3,0 с, 5 из 5 запусков | nonfunctional | must | `docs/decisions/2026-11-22-nfr-and-target-platforms.md`; `REQ-QUE-001` | QA: 5 холодных запусков release-сборки на референсном AVD `test-emu` (Android API 30, x86_64); все ≤ 3,0 с | QUE-1 | approved |
| REQ-QUE-002 | Переход между фрагментами не позднее 0,5 с, 10 из 10 переходов | nonfunctional | must | `docs/decisions/2026-11-22-nfr-and-target-platforms.md`; `REQ-QUE-002` | QA: 10 переходов release-сборки на референсном AVD; все ≤ 0,5 с | QUE-1 | approved |
| REQ-QUE-003 | Сохранность прогресса: 10/10 обычных закрытий и 10/10 принудительных остановок | nonfunctional | must | `docs/decisions/2026-11-22-nfr-and-target-platforms.md`; `REQ-QUE-003` | QA: 20 циклов на референсном AVD; возобновление с последнего подтверждённого выбора, потерь 0 | QUE-1 | approved |
| REQ-QUE-004 | Совместимость прогресса при обновлении предыдущей сборки среза на следующую, 3 из 3 состояний | nonfunctional | must | `docs/decisions/2026-11-22-nfr-and-target-platforms.md`; `REQ-QUE-004` | QA: обновление N → N+1 с 3 фикстурами; 100% открываются без потерь и падений; несовместимость — рестарт с уведомлением | QUE-1 | approved |
| REQ-QUE-005 | Гостевой сценарий работает без сети: 100% шагов, 0 обязательных запросов | nonfunctional | must | `docs/decisions/2026-11-22-nfr-and-target-platforms.md`; `REQ-QUE-005` | QA: 6 рабочих сценариев QUE-3 при отключённой сети; 0 блокирующих сетевых ошибок | QUE-1 | approved |
| REQ-QUE-006 | Целевая платформа первого среза — Android (API 30); остальные платформы вне среза | constraint | must | `docs/decisions/2026-11-22-nfr-and-target-platforms.md`; `README.md`; `android/app/build.gradle`; `REQ-QUE-006` | QA/SA: release-сборка Android и гостевой сценарий на AVD `test-emu` (API 30); проверка других платформ не требуется | QUE-1 | approved |

## Изменения требований

| Дата | ID | Что изменилось | Кто решил | Влияние на срок |
|---|---|---|---|---|
| 2026-11-22 | REQ-QUE-001…006 | Первичная фиксация численных NFR и целевой платформы Android для первого среза | Project Manager (владелец требований) по решению Project Owner `2026-11-22-nfr-and-target-platforms` | Срок эпика QUE-1 (2026-12-05) не менялся; Feature QUE-2 остаётся в backlog до переноса порогов в спецификации |

## Открытые вопросы

| Вопрос | Кому | Влияние | Статус |
|---|---|---|---|
| Устав проекта `docs/artifacts/project/charter.md` отсутствует: нет зафиксированных цели, начала/конца и критериев завершения проекта | Project Owner / Product Manager; человеку задаёт Координатор | Нельзя проверить прогноз конца проекта и контрольные точки | Открыт; не блокирует численные NFR первого среза |
| Продуктовая метрика не определена до появления `business-case.md` | Product Manager / Project Owner | Нельзя заявлять продуктовый успех среза | Открыт по решению `2026-11-22-product-metric-deferred` |
