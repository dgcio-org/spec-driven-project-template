# DGCIO Spec-Driven 项目模板

> 适用于政府数据采集、政策推送、企业信息查询等数据工程项目的标准化协作骨架。

**这是什么**：一个为 DGCIO 组织定制的多 Agent 协作项目模板。遵循 Spec-Driven Development（SDD）方法论，纯 markdown + git 约定，零工具依赖。

## 设计理念

1. **不跳步**：没讨论清楚不写代码
2. **先方案后代码**：spec 先行，实施在后
3. **数据可靠性优先**：数据源变更保护、去重校验、异常告警
4. **免费云端优先**：GitHub Actions 调度 + 公开 API，不自建服务器
5. **跨平台兼容**：QClaw / Claude Code / Trae / Codex / WorkBuddy 通用

## 典型项目类型

| 类型 | 代表项目 | 关键技术 |
|------|---------|---------|
| 政府公告爬虫 | gov-crawler | Python + GitHub Actions + Jina Reader |
| 政策推送服务 | wechat-policy-publisher | Python + 微信公众号 API + 定时调度 |
| 企业信息采集 | qcc-company-aitable | Python + 企查查 API + 钉钉 AI 表格 |
| 数据同步管道 | zcsb-sync | Python + API 对接到数据库 |
| 数据看板 | dashboard-rotator | Python + 前端展示 + 自动轮播 |

## 目录结构

```
├── AGENTS.md                    # AI Agent 行为约定（任何 AI 先读这个）
├── CLAUDE.md → AGENTS.md        # 兼容 Claude Code
├── CHANGELOG.md                 # 变更记录（Keep a Changelog 格式）
├── CONTRIBUTING.md              # 贡献指南
├── project-init.sh              # 项目初始化脚本（含 agent-scaffold 自动安装）
├── .agent-scaffold.lock         # agent-scaffold 版本锁（初始化后生成）
├── .github/                     # GitHub 模板和 CI
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── ISSUE_TEMPLATE/
│   └── workflows/
│       └── spec-validation.yml  # Spec 格式校验
├── specs/
│   ├── template/                # Spec 模板（7 个）
│   ├── active/                  # 进行中的 spec
│   └── archive/                 # 已完成的 spec
└── docs/
    ├── workflow.md              # 完整协作范式（含 Handoff Protocol）
    ├── constitution.md          # 项目宪法（DGCIO 数据工程规范）
    ├── project-rules.md         # 项目特定规则（初始化后填写）
    ├── agent-profiles.md        # Agent 角色定义
    └── decisions/               # 架构决策记录（ADR）
```

## 快速开始

### 方式一：GitHub Template（推荐）

```
GitHub → New Repository → "Repository template"
→ 选择 dgcio-org/spec-driven-project-template
→ 创建后 clone 到本地
```

### 方式二：命令行初始化

```bash
./project-init.sh my-project ~/projects/my-project
```

### 初始化后必须做的事

1. 编辑 `docs/project-rules.md` — 填写爬虫目标、数据源、调度频率
2. 编辑 `docs/constitution.md` — 确认数据合规和安全约定
3. 编辑 `AGENTS.md` — 填写技术栈和工具兼容性矩阵
4. 根据项目需求修改 `.gitignore`（通常加 `data/`、`output/`）
5. 开始第一个 spec

## Agent Skills

Agent 行为规范由 [agent-scaffold](https://github.com/LucasGuoo/agent-scaffold) 仓库统一管理。

`project-init.sh` 会自动检测当前环境中的 Agent 工具并安装对应平台版本。

| 平台 | Skills 路径 |
|------|------------|
| QClaw | `.agent/qclaw/skills/` |
| Claude Code | `.claude/skills/` |
| Trae IDE | `.trae/skills/` |
| Codex | `.codex/skills/` |
| WorkBuddy | `.agent/workbuddy/skills/` |

## DGCIO 组织资源

- 组织首页：[github.com/dgcio-org](https://github.com/dgcio-org)
- 现有项目：gov-crawler（省级公告爬虫）、wechat-policy-publisher（政策推送）、qcc-company-aitable（企业信息采集）等
- 通用脚手架：[agent-scaffold](https://github.com/LucasGuoo/agent-scaffold)

## 参考

- [Keep a Changelog](https://keepachangelog.com/)
- [Architecture Decision Records](https://adr.github.io/)
- [Conventional Commits](https://www.conventionalcommits.org/)
