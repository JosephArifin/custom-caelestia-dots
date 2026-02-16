import kitty.fast_data_types as f
from kitty.boss import Boss


def main(args: list[str]) -> None:
    pass


def handle_result(args, answer, target_window_id, boss: Boss) -> None:
    os_window_id = f.current_focused_os_window_id()
    curr_opacity = f.background_opacity_of(os_window_id)
    new_opacity = 0.9 if curr_opacity == 1.0 else 1.0
    # boss.set_background_opacity takes just the opacity value as a string
    boss.set_background_opacity(str(new_opacity))


handle_result.no_ui = True
