# 项目特定规则

> 项目初始化后必须填写本章节。模板中的内容是示例，按实际情况替换。

## Agent 角色

> 详细定义见 [docs/agent-profiles.md](agent-profiles.md)

| 角色 | Agent / 工具 | 说明 |
|------|-------------|------|
| Planner | （填写，如 Hermes） | 需求分析、方案设计、任务拆解、验收 |
| Implementer | （填写，如 WorkBuddy / Claude Code） | 按 tasks.md 逐条实现 |
| Reviewer | （填写，如 Hermes 另一 profile） | 代码审查、spec 验收 |

## 环境

- 语言/运行时：（填写，如 Python 3.11）
- 包管理器：（填写，如 pip / uv / npm）
- 关键依赖：（填写）
- 运行平台：（填写，如 GitHub Actions / 本地 / 云端）

## 实施调用方式

（填写实施 Agent 的调用命令，例如：）
```bash
# Hermes
hermes -s spec-driven-development --workdir .

# Claude Code
claude --print --dangerously-skip-permissions

# QClaw
# 直接在 QClaw 中打开项目目录
```

## 项目特定约束

（填写项目特有的规则，例如：）
- 所有 API 调用必须设置 proxy
- 配置文件统一用 YAML
- ...

## 工具兼容性

> 详见 [AGENTS.md](../AGENTS.md) 中的工具兼容性矩阵。
> 此处补充项目特有的工具配置。
