# {{PROJECT_NAME}}

## 项目类型

（填写，如：政府公告爬虫 / 政策推送服务 / 企业信息采集 / 数据看板）

## 技术栈

- 语言：Python 3.11
- 调度：GitHub Actions
- 数据采集：requests / httpx / Jina Reader
- 数据输出：（填写，如：钉钉 AI 表格 / 微信公众号 / JSON 文件）

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
| QClaw | 本地 | 全能 Agent | spec→code→review、浏览器自动化、定时任务、数据采集 | `.agent/qclaw/skills/` |
| Claude Code | 本地 | 实现 Agent | 代码编写、重构、文件操作 | `.claude/skills/` |
| Trae IDE | IDE | 实现 Agent | 代码编写、重构、VS Code 生态整合 | `.trae/skills/` |
| Codex | 本地/云端 | 实现 Agent | 代码编写、审查、多工具编排 | `.codex/skills/` |
| WorkBuddy | 本地 | 实现 Agent | 代码编写、调试、文件操作 | `.agent/workbuddy/skills/` |
| GitHub Actions | CI/CD | — | 定时调度、自动化测试、spec 格式校验 | — |

## Agent 角色

> 角色定义详见 [docs/agent-profiles.md](docs/agent-profiles.md)。

| 角色 | 职责 | 产出 |
|------|------|------|
| Planner | 需求分析、方案设计、任务拆解 | specs/active/*/proposal.md + design.md + tasks.md |
| Implementer | 按 tasks.md 逐条实现代码 | 代码 commit + handoff.md |
| Reviewer | 代码审查、spec 验收 | specs/active/*/verdict.md |

## 关键路径

| 用途 | 路径 |
|------|------|
| 项目宪法 | docs/constitution.md |
| 项目规则（含爬虫配置） | docs/project-rules.md |
| 进行中的方案 | specs/active/ |
| 已完成的方案 | specs/archive/ |
| 方案模板 | specs/template/ |
| 变更记录 | CHANGELOG.md |
| 架构决策 | docs/decisions/ADR-NNN.md |
| Agent 角色定义 | docs/agent-profiles.md |

## 快速开始

```bash
git pull origin main
head -40 CHANGELOG.md
```

## 数据安全约定

- `.env` 不入 git（API Key、数据库密码等）
- 密钥通过 GitHub Secrets 或本地 `.env` 管理
- 爬虫不得发送含真实用户信息的请求
- 原始采集数据不可变，修改仅通过独立处理管线
