# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Removed
- **`skills/` 目录已移除** — Skills 管理完全委托给 [agent-scaffold](https://github.com/LucasGuoo/agent-scaffold)。
  - 移除 `skills/README.md`（项目级 Skill 编写规范）
  - 移除 `skills/_template/SKILL.md`（Skill 模板）

### Changed
- **AGENTS.md** — 移除 Hermes 特定引用，改为引用 agent-scaffold；工具兼容性矩阵扩展至 5 个平台（QClaw、WorkBuddy、Claude Code、Trae、Codex）
- **README.md** — 增加 agent-scaffold 关系说明、平台兼容表格、更新目录结构
- **docs/workflow.md** — 移除 `spec-driven-development` skill 引用，改为 agent-scaffold
- **docs/agent-profiles.md** — 移除 Hermes 特定 profile，更新为多工具通用角色定义
- **docs/project-rules.md** — 更新实施调用方式的工具示例
- **project-init.sh** — 集成 agent-scaffold 自动检测安装、自动清理内置 skills
- **CLAUDE.md** — 保持为 AGENTS.md 软链接
- **.gitignore** — 新增 `.agent/`、`.claude/`、`.trae/`、`.codex/` 忽略规则

## [0.1.0] - 2026-06-30

### Added
- 项目初始化

[Unreleased]: https://github.com/qiangsheng-org/spec-driven-project-template/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/qiangsheng-org/spec-driven-project-template/releases/tag/v0.1.0
