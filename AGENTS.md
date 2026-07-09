# {{PROJECT_NAME}}

> DGCIO 组织项目。Agent 进入项目时第一份必读文件。

## 项目定位

（填写，如：政府公告爬虫 / 政策推送服务 / 企业信息采集 / 数据看板）

## 技术栈

- 语言：Python 3.11
- 调度：GitHub Actions
- 数据采集：requests / httpx / Jina Reader / Playwright（按需）
- 数据输出：（填写，如：钉钉 AI 表格 / 微信公众号 / JSON 文件）

## 开发范式

**Spec-Driven Development** — 先方案后代码，不跳步。

由 [agent-scaffold](https://github.com/LucasGuoo/agent-scaffold) 提供标准化 skills，首次进入项目时安装：

```bash
git clone https://github.com/LucasGuoo/agent-scaffold.git /tmp/agent-scaffold
bash /tmp/agent-scaffold/platforms/qclaw/install.sh .
```

> 完整工作流说明见 [docs/workflow.md](docs/workflow.md)。

## 变更决策树（每次编码前必读）

```
改动来了 →
  纯文档？→ 直接 commit
  单文件 <50 行 + 无 API/架构变化？→ 直接改 + CHANGELOG
  配置/依赖变更？→ 验证 + CHANGELOG
  小功能（≤2 文件、无架构影响）？→ change-proposal.md
  多文件 / 新功能 / 架构变化？→ 完整 spec 流程
  不确定？→ 走 spec（安全侧）
```

### Spec 流程（5 步）

```
proposal.md → 你确认 → design.md → 你确认 → tasks.md → 你确认 → 逐条实现 → verdict.md → 归档
```

每步确认后才进入下一步。

## Spec 生命周期

用文件存在性判断状态，不额外建状态文件：
- `proposal.md` + `design.md` → 方案待确认
- `tasks.md` → 已确认，待实现
- `verdict.md` 且 PASS → 可以归档
- `active/` → 未归档；`archive/` → 已归档

## Agent 间切换

换 Agent 工具时，当前 Agent 在 `tasks.md` 末尾补充接手上下文。新 Agent `git pull` 即可接手。

## 关键路径

| 用途 | 路径 |
|------|------|
| 项目宪法 | docs/constitution.md |
| 项目特定规则 | docs/project-rules.md |
| 进行中的方案 | specs/active/YYYY-MM-DD-slug/ |
| 已完成的方案 | specs/archive/ |
| 方案模板 | specs/template/ |
| 变更记录 | CHANGELOG.md |
| 架构决策 | docs/decisions/ADR-NNN.md |

## CHANGELOG 规范

任何非纯文档变更，commit 后更新 CHANGELOG.md（Keep a Changelog 格式）。

| 类型 | 分类 |
|------|------|
| 新功能 | `Added` |
| 改进 | `Changed` |
| 修复 | `Fixed` |
| 移除 | `Removed` |

## 提交约定

- Conventional Commits：`type(scope): description`
- Type：feat / fix / docs / spec / refactor / chore

## 数据安全

- `.env` 不入 git
- 密钥通过 GitHub Secrets 或本地 `.env` 管理
- 爬虫不得发送含真实用户信息的请求
- 原始采集数据不可变
