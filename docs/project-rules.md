# 项目特定规则

> 项目初始化后必须填写本章节。模板中的内容是示例，按实际情况替换。

## Agent 角色

> 详细定义见 [docs/agent-profiles.md](agent-profiles.md)

| 角色 | Agent / 工具 | 说明 |
|------|-------------|------|
| Planner | （填写，如 QClaw） | 需求分析、方案设计、任务拆解、验收 |
| Implementer | （填写，如 Claude Code / Trae / Codex） | 按 tasks.md 逐条实现 |
| Reviewer | （填写，如 QClaw 另一窗口） | 代码审查、spec 验收 |

## 项目信息

- 项目目标：（填写，如"采集广东省工信厅公告并推送到钉钉"）
- 数据源：（填写 URL 和爬取方式，如 `https://gdii.gd.gov.cn/ → requests HTML`）
- 目标输出：（填写，如"钉钉 AI 表格 / 微信公众号 / CSV 文件"）
- 调度频率：（填写，如"北京时间每日 12:00 和 18:00"）

## 环境

- 语言/运行时：（填写，如 Python 3.11）
- 包管理器：（填写，如 pip / uv）
- CI/CD：GitHub Actions
- 关键依赖：（填写，如 requests, jina-reader, dingtalk-stream）

## 数据采集规范

- 去重策略：（填写，如"日期滑窗(7天) + URL 缓存双防线"）
- 反爬策略：（填写，如"Jina Reader 代理 或 requests 直爬，间隔 ≥ 5s"）
- 异常处理：（填写，如"3 次重试后跳过，CI 日志记录异常数据源"）
- 数据格式：（填写，如"JSON: {title, url, date, source, content}"）

## 实施调用方式

```bash
# QClaw
# 直接在 QClaw 中打开项目目录

# Claude Code
claude

# Trae IDE
# 用 Trae 打开项目文件夹

# Codex
codex
```

## 工具兼容性

> 详见 [AGENTS.md](../AGENTS.md) 中的工具兼容性矩阵。
