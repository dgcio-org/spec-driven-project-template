#!/bin/bash
# Spec-Driven Project Template — 项目初始化脚本
#
# 用法:
#   ./project-init.sh <project-name> [target-dir]
#
# 示例:
#   ./project-init.sh my-data-pipeline ~/projects/my-data-pipeline
#
# 从 qiangsheng-org/spec-driven-project-template 初始化新项目。
# 支持两种方式：
#   1. 从 GitHub 克隆模板（在线）
#   2. GitHub UI: Use this template

set -e

PROJECT_NAME="${1:?Usage: ./project-init.sh <project-name> [target-dir]}"
TARGET_DIR="${2:-./$PROJECT_NAME}"
TEMPLATE_REPO="https://github.com/qiangsheng-org/spec-driven-project-template.git"

echo "=== 初始化项目: $PROJECT_NAME ==="

# 克隆模板（浅克隆，不保留 git 历史）
if git clone --depth 1 "$TEMPLATE_REPO" "$TARGET_DIR" 2>/dev/null; then
    echo "  -> 从 GitHub 模板仓库克隆"
else
    echo "  -> 克隆失败，请检查网络连接"
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

# 初始化新 git 仓库
git init
git add -A
git commit -m "chore: init $PROJECT_NAME from spec-driven-project-template"

echo ""
echo "=== 项目初始化完成: $TARGET_DIR ==="
echo ""
echo "下一步："
echo "  1. 创建 GitHub 仓库: gh repo create qiangsheng-org/$PROJECT_NAME --private"
echo "  2. 推送: git remote add origin ... && git push -u origin main"
echo "  3. 编辑 docs/project-rules.md，填写项目特定规则"
echo "  4. 开始第一个 spec"
