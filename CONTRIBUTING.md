# Contributing to {{PROJECT_NAME}}

## 开发流程

本项目采用 **Spec-Driven Development**。在开始写代码前，请先阅读：

- [AGENTS.md](AGENTS.md) — AI Agent 行为约定和工具兼容性矩阵
- [docs/constitution.md](docs/constitution.md) — 项目宪法（不可违背的原则）
- [docs/workflow.md](docs/workflow.md) — 完整协作范式（含 Handoff Protocol）
- [docs/agent-profiles.md](docs/agent-profiles.md) — Agent 角色定义

## 快速开始

```bash
git clone git@github.com:qiangsheng-org/{{PROJECT_NAME}}.git
cd {{PROJECT_NAME}}
```

每次开始任务前：
```bash
git pull origin main
head -30 CHANGELOG.md
```

## 变更流程

根据改动规模选择流程：

| 改动规模 | 流程 |
|----------|------|
| 纯文档 | 直接 commit |
| 单文件 <50 行 | 直接 fix + CHANGELOG |
| 配置/依赖变更 | 验证 + CHANGELOG |
| 小功能改进 | change-proposal.md |
| 多文件/新功能 | 完整 spec 流程 |

详见 [docs/workflow.md](docs/workflow.md)。

## 提交规范

- Conventional Commits：`type(scope): description`
- Type：feat / fix / docs / spec / refactor / chore
- 每个 Agent 用自己的身份签名提交
- 涉及 spec 变更的 PR title 引用 spec：`[SPEC-xxx] ...`

## 工具切换

切换工具/Agent 时，在 `specs/active/<spec-name>/handoff.md` 写入交接状态。详见 [docs/workflow.md](docs/workflow.md) 中的 Agent Handoff Protocol。

## AI 参与声明

如果使用 AI 辅助开发，必须在 PR 的 AI Disclosure 部分声明。
