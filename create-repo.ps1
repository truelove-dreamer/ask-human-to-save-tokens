# Create the GitHub repo under truelove-dreamer and push the initial commit.
# Run in your NORMAL terminal. Prerequisite: `gh auth refresh -h github.com` (the stored token is invalid).
$ErrorActionPreference = "Stop"
$gh = "C:\Program Files\GitHub CLI\gh.exe"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$owner = "truelove-dreamer"
$repo = "ask-human-to-save-tokens"
$desc = "Agent 行为技能：当某件事模型做会烧很多 token、但人类能轻而易举解决时，用提问把它交给人类（双条件门）。跨宿主 SKILL.md（Agent Skills 标准）。"

Push-Location $root
try {
  & $gh repo create "$owner/$repo" --public --source . --remote origin --push --description $desc
  if ($LASTEXITCODE -ne 0) { throw "gh repo create failed for $repo" }
  Write-Host ("OK: created and pushed " + $owner + "/" + $repo)
} finally {
  Pop-Location
}
