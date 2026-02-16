#!/usr/bin/env fish

set -l STATE_FILE "/tmp/hypr_last_global_ws"

if test "$argv[1]" = '-g'
    set group
    set -e argv[1]
end

set -l active_ws (hyprctl activeworkspace -j | jq -r '.id')

# --- HANDLE TOGGLE (Alt + A) ---
if test "$argv[1]" = "-toggle"
    if test -f "$STATE_FILE"
        set -l last_ws (cat "$STATE_FILE")
        if test "$last_ws" != "$active_ws"
            # Update history to current before jumping
            echo "$active_ws" > "$STATE_FILE"
            hyprctl dispatch workspace "$last_ws"
            exit 0
        end
    end
    exit 0
end

# --- HANDLE WORKSPACE SWITCHING ---
if test (count $argv) -ne 2
    exit 1
end

set -l target_ws ""
if set -q group
    # Logic for group jump
    set target_ws (math "($argv[2] - 1) * 10 + $active_ws % 10")
else
    # Logic for ws jump
    set target_ws (math "floor(($active_ws - 1) / 10) * 10 + $argv[2]")
end

# ONLY update history if we are actually moving to a new workspace
if test "$active_ws" != "$target_ws"
    echo "$active_ws" > "$STATE_FILE"
    hyprctl dispatch $argv[1] "$target_ws"
end
