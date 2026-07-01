# Spec-Driven Development 协作范式

## 核心原则

1. **不跳步**：没讨论清楚不写代码
2. **先方案后代码**：spec 先行（proposal → design → tasks），实施在后
3. **按改动规模选择流程**：小改动轻量，大改动严谨
4. **零工具依赖**：纯 markdown + git 约定

## 角色分工

| 角色 | 职责 |
|------|------|
| 需求方 | 提出需求，审阅方案，最终验收 |
| 架构 Agent | 需求分析，方案设计，任务拆解，验收 |
| 实施 Agent | 按 tasks.md 逐条实现、测试 |

具体谁担任哪个角色由每个项目在 `docs/project-rules.md` 中定义。

---

## 变更流程决策树

```
改动来了
  │
  ├─ 纯文档？ ────────────────▶ 直接 commit
  ├─ 单文件 <50 行？ ─────────▶ 直接 fix + CHANGELOG
  ├─ 配置变更（改 yaml）？ ───▶ 验证 + CHANGELOG
  ├─ 依赖升级？ ─────────────▶ 测试 + CHANGELOG
  ├─ 多文件 / 新功能？ ───────▶ 完整 spec 流程
  └─ 不确定？ ───────────────▶ 走 spec（安全侧）
```

---

## 完整 Spec 流程（7 步）

### Phase 1: 讨论
- 需求方提出需求或 Agent 发现问题
- 架构 Agent 退一步问清楚：具体要解决什么？边界在哪？
- 不急着写方案，先对齐认知

### Phase 2: 方案起草
架构 Agent 创建 `specs/active/YYYY-MM-DD-slug/`：

- `proposal.md`：背景、目标、影响范围、不做什么
- `design.md`：架构决策、配置格式、数据流、接口设计、错误处理

写完后提交需求方审阅。

### Phase 3: 确认
- 需求方审阅 proposal + design
- 不通过 → 修改方案，重新审阅
- 通过 → 进入任务拆解

### Phase 4: 任务拆解
架构 Agent 写 `tasks.md`：

- 每个 task 必须写清**文件路径 + 预期行为**
- 实施 Agent 没有项目上下文，task 要自包含
- 附验收标准清单

### Phase 5: 委派执行
架构 Agent 调实施 Agent，按照项目 `docs/project-rules.md` 中定义的调用方式执行。

实施 Agent 按 tasks.md 逐条实现，完成后总结结果。

### Phase 6: 验收
架构 Agent 检查实施结果：

- 检查 git diff 是否符合 design.md
- 运行测试或端到端验证
- 写 `verdict.md`：PASS/FAIL、测试结果、遗留问题
- 失败 → 修 tasks.md，重试

### Phase 7: 归档
- 移动 spec 目录到 `specs/archive/`
- 更新 `CHANGELOG.md`
- 如有架构决策 → 写 ADR 到 `docs/decisions/`
- git commit + push

---

## 文件结构

```
specs/
├── template/                      # 模板
│   ├── proposal.md
│   ├── design.md
│   └── tasks.md
├── active/                        # 进行中的 spec
│   └── YYYY-MM-DD-slug/
│       ├── proposal.md
│       ├── design.md
│       ├── tasks.md
│       └── verdict.md
└── archive/                       # 已完成的 spec
    └── YYYY-MM-DD-slug/
```

---

## CHANGELOG 规范

采用 [Keep a Changelog](https://keepachangelog.com/) 格式，语义化版本。

### 格式

```markdown
## [版本号] - YYYY-MM-DD

### Added        — 新增功能
### Changed      — 行为变更
### Deprecated   — 即将废弃
### Removed      — 已移除
### Fixed        — Bug 修复
### Security     — 安全修复
```

### 版本号规则

- MAJOR：架构变更、不兼容的配置格式变化
- MINOR：新功能、新集成
- PATCH：bug 修复、小改进、文档更新

### 什么记、什么不记

| 记 | 不记 |
|----|------|
| 功能变更 | 纯文档改动 |
| Bug 修复 | 每周例行检查（无问题） |
| 配置变更 | 格式化/注释修改 |
| 依赖升级 | 临时调试代码 |

---

## ADR（架构决策记录）

### 何时写 ADR

| 写 ADR | 不写 |
|--------|------|
| 技术选型有多个备选方案 | 唯一明显的选择 |
| 决策会影响未来开发方向 | 实现细节 |
| 团队需要理解"为什么" | 临时解决方案 |

### 格式

```markdown
# ADR-NNN: 标题

**日期**: YYYY-MM-DD
**状态**: 提议 / 已接受 / 已废弃
**决策者**: （谁做的决策）

## 背景
## 备选方案
### 方案 A
- 优点：
- 缺点：
### 方案 B
## 决策
## 后果
```

### 编号规则

从 001 开始递增。文件名：`docs/decisions/ADR-001-slug.md`

---

## 多 Agent 协作机制

### Git 分支策略

| 改动类型 | 分支 | 合并方式 |
|----------|------|----------|
| 新功能/重构 | `feat/xxx` | PR → review → merge |
| Bug 修复 | `fix/xxx` | PR → review → merge |
| 小修小改 (<50行) | `chore/xxx` | 可直接 push 或轻量 PR |
| 紧急修复 | `hotfix/xxx` | PR（加速 review） |
| 文档 | 直接 main | 直接 push |

### 开工前标准操作

每个 Agent 开始任务前：
```bash
git pull origin main
head -30 CHANGELOG.md
```

### 提交用 Agent 身份

```bash
git commit -m "type(scope): description" \
  --author="Agent Name <agent@qiangsheng-org.local>"
```

### Agent 间交互方式

| 场景 | 方式 |
|------|------|
| 简单确认 | PR/Issue 中 @mention |
| 需要讨论 | 开 GitHub Issue |
| 结构化任务分配 | GitHub Projects / Kanban |

---

## 项目管理（GitHub 原生功能）

### Branch Protection

对 `main` 分支建议设置：
- Require a pull request before merging
- Require status checks to pass
- Require conversation resolution

### CODEOWNERS

按目录分配代码负责人，GitHub 自动分配 PR reviewer：

```
# 示例
*                       @arch-agent
specs/                  @arch-agent
docs/                   @arch-agent
src/                    @impl-agent
```

### GitHub Projects

用看板跟踪 spec/issue 状态：
- Columns: Backlog → In Progress → Review → Done
- 自动规则：Issue 创建 → Backlog；PR merged → Done

### Issue 模板

Org 级的 `.github` 仓库提供默认 Issue 模板（bug_report、feature_request、spec_proposal）。

---

## 定期维护

### 每周健康检查

1. 是否有超过 7 天未归档的 spec？
2. 是否有超过 3 天未 review 的 PR？
3. Pipeline/服务是否正常运行？（如适用）

### 每月依赖检查

```bash
pip list --outdated  # 或其他包管理器
```

发现问题后走对应流程（修复 → CHANGELOG）。

---

## 与 Org 治理的关系

本规范由 `qiangsheng-org/.github` 仓库补充 Org 级文件（CODE_OF_CONDUCT、SECURITY、SUPPORT 等），所有项目自动继承。

## 参考

- [Keep a Changelog](https://keepachangelog.com/)
- [Architecture Decision Records](https://adr.github.io/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [OpenSpec](https://github.com/Fission-AI/OpenSpec)
- [GitHub Spec Kit](https://github.com/github/spec-kit)
