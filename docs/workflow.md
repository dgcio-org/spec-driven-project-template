# 协作范式（人类参考）

> **Agent 行为规范由 skill `spec-driven-development` 强制执行。**
> 本文档是人类可读的参考说明。


## 核心原则

1. 不跳步：没讨论清楚不写代码
2. 先方案后代码：spec 先行，实施在后
3. 按改动规模选择流程：小改动轻量，大改动严谨

## 变更流程决策树

```
改动来了
  ├─ 纯文档？ ────────────────▶ 直接 commit
  ├─ 单文件 <50 行？ ─────────▶ 直接 fix + CHANGELOG
  ├─ 配置变更？ ──────────────▶ 验证 + CHANGELOG
  ├─ 依赖升级？ ──────────────▶ 测试 + CHANGELOG
  ├─ 多文件 / 新功能？ ───────▶ 完整 spec 流程
  └─ 不确定？ ───────────────▶ 走 spec（安全侧）
```

## 完整 Spec 流程

1. 讨论 — 对齐认知，不写文件
2. 方案起草 — proposal.md + design.md
3. 确认 — 用户审阅通过
4. 任务拆解 — tasks.md
5. 委派执行 — 实施 Agent 按 tasks.md 实现
6. 验收 — verdict.md
7. 归档 — 移动 spec + 更新 CHANGELOG

详细规则见 skill `spec-driven-development` 的 Rule 1-12。

## 文件结构

```
specs/
├── template/          # 模板
├── active/            # 进行中
└── archive/           # 已完成
```

## CHANGELOG 规范

采用 [Keep a Changelog](https://keepachangelog.com/) 格式，语义化版本。

## ADR 规范

格式见 [ADR GitHub Org](https://adr.github.io/)。编号从 001 递增。

## 多 Agent 协作

| 改动类型 | 分支 | 合并方式 |
|----------|------|----------|
| 新功能/重构 | feat/xxx | PR → review → merge |
| Bug 修复 | fix/xxx | PR → review → merge |
| 小修小改 | chore/xxx | 直接 push 或轻量 PR |
| 文档 | 直接 main | 直接 push |

开工前：`git pull origin main && head -40 CHANGELOG.md`

Agent 间沟通：快速确认用 @mention，需讨论开 Issue，结构化分配用 GitHub Projects。

## 四层治理体系

| 层 | 位置 | 职责 |
|----|------|------|
| Org 治理 | qiangsheng-org/.github | CODE_OF_CONDUCT、CONTRIBUTING、Issue/PR 模板 |
| 行为约束 | skill: spec-driven-development | 精确规则，Agent 强制执行 |
| 项目骨架 | 本模板仓库 | specs/、CHANGELOG、ADR 目录 |
| 项目个性 | docs/project-rules.md + skills/ | 项目特定规则和技能 |
