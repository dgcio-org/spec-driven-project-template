# {{PROJECT_NAME}}

## 技术栈

- （项目初始化后填写）

## 开发范式

本项目采用 **Spec-Driven Development**。
行为规范由 Hermes skill `spec-driven-development` 强制执行：

```bash
# Agent 启动时加载
hermes -s spec-driven-development

# 或全局安装（推荐）
hermes skills install spec-driven-development
```

人类可读的完整说明见 docs/workflow.md。

## 关键路径

| 用途 | 路径 |
|------|------|
| 进行中的方案 | specs/active/ |
| 已完成的方案 | specs/archive/ |
| 方案模板 | specs/template/ |
| 变更记录 | CHANGELOG.md |
| 架构决策 | docs/decisions/ADR-NNN.md |
| 项目特定规则 | docs/project-rules.md |
| 项目专属技能 | skills/ |

## 快速开始

```bash
git pull origin main
head -40 CHANGELOG.md
```

## 安全约定

- .env 不入 git
- 密钥由用户自行管理
