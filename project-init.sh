#!/bin/bash
# Spec-Driven Project Template — 项目初始化脚本
#
# 用法:
#   ./project-init.sh <project-name> [target-dir]
#
# 示例:
#   ./project-init.sh my-data-pipeline ~/projects/my-data-pipeline

set -e

PROJECT_NAME="${1:?Usage: ./project-init.sh <project-name> [target-dir]}"
TARGET_DIR="${2:-./$PROJECT_NAME}"
TEMPLATE_REPO="https://github.com/qiangsheng-org/spec-driven-project-template.git"
SCAFFOLD_REPO="https://github.com/LucasGuoo/agent-scaffold.git"

echo "=== 初始化项目: $PROJECT_NAME ==="

if git clone --depth 1 "$TEMPLATE_REPO" "$TARGET_DIR" 2>/dev/null; then
    echo "  ✓ 从 GitHub 模板仓库克隆"
else
    echo "  ✗ 克隆失败，请检查网络连接"
    exit 1
fi

cd "$TARGET_DIR"
rm -rf .git

# 替换项目名占位符
for f in README.md CHANGELOG.md CONTRIBUTING.md; do
    if [ -f "$f" ]; then
        sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$f"
    fi
done

# 创建 CLAUDE.md -> AGENTS.md 软链接（兼容 Claude Code）
ln -sf AGENTS.md CLAUDE.md

# === 安装 agent-scaffold（可选） ===
if command -v git &>/dev/null; then
    read -p "是否安装 agent-scaffold skills? (Y/n): " INSTALL_SCAFFOLD
    INSTALL_SCAFFOLD=${INSTALL_SCAFFOLD:-Y}
    if [[ "$INSTALL_SCAFFOLD" =~ ^[Yy]$ ]]; then
        echo ""
        echo "--- 安装 agent-scaffold ---"
        SCAFFOLD_TMP="$(mktemp -d)"
        if git clone --depth 1 "$SCAFFOLD_REPO" "$SCAFFOLD_TMP" 2>/dev/null; then
            echo "  ✓ agent-scaffold 下载完成"

            # 检测当前环境的 Agent 工具并安装对应平台
            PLATFORM="generic"

            # QClaw / OpenClaw
            if command -v openclaw &>/dev/null || [ -d "$HOME/.qclaw" ]; then
                PLATFORM="qclaw"
                echo "  → 检测到 QClaw"
            # WorkBuddy
            elif [ -d "$HOME/.workbuddy" ] && ! command -v openclaw &>/dev/null; then
                PLATFORM="workbuddy"
                echo "  → 检测到 WorkBuddy"
            # Claude Code
            elif command -v claude &>/dev/null; then
                PLATFORM="claude-code"
                echo "  → 检测到 Claude Code"
            # Trae IDE
            elif [ -d "$HOME/.trae" ]; then
                PLATFORM="trae"
                echo "  → 检测到 Trae IDE"
            # Codex
            elif command -v codex &>/dev/null || [ -d "$HOME/.codex" ]; then
                PLATFORM="codex"
                echo "  → 检测到 Codex"
            fi

            bash "$SCAFFOLD_TMP/platforms/$PLATFORM/install.sh" "$TARGET_DIR"
            echo "  ✓ agent-scaffold 安装完成（平台：$PLATFORM）"
        else
            echo "  ⚠ agent-scaffold 下载失败，跳过。可稍后手动安装："
            echo "    git clone $SCAFFOLD_REPO && bash agent-scaffold/platforms/<your-tool>/install.sh ."
        fi
        rm -rf "$SCAFFOLD_TMP"
    fi
else
    echo "  ⚠ 未检测到 git，跳过 agent-scaffold 安装"
fi

# 清理模板内置 skills 目录（已由 agent-scaffold 接管）
if [ -d "skills" ]; then
    rm -rf skills
    echo "  ✓ 已清理内置 skills 目录（由 agent-scaffold 接管）"
fi

echo ""

# 初始化新 git 仓库
git init
git add -A
git commit -m "chore: init $PROJECT_NAME from spec-driven-project-template"

echo ""
echo "=== 项目初始化完成: $TARGET_DIR ==="
echo ""
echo "下一步:"
echo "  1. 编辑 docs/project-rules.md，填写项目特定规则"
echo "  2. 编辑 docs/constitution.md，填写工具链约束"
echo "  3. 编辑 AGENTS.md，填写技术栈，调整工具兼容性矩阵"
echo ""
echo "  agent-scaffold skills 已安装。Agent 启动后自动识别并加载。"
echo ""
echo "  GitHub 仓库创建:"
echo "    gh repo create YOUR_ORG/$PROJECT_NAME --private"
echo "    git remote add origin git@github.com:YOUR_ORG/$PROJECT_NAME.git"
echo "    git push -u origin main"
