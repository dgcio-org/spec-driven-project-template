# Agent Profiles

> 定义项目中各 Agent 的角色、职责和工具绑定。
> 单人推进时，一个人扮演所有角色；多 Agent 协作时，每角色绑定一个工具/profile。

## 当前阶段（单人多工具）

### Planner

- **职责**：需求分析、方案设计、任务拆解、验收
- **产出**：`specs/active/*/proposal.md` + `design.md` + `tasks.md`
- **工具**：Hermes (云端) 或任何能做 spec 管理的 Agent
- **加载 Skill**：`spec-driven-development`

### Implementer

- **职责**：按 `tasks.md` 逐条实现代码
- **产出**：代码 commit + `handoff.md`
- **工具**：WorkBuddy / Claude Code / QClaw (本地)
- **输入**：`tasks.md` + `context.md`

### Reviewer

- **职责**：代码审查、spec 验收
- **产出**：`specs/active/*/verdict.md`
- **工具**：Hermes (云端，另一个 profile) 或人类
- **检查项**：tasks.md 验收标准、constitution 合规、CHANGELOG 更新

## 未来阶段（Hermes Agent Team）

### Orchestrator

- **Profile**：`hermes-orchestrator`
- **职责**：接收任务、分配给其他 profile、汇总结果
- **不做什么**：不直接写代码、不直接写 spec

### Researcher

- **Profile**：`hermes-researcher`
- **职责**：技术调研、可行性分析、竞品分析
- **产出**：调研报告，写入 `specs/active/<spec>/research/`

### Implementer-N

- **Profile**：`hermes-impl-{n}`
- **职责**：并行实现不同 task
- **协调**：通过 `handoff.md` 和 Git 同步状态

### Reviewer

- **Profile**：`hermes-reviewer`
- **职责**：独立于实现者的代码审查
- **权限**：只有 review 权限，没有 merge 权限（人类保留 merge）

## Profile 切换约定

```
任务进入 → Orchestrator 分配
  ├─ 需要调研 → Researcher
  ├─ 需要设计 → Planner (Orchestrator 兼任)
  ├─ 需要实现 → Implementer-1 / Implementer-2 (并行)
  └─ 需要审查 → Reviewer
```

每个 profile 的输出都通过 Git 文件流转，不依赖实时通信。
