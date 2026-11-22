---
level: user-story
yougile:
  uuid: 432a7eda-1ca8-4289-9491-e50dd8939ec5
  short_id: QUE-3
  common_id: ''
  project: QuestBook.today
  column: 79db4c6f-27e3-40e4-9370-4b235f99c94e
  stickers:
  - user-story
  yougile_updated: 1795369434653
  completed: false
  description_hash: 4b5b5dc4ef294258f2a5f30067abd48030455156449dde54ca5554bfef094e20
  deleted: false
  deadline:
    startDate: 1795287600000
    deadline: 1795978800000
    withTime: false
    history:
    - deadline: 1795978800000
      startDate: 1795287600000
      timestamp: 1795370000650
      by: e07d0352-77e1-41de-bf4b-733ddd1ce964
      withTime: false
    - deadline: 1795978800000
      startDate: 1795287600000
      timestamp: 1795370000650
      by: e07d0352-77e1-41de-bf4b-733ddd1ce964
      withTime: false
    - deadline: 1795978800000
      startDate: 1795287600000
      timestamp: 1795370331077
      by: e07d0352-77e1-41de-bf4b-733ddd1ce964
      withTime: false
    - deadline: 1795978800000
      startDate: 1795287600000
      timestamp: 1795370375242
      by: e07d0352-77e1-41de-bf4b-733ddd1ce964
      withTime: false
    - deadline: 1795978800000
      startDate: 1795287600000
      timestamp: 1795371073582
      by: e07d0352-77e1-41de-bf4b-733ddd1ce964
      withTime: false
    blockedPoints: []
    links: []
  subtasks:
  - a2e77d94-29ff-4913-81a7-1bce7c2490ee
synced_at: '2026-11-22T18:12:37Z'
pending: none
estimate:
  effort_days: 6.5
  duration_days: 9
parent: c96738a6-c75b-46c5-bcbf-4453a97c389e
epic: bbcd25c4-7c97-49f2-a7ef-ac6cb5f93be3
children:
- a2e77d94-29ff-4913-81a7-1bce7c2490ee
docs:
  story:
  - docs/artifacts/stories/QUE-3-guest-test-story-local-continue.md
  analysis:
  - docs/artifacts/analysis/432a7eda-1ca8-4289-9491-e50dd8939ec5.md
  spec:
  - docs/artifacts/specs/SPEC-QUE-002-guest-test-story-local-continue.md
schedule:
  start: '2026-11-22'
  deadline: '2026-11-30'
requirements:
- REQ-QUE-001
- REQ-QUE-002
- REQ-QUE-003
- REQ-QUE-004
- REQ-QUE-005
- REQ-QUE-006
---

# [QUE-3] Гость проходит тестовую историю и продолжает её на том же устройстве

## История
Как гость, я хочу пройти встроенную тестовую историю с ветвлением и вернуться к ней позже на том же устройстве, чтобы увидеть последствия своих выборов и не начинать прохождение заново.

## Рабочие сценарии
1. Гость открывает приложение → доступна одна встроенная тестовая история без регистрации.
2. Гость начинает историю → показывается стартовый фрагмент QUE-BUNDLED-001 и два варианта выбора.
3. Гость выбирает вариант → показывается фрагмент выбранной ветки, а прогресс обновляется.
4. Гость проходит ветку до концовки → показывается концовка в варианте текста, соответствующем выбранной ветке, и действие «Пройти заново».
5. Гость закрывает приложение → прогресс сохраняется локально на этой установке; для завершённой истории сохраняется состояние «Завершена».
6. Гость повторно открывает приложение на той же установке → доступно продолжение с сохранённого места; после концовки показывается достигнутая концовка и действие «Пройти заново».
7. Гость выбирает «Пройти заново» → прогресс сбрасывается, история начинается с узла start.

## Критерии приёмки
**Владелец: QA**

Предложение критериев приёмки AC-1…AC-6 — в документе истории `docs/artifacts/stories/QUE-3-guest-test-story-local-continue.md`; утверждение и перенос в запись — QA.

## DoD
- [ ] Гость начинает встроенную историю QUE-BUNDLED-001 без регистрации.
- [ ] Обе ветки достижимы, выбор влияет на текст концовки.
- [ ] После концовки при повторном открытии показывается достигнутая концовка и действие «Пройти заново»; автоматического старта нет.
- [ ] Действие «Пройти заново» сбрасывает прогресс и начинает историю с начала.
- [ ] Прогресс сохраняется локально и возобновляется на той же установке после повторного открытия.
- [ ] При недоступном, повреждённом или несовместимом прогрессе история начинается с начала с уведомлением, частичные данные не используются.
- [ ] Сценарий не требует регистрации, межустройственной синхронизации, платежей, выплат авторам, публичного запуска и коммерческих обещаний.
- [ ] Численные NFR и целевая платформа зафиксированы: REQ-QUE-001…006, Android API 30; значения — приёмочные границы среза, не baseline и не продуктовая метрика.
- [ ] Продуктовая метрика остаётся открытой до `business-case.md`; история не переводится в todo до утверждения AC QA и архитектуры SA; SPEC-QUE-002 обновлена.

