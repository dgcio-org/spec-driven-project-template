# 项目级 Skill 规范

## 什么是项目级 Skill

项目级 Skill 是绑定到特定项目的 Agent 行为定义。与全局 skill（如 `spec-driven-development`）不同，项目级 skill 只在本项目上下文中生效。

## 目录结构

```
skills/
├── README.md              ← 本文件
├── _template/             ← Skill 模板
│   └── SKILL.md
└── <skill-name>/          ← 项目专属 skill
    ├── SKILL.md           ← 必需：skill 定义
    └── scripts/           ← 可选：辅助脚本
```

## Skill 类型

| 类型 | 用途 | 示例 |
|------|------|------|
| **role** | 定义 Agent 角色 | planner.md, implementer.md, reviewer.md |
| **workflow** | 定义工作流 | bug-fix-flow.md, release-flow.md |
| **convention** | 定义约定 | commit-spec.md, branch-naming.md |

## 命名规范

- 目录名：`<skill-name>/`，小写连字符（如 `release-flow`）
- 主文件：`SKILL.md`（必需）
- 辅助脚本：`scripts/` 子目录下

## 加载方式

| 工具 | 加载方式 |
|------|----------|
| Hermes | `hermes -s <skill-name>` |
| QClaw | 自动读取 `skills/*/SKILL.md` |
| Claude Code | 通过 AGENTS.md 引用 |
| 其他工具 | 在 AGENTS.md 中添加引用路径 |

## 编写指南

参考 `_template/SKILL.md` 开始编写。核心原则：

1. **一个 skill 只做一件事** — 不要把多个无关职责塞进一个 skill
2. **写明触发条件** — 什么情况下应该使用这个 skill
3. **写明输出格式** — skill 产出的文件应该长什么样
4. **保持可组合** — skill 之间可以串联，不要硬编码依赖
