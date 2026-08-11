# 配套技能清单（Companion Skills）

本框架是「编排层」。**完整能力**依赖以下配套 Skill；但**缺失时不会中断**——框架自动降级（用联网搜索 + 公开数据源 + 推理替代），仍可产出一份可用的投研报告。

> 核心认知：本框架的价值在于「流程」本身。任何 Agent（WorkBuddy / Codex / Claude Code / Cursor …）用其原生的联网搜索、公开数据源与推理能力，都能跑通 8 阶段；配套 Skill 只是 WorkBuddy 环境下的"加速件"。

## 清单

| 阶段 | 角色 | 配套 Skill | 推荐度 | 安装来源 |
|---|---|---|---|---|
| ② 数据筛选 | 数据员 | `a-stock-data` | 推荐 | WorkBuddy 技能市场搜索 `a-stock-data` |
| ② 候选池 | 数据员 | `a-stock-screen` | 可选 | WorkBuddy 技能市场搜索 `a-stock-screen` |
| ③ 催化验证 | 情报员 | `alphaear-news` | 推荐 | [vicenteforever/Awesome-finance-skills](https://github.com/vicenteforever/Awesome-finance-skills) |
| ④ 产业链 | 行业研究员 | `industry-chain-analysis` | 推荐 | WorkBuddy 技能市场搜索 `industry-chain-analysis` |
| ④ 产业链 | 行业研究员 | `serenity-skill` | 可选 | [muxuuu/serenity-skill](https://github.com/muxuuu/serenity-skill) |
| ⑤ 委员会 | 投资委员会 | `UZI-Skill` | 推荐 | WorkBuddy 技能市场搜索 `UZI-Skill` |
| ⑦ 持续跟踪 | 盯盘风控员 | `a-share-watch-copilot` | 可选 | [WaterCMY/A-share-watch-copilot](https://github.com/WaterCMY/A-share-watch-copilot) |
| ⑦ 持续跟踪 | 盯盘风控员 | `alphaear-signal-tracker` | 可选 | [vicenteforever/Awesome-finance-skills](https://github.com/vicenteforever/Awesome-finance-skills) |

> 说明：推荐类配套若缺失，框架会用降级路径接管，产出质量略降但不中断；可选类缺失无影响。

## WorkBuddy：一键安装

```bash
# 方式一：脚本自动安装（仅安装有公开仓库地址的配套）
bash install-companions.sh

# 方式二：手动逐个克隆（以 a-share-watch-copilot 为例）
git clone https://github.com/WaterCMY/A-share-watch-copilot.git \
  ~/.workbuddy/skills/a-share-watch-copilot
```

其余 `a-stock-data` / `a-stock-screen` / `industry-chain-analysis` / `UZI-Skill` 在 WorkBuddy 技能市场搜索安装即可。

## 其他 Agent（Codex / Claude Code / Cursor / Windsurf / Cline / Roo Code / GitHub Copilot）

配套 Skill 是 WorkBuddy 运行时概念，这些 Agent **无法直接"安装"它们**。在这些环境里，框架以「方法论」运行：

1. 用该 Agent 原生的联网搜索、公开数据源（东方财富 / 同花顺 / 公司公告 / 交易所）与推理能力跑通 8 阶段；
2. 推荐类 Skill 缺失时，本框架的降级路径自动接管；
3. 你也可以在对应 Agent 的指令文件（`CLAUDE.md` / `AGENTS.md`）中追加一句提示，例如：
   > 需要行情 / 财务 / 新闻数据时，优先联网检索东方财富、同花顺、公司公告等公开来源，并标注引用时间与出处。

这样即使零配套 Skill，陌生人也能立即使用本框架产出结构化投研报告。