## Журнал работы агента
<!-- Добавляй отчёты о выполненной работе по общему шаблону, не удаляя предыдущие записи -->

### Перенос численных NFR и целевой платформы (Business Analyst)

#### Задача
- Репозиторий: `apostol/questbook-store-flutter`
- ID и ссылка: `QUE-3` / YouGile UUID `432a7eda-1ca8-4289-9491-e50dd8939ec5`
- Название: Гость проходит тестовую историю и продолжает её на том же устройстве
- Статус до / после: backlog / backlog; статус не менялся
- Сессия: долгоживущий воркер Business Analyst

#### Участники
| Плагин | Агент или скил | Участие |
|---|---|---|
| agai-project | Project Owner, Project Manager | Решение о NFR и платформе, требования REQ-QUE-001…006 |
| agai-ba | business-analyst, nfr, stories, story-spec, review | Перенос NFR и платформы в SPEC-QUE-002, документ истории и разбор |
| agai-sdlc | records, spec, gate | Связь записи с требованиями, проверки, ворота |

#### Время и использование
- Начало / завершение: 2026-11-22 около 23:05 +05 / около 23:10 +05
- Активное время: около 5 минут; точный трекер пауз недоступен
- Токены и стоимость: недоступны; атрибуция к задаче отсутствует

#### Итог и доказательства
- `SPEC-QUE-002` обновлена до версии 3: NFR-001…NFR-006 с порогами, условиями проверки, ссылками на REQ-QUE-001…006 и решением `docs/decisions/2026-11-22-nfr-thresholds-and-target-platform.md`; целевая платформа — Android API 30; строка «пороги не заданы» удалена.
- Документ истории QUE-3: добавлен раздел «Нефункциональные требования», источники и открытые вопросы обновлены; NFR/платформа больше не открыты, остаются метрика (до `business-case.md`), формат хранения/версионирование (SA) и утверждение AC (QA); платформы iOS, Linux, macOS, Web, Windows отмечены вне среза.
- Разбор истории и анализ эпика обновлены: NFR и платформа перенесены, открытый вопрос закрыт.
- Запись QUE-3 связана с REQ-QUE-001…006; BA-задача QUE-4 связана с теми же требованиями по применимости.
- Проверки: `spec_check`, `record_validate`, `links_check`, `nfr_check`, `story_doc_check`, `gate.py ba` — требуют повторного прогона после правок; результаты фиксируются в отчёте сессии.
- Feature и Story в todo не переводились: это решение Project Owner после SPEC-QUE-002, AC QA и архитектуры SA.

#### Открытые вопросы и дальнейшие действия
- QA утверждает AC-1…AC-6 и создаёт тестовые задачи на REQ-QUE-001…006.
- SA определяет формат хранения, версионирование и признак совместимости прогресса (REQ-QUE-004 задаёт проверяемое поведение).
- Project Owner решает перевод Feature/Story в todo после готовности спецификации, AC и архитектуры.

### Проверки и синхронизация после переноса NFR (Business Analyst)

- `spec_check.py --record 432a7eda… --strict-traceability`: `valid: true`, `problems: []`, `warnings: []`.
- `record_validate.py` по QUE-1, QUE-2, QUE-3, QUE-4: `valid: true` у всех.
- `links_check.py`: `valid: true`, `records: 4`, `requirements: 6`, проблем нет.
- `gate.py story-spec`, `gate.py ba`, `gate.py requirements --strict`: `ready: true`, `problems: []`, `warnings: []`.
- `nfr_check.py`: `valid: true`, `count: 6`, предупреждений нет; `story_doc_check.py`, `analysis_check.py`, `epic_analysis_check.py`, `readiness.py`: `valid: true`.
- `requirements render --check`: `valid: true`; `requirements_coverage.py`: записи 4/4 связаны (100%), требования 6/6 покрыты (100%), `orphans: []`.
- YouGile: `sync report` до push — 4 записи, очередь 2, конфликтов/дрейфа/потерь/незнакомых 0; `sync push` — отправлено 2, ошибок 0; повторный `report` — очередь 0, расхождений 0.
- Feature QUE-2 и Story QUE-3 остаются в backlog; в todo не переводились.

## Документы
- User Story: docs/artifacts/stories/QUE-3-guest-test-story-local-continue.md
- Разбор: docs/artifacts/analysis/432a7eda-1ca8-4289-9491-e50dd8939ec5.md
- Спецификация: docs/artifacts/specs/SPEC-QUE-002-guest-test-story-local-continue.md

## Требования
- REQ-QUE-001
- REQ-QUE-002
- REQ-QUE-003
- REQ-QUE-004
- REQ-QUE-005
- REQ-QUE-006

## Ссылки
Вверх:
- Feature: QUE-2 — Гостевое прохождение тестовой истории и локальное продолжение (c96738a6-c75b-46c5-bcbf-4453a97c389e)
- Epic: QUE-1 — QuestBook.today — гостевое прохождение интерактивной истории (bbcd25c4-7c97-49f2-a7ef-ac6cb5f93be3)
Вниз:
- Task: QUE-4 — BA: анализ истории QUE-3 — гостевое прохождение и локальное продолжение (a2e77d94-29ff-4913-81a7-1bce7c2490ee)
