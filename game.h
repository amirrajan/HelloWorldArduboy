enum HWButtonState { HWButtonState_NotPressed, HWButtonState_Pressed };

enum HWButtonEvent { HWButtonEvent_Idle, HWButtonEvent_Actuated };

typedef struct {
  uint16_t tick_seconds;
  uint16_t tick_frames;
  HWButtonState up_button_state;
  HWButtonEvent up_button_event;
  HWButtonState down_button_state;
  HWButtonEvent down_button_event;
  HWButtonState left_button_state;
  HWButtonEvent left_button_event;
  HWButtonState right_button_state;
  HWButtonEvent right_button_event;
  HWButtonState a_button_state;
  HWButtonEvent a_button_event;
  HWButtonState b_button_state;
  HWButtonEvent b_button_event;
} HWGame;

void hw_game_new(HWGame *game)
{
  game->tick_seconds = 0;
  game->tick_frames = 0;
  game->up_button_state = HWButtonState_NotPressed;
  game->up_button_event = HWButtonEvent_Idle;
  game->down_button_state = HWButtonState_NotPressed;
  game->down_button_event = HWButtonEvent_Idle;
  game->left_button_state = HWButtonState_NotPressed;
  game->left_button_event = HWButtonEvent_Idle;
  game->right_button_state = HWButtonState_NotPressed;
  game->right_button_event = HWButtonEvent_Idle;
  game->a_button_state = HWButtonState_NotPressed;
  game->a_button_event = HWButtonEvent_Idle;
  game->b_button_state = HWButtonState_NotPressed;
  game->b_button_event = HWButtonEvent_Idle;
}

void hw_game_tick(HWGame *game)
{
  game->tick_frames += 1;

  if (game->tick_frames == 60) {
    game->tick_frames = 0;
    game->tick_seconds += 1;
  }
}
