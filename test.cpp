#ifdef __APPLE__

#include <iostream>
#include <cassert>
#include "game.h"

HWGame* new_game()
{
  HWGame *game = (HWGame *)malloc(sizeof(HWGame));
  hw_game_new(game);
  return game;
}

void tick_works()
{
  HWGame *game = new_game();
  assert(game->tick_frames == 0);
  assert(game->tick_seconds == 0);
  hw_game_tick(game);
  assert(game->tick_frames == 1);
  assert(game->tick_seconds == 0);
  for (int i = 0; i < 60; i++) {
    hw_game_tick(game);
  }
  assert(game->tick_frames == 0);
  assert(game->tick_seconds == 1);
}

int main() {
  tick_works();
  std::cout << "lit, yo" << std::endl;
  return 0;
}

#endif
