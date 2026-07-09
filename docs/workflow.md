# 协作范式（人类参考）

> **Agent 行为规范由 AGENTS.md 强制执行。** 本文档是人类可读的参考说明。

## 核心原则

1. 不跳步：没讨论清楚不写代码
2. 先方案后代码：spec 先行，实施在后
3. 按改动规模选择流程：小改动轻量，大改动严谨

## 变更流程

决策树见 [AGENTS.md](../AGENTS.md)。

### 完整 Spec 流程

1. 讨论 → 对齐认知
2. 方案起草 → proposal.md + design.md
3. 确认 → 用户审阅通过
4. 任务拆解 → tasks.md
5. 委派执行 → 按 tasks.md 逐条实现
6. 验收 → verdict.md
7. 归档 → 移 archive/ + 更新 CHANGELOG

### 轻量变更（Change Proposal）

适用于小功能改进、设计决策、配置重构等。基于 `specs/template/change-proposal.md`，不需要 design.md 和 tasks.md。

## Agent 间切换

换 Agent 工具时，当前 Agent 在 `tasks.md` 末尾补充接手上下文：

```markdown
---
## 接手上下文（YYYY-MM-DD）
- 当前阶段：implement
- 已完成：task 1.1、1.2
- 未完成：task 1.3（卡在 API 限流）
- 关键决策：选方案 A 因为性能更优
- 建议下一步：先修限流，再继续 2.1
---
```

新 Agent `git pull` 即可接手。

## 文件结构

```
specs/
├── template/              # 模板
│   ├── proposal.md
│   ├── design.md
│   ├── tasks.md
│   ├── context.md
│   ├── verdict.md
│   └── change-proposal.md
├── active/                # 进行中
└── archive/               # 已完成
```

## CHANGELOG 规范

[Keep a Changelog](https://keepachangelog.com/) 格式，语义化版本。

## ADR 规范

格式见 [ADR GitHub Org](https://adr.github.io/)。编号从 001 递增。

## 数据工程专项规范

见 [docs/constitution.md](constitution.md) — 包含爬虫频率控制、robots.txt 遵守、数据不可变性等约束。

## 多 Agent 协作

- 新功能/重构 → `feat/xxx` 分支 → PR
- Bug 修复 → `fix/xxx` 分支 → PR
- 小修小改/文档 → 直接 main

开工前：`git pull origin main && head -40 CHANGELOG.md`
