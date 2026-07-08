# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- DGCIO 组织定制版模板，从 [spec-driven-project-template](https://github.com/LucasGuoo/spec-driven-project-template) fork 而来
- 数据工程专项宪法条款（去重、异常可见、增量优先、反爬合规、数据不可变）
- 组织特定 README（含 DGCIO 典型项目类型和现有项目链接）
- 项目规则模板增加爬虫配置字段（数据源、去重策略、反爬策略、异常处理）

### Changed
- 项目宪法增加「数据工程专项原则」5 条
- README 改为 DGCIO 组织品牌，增加典型项目类型表
- AGENTS.md 技术栈默认值改为 Python 3.11 + GitHub Actions
- project-init.sh 仓库引用改为 `dgcio-org/spec-driven-project-template`
