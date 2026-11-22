---
id: REQ-QUE-006
uid: 524f592b-0b63-4766-9276-b6faba4af693
title: Целевая платформа первого среза — Android
type: constraint
status: accepted
priority: must
owner: Project Manager
source:
  kind: decision
  ref: docs/decisions/2026-11-22-nfr-and-target-platforms.md
rationale: Репозиторий — Flutter-проект с каталогами android, ios, linux, macos, web,
  windows; единственная документированная среда сборки и запуска — WSL2 + Android
  SDK/эмулятор (README.md; AVD test-emu, android-30; android/app/build.gradle, targetSdkVersion
  30). Первый срез гостевой и локальный; один Android-таргет сокращает работу SA,
  QA и Dev. Остальные платформы остаются в проекте, но вне объёма среза; их проверка
  не требуется.
tags:
- constraint
- platform
- android
created: '2026-11-22'
updated: '2026-11-22'
verification:
- method: inspection
  ref: "QA/SA: сборка release для Android и прохождение гостевого сценария на AVD test-emu (Android API 30, x86_64); проверка других платформ не требуется."
---

## Формулировка
Система должна поставляться в первом срезе только для платформы Android и проходить гостевой сценарий на Android API 30; iOS, Linux, macOS, Web и Windows не входят в срез и не проверяются.

## Условия проверки
- Конфигурация Android: `android/app/build.gradle` — `targetSdkVersion 30`, `compileSdkVersion 30`;
  `minSdkVersion` берётся из Flutter SDK проекта и не повышается без отдельного решения.
- Проверка: release-сборка устанавливается на AVD `test-emu` (Android API 30, x86_64) или
  физическое Android-устройство, согласованное с QA; гостевой сценарий проходит полностью.
- Остальные платформы: сборка и проверка не требуются; их каталоги остаются в репозитории.

## Обоснование
Единственная документированная среда сборки и запуска — WSL2 + Android SDK/эмулятор (`README.md`).
Изменение состава целевых платформ — решение о составе среза, а не техническая правка этой
записи; оно оформляется отдельным решением владельца требований и Project Owner.
