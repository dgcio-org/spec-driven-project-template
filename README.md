# Spec-Driven Development 项目模板

## 这是什么

一个适用于多 Agent 协作的长期项目模板。包含完整的行为约定、spec 流程、变更管理、工具切换协议和架构决策记录。

**设计理念**：以 GitHub 为中心，支持多平台、多 Agent 工具协作。纯 markdown + git 约定，零工具依赖。

## 核心原则

1. **不跳步**：没讨论清楚不写代码
2. **先方案后代码**：spec 先行，实施在后
3. **小改动轻量，大改动严谨**：按改动规模选择流程深度
4. **零工具依赖**：纯 markdown + git 约定，不需要额外 CLI
5. **跨平台兼容**：任何 AI 编码工具都能通过 AGENTS.md 理解项目约定

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
│   │   ├── proposal.md          # 完整 spec：需求
│   │   ├── design.md            # 完整 spec：技术方案
│   │   ├── tasks.md             # 完整 spec：任务拆解
│   │   ├── context.md           # 项目背景和关键决策
│   │   ├── handoff.md           # Agent 间交接状态
│   │   ├── verdict.md           # 验收结论
│   │   └── change-proposal.md   # 轻量变更提案
│   ├── active/                  # 进行中的 spec
│   └── archive/                 # 已完成的 spec
└── docs/
    ├── workflow.md              # 完整协作范式（含 Handoff Protocol）
    ├── constitution.md          # 项目宪法（不可违背的基本原则）
    ├── project-rules.md         # 项目特定规则（初始化后填写）
    ├── agent-profiles.md        # Agent 角色定义
    └── decisions/               # 架构决策记录（ADR）
```

> **注意**：`skills/` 目录已从此模板中移除。Agent 行为 skills 由独立的 [agent-scaffold](https://github.com/LucasGuoo/agent-scaffold) 仓库管理，通过 `project-init.sh` 自动安装，或手动安装到对应工具目录。

## 快速开始

### 方式一：GitHub Template（推荐）

```
GitHub → New Repository → "Repository template"
→ 选择 qiangsheng-org/spec-driven-project-template
→ 创建后 clone 到本地
```

### 方式二：命令行初始化

```bash
./project-init.sh my-project ~/projects/my-project
```

### 初始化后必须做的事

1. 编辑 `AGENTS.md` — 填写技术栈、工具兼容性矩阵
2. 编辑 `docs/project-rules.md` — 填写项目特定规则
3. 编辑 `docs/constitution.md` — 填写工具链约束
4. 根据项目技术栈修改 `.gitignore`
5. 开始第一个 spec

## 核心机制

### 变更流程决策树

```
改动来了
  ├─ 纯文档？ ────────────────▶ 直接 commit
  ├─ 单文件 <50 行？ ─────────▶ 直接 fix + CHANGELOG
  ├─ 配置变更？ ──────────────▶ 验证 + CHANGELOG
  ├─ 依赖升级？ ──────────────▶ 测试 + CHANGELOG
  ├─ 小功能改进？ ────────────▶ change-proposal.md（轻量 spec）
  ├─ 多文件 / 新功能？ ───────▶ 完整 spec 流程
  └─ 不确定？ ───────────────▶ 走 spec（安全侧）
```

### Agent Handoff Protocol

当工作从一个工具/Agent 切换到另一个时，当前 Agent 在 `specs/active/<spec>/handoff.md` 写入交接状态。下一个 Agent `git pull` 即可获取上下文。

### GitHub Native 整合

- **Issue = Spec 讨论** — 新功能开 Issue，打 `spec` 标签
- **GitHub Projects = Task Board** — tasks.md 的任务对应 Issue
- **PR = Spec 实现** — PR title 引用 spec：`[SPEC-xxx] ...`

## Agent Skills

本模板不内置 skills 文件。Agent 行为规范由 [agent-scaffold](https://github.com/LucasGuoo/agent-scaffold) 仓库提供，支持六大平台：

| 平台 | Skills 路径 |
|------|------------|
| QClaw | `.agent/qclaw/skills/` |
| WorkBuddy | `.agent/workbuddy/skills/` |
| Claude Code | `.claude/skills/` |
| Trae IDE | `.trae/skills/` |
| Codex | `.codex/skills/` |

`project-init.sh` 会自动检测当前环境中的 Agent 工具并安装对应平台版本。

## 与 agent-scaffold 的关系

```
agent-scaffold (LucasGuoo)          spec-driven-project-template (qiangsheng-org)
├── skills/                         ├── templates/ (spec 模板)
│   ├── sdd-workflow/               ├── docs/ (项目治理)
│   ├── spec-proposal/              ├── .github/ (CI)
│   ├── spec-design/                └── project-init.sh (集成 agent-scaffold)
│   ├── spec-tasks/
│   ├── spec-implement/             Skills 管理 → agent-scaffold
│   ├── spec-review/                项目骨架 → spec-driven-project-template
│   ├── change-proposal/
│   ├── handoff/
│   ├── changelog-update/
│   └── scaffold-manager/
├── platforms/
│   ├── qclaw/install.sh
│   ├── workbuddy/install.sh
│   ├── claude-code/install.sh
│   ├── trae/install.sh
│   ├── codex/install.sh
│   └── generic/install.sh
└── templates/ (spec 模板副本)
```

## 参考

- [Keep a Changelog](https://keepachangelog.com/)
- [Architecture Decision Records](https://adr.github.io/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [OpenSpec](https://github.com/Fission-AI/OpenSpec)
- [GitHub Spec Kit](https://github.com/github/spec-kit)
- [BMAD Method](https://github.com/bmad-code-org/BMAD-METHOD)
- [HALF - Human-AI Loop Framework](https://github.com/keting/half)
