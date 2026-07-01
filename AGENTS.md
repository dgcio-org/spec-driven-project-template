# AGENTS.md

## 开发范式

本项目采用 **Spec-Driven Development**。
先讨论确认方案，再写代码。不跳步。

## 角色分工

- **需求方**：提出需求，审阅方案，最终验收
- **架构 Agent**：需求分析，方案设计，任务拆解，验收
- **实施 Agent**：按 tasks.md 逐条实现

具体谁担任哪个角色由项目自行定义（见 docs/project-rules.md）。

## 何时走 Spec 流程

| 场景 | 流程 |
|------|------|
| 新功能 / 多文件改动 | 完整 spec 流程（见 docs/workflow.md） |
| 简单 bug（单文件 <50行） | 直接修 + CHANGELOG |
| 配置变更 | 验证 + CHANGELOG |
| 依赖升级 | 测试 + CHANGELOG |
| 纯文档 | 直接 commit |

完整判断树见 docs/workflow.md

## 关键路径

| 用途 | 路径 |
|------|------|
| 进行中的方案 | specs/active/YYYY-MM-DD-slug/ |
| 已完成的方案 | specs/archive/ |
| 方案模板 | specs/template/ |
| 变更记录 | CHANGELOG.md |
| 架构决策记录 | docs/decisions/ADR-NNN.md |
| 完整规范说明 | docs/workflow.md |
| 项目特定规则 | docs/project-rules.md |

## 提交约定

- Conventional Commits：type(scope): description
- Type：feat / fix / docs / spec / refactor / chore
- 每个 Agent 用自己的身份签名提交

## 安全约定

- .env 不入 git
- 密钥由用户自行管理
- 不在聊天中传递凭证

## 开工前标准操作

每次开始任务前：
```bash
git pull origin main          # 拉最新
head -30 CHANGELOG.md         # 了解最近变更
```

## 项目特定规则

见 docs/project-rules.md
