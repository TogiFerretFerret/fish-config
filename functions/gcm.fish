function gcm
    git commit -m "$( copilot -p "Generate a concise conventional commit message for staged changes based on git diff --staged. Output ONLY the raw message text, no markdown or filler." --model gpt-5.1-codex-mini --log-level none --no-auto-update)"
end
