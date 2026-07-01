# Contributing to {{PROJECT_NAME}}

## 开发流程

本项目采用 **Spec-Driven Development**。在开始写代码前，请先阅读：

- [AGENTS.md](AGENTS.md) — AI Agent 行为约定
- [docs/workflow.md](docs/workflow.md) — 完整协作范式

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

## 提交规范

- Conventional Commits：`type(scope): description`
- Type：feat / fix / docs / spec / refactor / chore
- 每个 Agent 用自己的身份签名提交

## AI 参与声明

如果使用 AI 辅助开发，必须在 PR 的 AI Disclosure 部分声明。
