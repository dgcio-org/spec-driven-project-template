# Spec-Driven Development 项目模板

## 这是什么

一个适用于多 Agent 协作的长期项目模板。包含完整的行为约定、spec 流程、变更管理和架构决策记录。

## 核心原则

1. **不跳步**：没讨论清楚不写代码
2. **先方案后代码**：spec 先行，实施在后
3. **小改动轻量，大改动严谨**：按改动规模选择流程深度
4. **零工具依赖**：纯 markdown + git 约定，不需要额外 CLI

## 目录结构

```
├── AGENTS.md                    # AI Agent 行为约定（任何 AI 先读这个）
├── CHANGELOG.md                 # 变更记录（Keep a Changelog 格式）
├── CONTRIBUTING.md              # 贡献指南
├── specs/
│   ├── template/                # Spec 模板
│   ├── active/                  # 进行中的 spec
│   └── archive/                 # 已完成的 spec
├── docs/
│   ├── workflow.md              # 完整协作范式
│   ├── project-rules.md         # 项目特定规则（项目初始化后填写）
│   └── decisions/               # 架构决策记录（ADR）
└── skills/                      # 项目专属 Hermes skills
```

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

1. 编辑 `docs/project-rules.md`，填写项目特定的 Agent 角色、环境、规则
2. 根据项目技术栈修改 `.gitignore`
3. 开始第一个 spec

## 与 Org 治理的关系

本模板由 `qiangsheng-org/.github` 仓库补充 Org 级规范（CODE_OF_CONDUCT、SECURITY、SUPPORT 等）。这些文件所有项目自动继承，不需要在模板中重复。

## 参考

- [Keep a Changelog](https://keepachangelog.com/)
- [Architecture Decision Records](https://adr.github.io/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [OpenSpec](https://github.com/Fission-AI/OpenSpec)
- [GitHub Spec Kit](https://github.com/github/spec-kit)
