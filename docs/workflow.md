# 协作范式（人类参考）

> **Agent 行为规范�?[agent-scaffold](https://github.com/LucasGuoo/agent-scaffold) skills 强制执行�?*
> 本文档是人类可读的参考说明。Agent 无需读取本文档，直接执行 agent-scaffold 中的对应 skill 即可�?

## 核心原则

1. 不跳步：没讨论清楚不写代�?
2. 先方案后代码：spec 先行，实施在�?
3. 按改动规模选择流程：小改动轻量，大改动严谨

## 变更流程决策�?

```
改动来了
  ├─ 纯文档？ ────────────────�?直接 commit
  ├─ 单文�?<50 行？ ─────────�?直接 fix + CHANGELOG
  ├─ 配置变更�?──────────────�?验证 + CHANGELOG
  ├─ 依赖升级�?──────────────�?测试 + CHANGELOG
  ├─ 小功能改进？ ────────────�?change-proposal.md（轻�?spec�?
  ├─ 多文�?/ 新功能？ ───────�?完整 spec 流程
  └─ 不确定？ ───────────────�?�?spec（安全侧�?
```

## 完整 Spec 流程

1. **讨论** �?对齐认知，不写文件（可在 GitHub Issue 中进行）
2. **方案起草** �?proposal.md + design.md
3. **确认** �?用户审阅通过
4. **任务拆解** �?tasks.md
5. **委派执行** �?实施 Agent �?tasks.md 实现
6. **验收** �?verdict.md
7. **归档** �?移动 spec + 更新 CHANGELOG

详细规则�?agent-scaffold 中对�?skill（如 `spec-proposal`、`spec-design`）的 SKILL.md�?

### 轻量变更流程（Change Proposal�?

适用于小功能改进、bug 修复中的设计决策、配置重构等�?

1. **起草** �?基于模板 `specs/template/change-proposal.md`
2. **确认** �?用户审阅通过
3. **实施** �?直接编码
4. **归档** �?更新 CHANGELOG

不需�?design.md �?tasks.md，只记录 delta�?

## Agent Handoff Protocol（工具切换协议）

> 当工作从一�?Agent/工具切换到另一个时，当�?Agent 必须执行交接�?

### 交接产物

�?`specs/active/<spec-name>/` 下写入：

| 文件 | 用�?| 必需 |
|------|------|------|
| `handoff.md` | 当前状态、已完成/未完成、下一步建�?| �?|
| `context.md` | 关键决策、上下文信息（给下一�?Agent 的简报） | 首次交接�?|

### handoff.md 格式

```markdown
# Handoff: <from-agent> �?<to-agent>

## 时间
<ISO timestamp>

## 当前阶段
spec / implement / review / archive

## 已完�?
- ...

## 未完�?
- ...

## 关键上下�?
- ...

## 建议下一�?
- ...

## 阻塞�?
- （如有，说明阻塞原因和建议处理方式）
```

### 交接触发条件

| 场景 | 触发 | 方向 |
|------|------|------|
| Spec 阶段完成 | proposal+design+tasks 就绪 | Planner �?Implementer |
| 实现遇到设计问题 | 需要修�?design | Implementer �?Planner |
| 实现完成 | tasks 全部完成 | Implementer �?Reviewer |
| Review 不通过 | 需�?fix | Reviewer �?Implementer |
| Review 通过 | verdict.md 就绪 | Reviewer �?归档 |

### 交接原则

- **Git 即通道**：交接产物提交到 Git，下一�?Agent `git pull` 即可获取
- **文件即状�?*：不需要额外服务，文件存在即表示交接发�?
- **人类在环**：单人推进时，人类是所有交接的"路由�?

## 文件结构

```
specs/
├── template/              # 模板
�?  ├── proposal.md        # 完整 spec：需�?
�?  ├── design.md          # 完整 spec：技术方�?
�?  ├── tasks.md           # 完整 spec：任务拆�?
�?  ├── context.md         # 项目背景和关键决�?
�?  ├── handoff.md         # Agent 间交接状�?
�?  ├── verdict.md         # 验收结论
�?  └── change-proposal.md # 轻量变更提案
├── active/                # 进行�?
└── archive/               # 已完�?
```

## CHANGELOG 规范

采用 [Keep a Changelog](https://keepachangelog.com/) 格式，语义化版本�?

## ADR 规范

格式�?[ADR GitHub Org](https://adr.github.io/)。编号从 001 递增�?

## �?Agent 协作

### 分支策略

| 改动类型 | 分支 | 合并方式 |
|----------|------|----------|
| 新功�?重构 | feat/xxx | PR �?review �?merge |
| Bug 修复 | fix/xxx | PR �?review �?merge |
| 小修小改 | chore/xxx | 直接 push 或轻�?PR |
| 文档 | 直接 main | 直接 push |

开工前：`git pull origin main && head -40 CHANGELOG.md`

### Agent 间沟�?

- 快速确认：@mention（GitHub Issue/PR comment�?
- 需讨论：开 Issue，打 `discussion` 标签
- 结构化分配：GitHub Projects 看板
- 异步记录：GitHub Discussions

## GitHub Native 整合

### Issue = Spec 讨论

- 新功能开 Issue，打 `spec` 标签
- Issue body 可演变为 proposal.md
- Issue 关闭 = spec 归档

### GitHub Projects = Task Board

- 每个活跃 spec 对应一�?Project view
- tasks.md 的每条任务对应一�?sub-issue
- 通过 label 关联：`spec:<spec-name>`

### PR = Spec 实现

- PR title 引用 spec：`[SPEC-xxx] 实现用户认证`
- PR body 包含 design.md 摘要
- PR merge = spec �?archive

## 四层治理体系

| �?| 位置 | 职责 |
|----|------|------|
| Org 治理 | dgcio-org/.github | CODE_OF_CONDUCT、CONTRIBUTING、Issue/PR 模板 |
| 项目宪法 | docs/constitution.md | 不可违背的基本原�?|
| 行为约束 | agent-scaffold skills | 精确规则，Agent 强制执行 |
| 项目骨架 | 本模板仓�?| specs/、CHANGELOG、ADR 目录 |
| 项目个�?| docs/project-rules.md | 项目特定规则 |
