# {{PROJECT_NAME}}

## 技术栈

- （项目初始化后填写）

## 开发范式

本项目采用 **Spec-Driven Development (SDD)**：先方案后代码，没讨论清楚不写代码。

行为规范由 [agent-scaffold](https://github.com/LucasGuoo/agent-scaffold) 提供标准化 skills：

```bash
# 首次进入项目时安装（任一方式）
# 方式一：agent-scaffold 安装脚本
git clone https://github.com/LucasGuoo/agent-scaffold.git /tmp/agent-scaffold
bash /tmp/agent-scaffold/platforms/qclaw/install.sh .

# 方式二：project-init.sh 自动处理
bash project-init.sh <project-name> <target-dir>
```

> 人类可读的完整工作流说明见 [docs/workflow.md](docs/workflow.md)。

## 工具兼容性矩阵

> 任何 Agent 启动时首先读取本节，了解自身在项目中的角色和能力边界。

| 工具 | 类型 | 角色 | 能力 | Skills 路径 |
|------|------|------|------|-------------|
| QClaw | 本地 | 全能 Agent | spec→code→review、浏览器自动化、定时任务、MCP 工具 | `.agent/qclaw/skills/` |
| WorkBuddy | 本地 | 实现 Agent | 代码编写、调试、文件操作 | `.agent/workbuddy/skills/` |
| Claude Code | 本地 | 实现 Agent | 代码编写、重构、文件操作 | `.claude/skills/` |
| Trae IDE | IDE | 实现 Agent | 代码编写、重构、VS Code 生态整合 | `.trae/skills/` |
| Codex | 本地/云端 | 实现 Agent | 代码编写、审查、多工具编排 | `.codex/skills/` |
| GitHub Actions | CI/CD | — | 自动化测试、部署、spec 格式校验 | — |

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
| Agent 行为 skills | 由 agent-scaffold 管理 |

## 快速开始

```bash
git pull origin main
head -40 CHANGELOG.md
```

## 安全约定

- .env 不入 git
- 密钥由用户自行管理
- 高风险操作（删文件、推远程、改环境/CI/DB）须取得二次确认
