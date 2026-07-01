# {{PROJECT_NAME}}

## 技术栈

- （项目初始化后填写）

## 开发范式

本项目采用 **Spec-Driven Development (SDD)**：先方案后代码，没讨论清楚不写代码。

行为规范由 Hermes skill `spec-driven-development` 强制执行：

```bash
# Agent 启动时加载
hermes -s spec-driven-development

# 或全局安装（推荐）
hermes skills install spec-driven-development
```

人类可读的完整说明见 [docs/workflow.md](docs/workflow.md)。

## 工具兼容性矩阵

> 任何 Agent 启动时首先读取本节，了解自身在项目中的角色和能力边界。

| 工具 | 角色 | 能力 | 限制 |
|------|------|------|------|
| Hermes (云端) | 主力 Agent | 全流程 spec→code→review、多 profile 协作 | 需网络连接 |
| QClaw (本地) | 辅助 Agent | 文件操作、浏览器自动化、定时任务、MCP 工具 | 无直接代码执行权限 |
| WorkBuddy (本地) | 实现 Agent | 代码编写、调试、本地测试 | 无 spec 管理能力 |
| Claude Code (本地) | 实现 Agent | 代码编写、重构、文件操作 | 无项目级上下文记忆 |
| GitHub Actions | CI/CD | 自动化测试、部署、spec 格式校验 | 无交互能力 |

> 初始化项目时，根据实际使用的工具编辑此表。删除未使用的行，添加新工具。

## Agent 角色

> 角色定义详见 [docs/agent-profiles.md](docs/agent-profiles.md)。

| 角色 | 职责 | 产出 |
|------|------|------|
| Planner | 需求分析、方案设计、任务拆解 | specs/active/*/proposal.md + design.md + tasks.md |
| Implementer | 按 tasks.md 逐条实现代码 | 代码 commit + handoff.md |
| Reviewer | 代码审查、spec 验收 | specs/active/*/verdict.md |

单人推进时，一个人扮演所有角色。多 Agent 协作时，每角色绑定一个工具/profile。

## 关键路径

| 用途 | 路径 |
|------|------|
| 项目宪法 | docs/constitution.md |
| 进行中的方案 | specs/active/ |
| 已完成的方案 | specs/archive/ |
| 方案模板 | specs/template/ |
| 变更记录 | CHANGELOG.md |
| 架构决策 | docs/decisions/ADR-NNN.md |
| 项目特定规则 | docs/project-rules.md |
| Agent 角色定义 | docs/agent-profiles.md |
| 项目专属技能 | skills/ |

## 快速开始

```bash
git pull origin main
head -40 CHANGELOG.md
```

## 安全约定

- .env 不入 git
- 密钥由用户自行管理
- 高风险操作（删文件、推远程、改环境/CI/DB）须取得二次确认
