#!/usr/bin/env bash
# 一键安装配套 Skill（仅适用于 WorkBuddy 环境）
# 用法：  bash install-companions.sh
# 自定义目录：  SKILLS_DIR=/path/to/skills bash install-companions.sh
set -euo pipefail

SKILLS_DIR="${SKILLS_DIR:-$HOME/.workbuddy/skills}"
mkdir -p "$SKILLS_DIR"
echo "▶ 配套 Skill 安装目录: $SKILLS_DIR"
echo ""

# 从 GitHub 集合仓库复制其下的 alphaear-* 子技能
install_alphaear_collection() {
  local tmp
  tmp="$(mktemp -d)"
  echo "  • 下载 Awesome-finance-skills 集合 ..."
  if git clone --depth 1 https://github.com/vicenteforever/Awesome-finance-skills.git "$tmp" 2>/dev/null; then
    for d in "$tmp"/skills/alphaear-*; do
      [ -d "$d" ] || continue
      name="$(basename "$d")"
      if [ -d "$SKILLS_DIR/$name" ]; then
        echo "      - $name 已存在，跳过"
      else
        cp -R "$d" "$SKILLS_DIR/$name"
        echo "      + 安装 $name"
      fi
    done
  else
    echo "      ! 集合克隆失败（检查网络 / 代理），请手动安装 alphaear-*"
  fi
  rm -rf "$tmp"
}

single_clone() {
  local repo="$1" name="$2"
  if [ -d "$SKILLS_DIR/$name" ]; then
    echo "  • $name 已存在，跳过"
    return
  fi
  echo "  • 克隆 $name ..."
  if git clone --depth 1 "https://github.com/$repo.git" "$SKILLS_DIR/$name" 2>/dev/null; then
    echo "      + 完成"
  else
    echo "      ! 失败（检查网络 / 代理），请手动: git clone https://github.com/$repo.git $SKILLS_DIR/$name"
  fi
}

echo "【有公开仓库地址的配套】"
install_alphaear_collection
single_clone muxuuu/serenity-skill serenity-skill
single_clone WaterCMY/A-share-watch-copilot a-share-watch-copilot

echo ""
echo "【需在 WorkBuddy 技能市场搜索安装的配套】"
echo "  - a-stock-data            : 技能市场搜索 'a-stock-data'"
echo "  - a-stock-screen          : 技能市场搜索 'a-stock-screen'"
echo "  - industry-chain-analysis : 技能市场搜索 'industry-chain-analysis'"
echo "  - UZI-Skill               : 技能市场搜索 'UZI-Skill'"
echo ""
echo "✅ 完成。重启 / 刷新 WorkBuddy 后，配套 Skill 即生效。"
echo "   缺失推荐类 Skill 时，框架会自动降级（联网搜索 + 公开数据源 + 推理），不中断流水线。"
