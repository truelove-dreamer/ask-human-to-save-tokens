# ask-human-to-save-tokens

把「模型费 token、人类轻而易举」的活交给人类——一个跨宿主（host-neutral）的 Agent 行为策略技能。

技能本体遵循开放的 [Agent Skills](https://agentskills.io) 标准（SKILL.md），一份文件在 ZCode、Claude Code、DeepSeek Harness 及其他兼容智能体中直接可用，无需改动。

## 它解决什么

模型在任务里最贵的消耗，往往发生在「本可以一句话问人类」的地方：猜用户意图猜错导致整段返工、反复读长文/大范围搜索只为找一个只有用户知道的答案、在品味取舍上生成冗长的对比分析……

这个技能只在**双条件同时成立**时才打断你：

- **条件 A · 模型侧昂贵**：不提问继续做，预计还要烧很多 token（只算"从此刻起还要花的"，不算已烧掉的）。
- **条件 B · 人类侧轻而易举**：人一句话就能解决——回答是非、从 ≤3 个选项里选、贴一段已知内容、瞄一眼屏幕说结论，不需要思考、查资料或开工具。

只满足一边就不问：人做也很费劲的事（精读对比长文）该模型自己做；模型做几乎免费的事（机械复制）不值得打扰。其余部分还给出了完整的**该问 / 不该问清单**、**提问格式规范**（一次批量问完、每题 ≤3 个选项、附"不确定就回继续"的可跳过兜底）和**交互式 vs 后台场合规则**，把对你注意力的打扰压到最低。

## 安装

把仓库里的 `skills/ask-human-to-save-tokens/` **整个目录**（含 SKILL.md）复制到当前宿主对应的 skills 根目录：

| 宿主 | 目标目录 |
|---|---|
| DeepSeek Harness (DSH) | `~/.dsh/skills/`（Windows：`C:\Users\<你>\.dsh\skills\`） |
| ZCode | `~/.agents/skills/` 或 `<项目>/.agents/skills/` |
| Claude Code | `~/.claude/skills/` 或 `<项目>/.claude/skills/` |
| 其他 Agent Skills 宿主 | 该宿主的 skills 目录（见 [agentskills.io](https://agentskills.io) 约定） |

安装后的形态：`<skills根>/ask-human-to-save-tokens/SKILL.md`

## 使用

无需手动调用。任务中一旦出现「模型做很贵、人类做轻而易举」的时刻，agent 会依据技能描述自动加载，并按决策门决定是否提问；也可以直接说"加载 ask-human-to-save-tokens 技能"强制启用。

## 目录结构

```
ask-human-to-save-tokens/
├── README.md
├── LICENSE
├── create-repo.ps1        # 一键创建 GitHub 仓库（truelove-dreamer 下）并推送
└── skills/
    └── ask-human-to-save-tokens/
        └── SKILL.md
```

## License

MIT © 2026 truelove-dreamer

---

## English

**ask-human-to-save-tokens** is a host-neutral agent skill: hand off work that is token-expensive for the model yet effortless for a human. It interrupts only when both conditions hold — continuing alone would burn many tokens, and the human can settle it in one sentence with zero preparation (answer yes/no, pick from ≤3 options, paste known content, glance at a screen). Includes should-ask / should-not-ask catalogs, a low-friction question format (batched, option-first, skippable), and interactive-vs-background rules. Written as a portable [Agent Skills](https://agentskills.io) `SKILL.md`; copy `skills/ask-human-to-save-tokens/` into your host's skills directory (DSH: `~/.dsh/skills/`, ZCode/Claude Code: `~/.agents/skills/` or `~/.claude/skills/`).
