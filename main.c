// fswatch ADarkRoomArduboy.ino | xargs -n1 -I{} sh ./build.sh

#ifndef ADarkRoomArduboy_ino
#define ADarkRoomArduboy_ino

#include "Arduboy.h"
#include "./Tinyfont.h"
#include "./game.h"

Arduboy _arduboy;
Tinyfont _tinyfont = Tinyfont(_arduboy.sBuffer, 128, 96);
HWGame *_hw_game;

void setup()
{
  _hw_game = (HWGame *)malloc(sizeof(HWGame));
  hw_game_new(_hw_game);
  _arduboy.beginNoLogo();
  _arduboy.setFrameRate(60);
}

void hw_calc_buttons(Arduboy *arduboy, HWGame *game)
{
  if (arduboy->notPressed(B_BUTTON) && game->b_button_state == HWButtonState_Pressed) game->b_button_event = HWButtonEvent_Actuated;
  else game->b_button_event = HWButtonEvent_Idle;

  if (arduboy->pressed(B_BUTTON)) game->b_button_state = HWButtonState_Pressed;
  else game->b_button_state = HWButtonState_NotPressed;

  if (arduboy->notPressed(UP_BUTTON) && game->up_button_state == HWButtonState_Pressed) game->up_button_event = HWButtonEvent_Actuated;
  else game->up_button_event = HWButtonEvent_Idle;

  if (arduboy->pressed(UP_BUTTON)) game->up_button_state = HWButtonState_Pressed;
  else game->up_button_state = HWButtonState_NotPressed;

  if (arduboy->notPressed(DOWN_BUTTON) && game->down_button_state == HWButtonState_Pressed) game->down_button_event = HWButtonEvent_Actuated;
  else game->down_button_event = HWButtonEvent_Idle;

  if (arduboy->pressed(DOWN_BUTTON)) game->down_button_state = HWButtonState_Pressed;
  else game->down_button_state = HWButtonState_NotPressed;

  if (arduboy->notPressed(LEFT_BUTTON) && game->left_button_state == HWButtonState_Pressed) game->left_button_event = HWButtonEvent_Actuated;
  else game->left_button_event = HWButtonEvent_Idle;

  if (arduboy->pressed(LEFT_BUTTON)) game->left_button_state = HWButtonState_Pressed;
  else game->left_button_state = HWButtonState_NotPressed;

  if (arduboy->notPressed(RIGHT_BUTTON) && game->right_button_state == HWButtonState_Pressed) game->right_button_event = HWButtonEvent_Actuated;
  else game->right_button_event = HWButtonEvent_Idle;

  if (arduboy->pressed(RIGHT_BUTTON)) game->right_button_state = HWButtonState_Pressed;
  else game->right_button_state = HWButtonState_NotPressed;
}

void hw_calc(Arduboy *arduboy, Tinyfont *tinyfont, HWGame *game)
{
  hw_calc_buttons(arduboy, game);
  hw_game_tick(game);
}

void hw_draw_framerate(Arduboy *arduboy, Tinyfont *tinyfont, HWGame *game)
{
  char frames[3];
  sprintf(frames, "%u", game->tick_frames);

  char seconds[10];
  sprintf(seconds, "%u", game->tick_seconds);

  tinyfont->setCursor(0, 0);
  tinyfont->print(frames);

  tinyfont->setCursor(0, 8);
  tinyfont->print(seconds);
}

void hw_draw(Arduboy *arduboy, Tinyfont *tinyfont, HWGame *game)
{
  arduboy->clear();
  hw_draw_framerate(arduboy, tinyfont, game);
  arduboy->display();
}

void loop()
{
  if (!(_arduboy.nextFrame())) return;

  hw_calc(&_arduboy, &_tinyfont, _hw_game);
  hw_draw(&_arduboy, &_tinyfont, _hw_game);
}

#endif
