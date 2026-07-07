# Agent Profiles

> 定义项目中各 Agent 的角色、职责和工具绑定。
> 单人推进时，一个人扮演所有角色；多 Agent 协作时，每角色绑定一个工具/profile。

## 当前阶段（单人多工具）

### Planner

- **职责**：需求分析、方案设计、任务拆解、验收
- **产出**：`specs/active/*/proposal.md` + `design.md` + `tasks.md`
- **推荐工具**：QClaw（全能型，支持 spec 全流程）
- **加载 Skill**：`sdd-workflow`、`spec-proposal`、`spec-design`、`spec-tasks`

### Implementer

- **职责**：按 `tasks.md` 逐条实现代码
- **产出**：代码 commit + `handoff.md`
- **推荐工具**：WorkBuddy / Claude Code / Trae / Codex / QClaw
- **输入**：`tasks.md` + `context.md`
- **加载 Skill**：`spec-implement`、`handoff`

### Reviewer

- **职责**：代码审查、spec 验收
- **产出**：`specs/active/*/verdict.md`
- **推荐工具**：QClaw（不同对话窗口，独立审查）
- **检查项**：tasks.md 验收标准、constitution 合规、CHANGELOG 更新
- **加载 Skill**：`spec-review`、`changelog-update`

## 未来阶段（多 Agent Team）

### Orchestrator

- **职责**：接收任务、分配给其他 Agent、汇总结果
- **不做什么**：不直接写代码、不直接写 spec
- **加载 Skill**：`sdd-workflow`

### Researcher

- **职责**：技术调研、可行性分析、竞品分析
- **产出**：调研报告，写入 `specs/active/<spec>/research/`

### Implementer-N

- **职责**：并行实现不同 task
- **协调**：通过 `handoff.md` 和 Git 同步状态

### Reviewer

- **职责**：独立于实现者的代码审查
- **权限**：只有 review 权限，没有 merge 权限（人类保留 merge）

## 角色绑定规则

```
任务进入 → Orchestrator 分配
  ├─ 需要调研 → Researcher
  ├─ 需要设计 → Planner (Orchestrator 兼任)
  ├─ 需要实现 → Implementer-1 / Implementer-2 (并行)
  └─ 需要审查 → Reviewer
```

每个角色的输出都通过 Git 文件流转，不依赖实时通信。

## Agent Handoff Protocol

> 详见 [workflow.md](workflow.md) 中的 Agent Handoff Protocol 章节。

切换工具/Agent 时，当前 Agent 在 `specs/active/<spec-name>/handoff.md` 写入交接状态。
