


# Managing Game State


In this article, we will explore the concept of game state, and how to manage a game's state.

Let's get started.


### What is Game State?


In the simplest terms, Game State refers to a description of the game's data at a given point in time.

The game's data includes information about your hero, the level, enemies, items, etc...

When you save a game's data, you are saving a specific state of the game at a specific point in time.

Think of this like a photograph of the game - this is what the game looked like at that particular moment.


### Managing Game State


Managing a Game's State can be tricky - your game likely has a title or logo animation, with a menu.

From that menu the player could choose to load a game or start a new game or change the game's options.

Then once the player is in game, they could pause the game or open an inventory menu.

How do you manage all these menus and aspects of the game? There are several approaches to this.


For this getting started guide, I'm only going to explain one approach, which I believe to be the best.

This approach uses **Screens** and a **ScreenManager** to handle a game's various states.

A screen can be thought of as a section of the game. ScreenManager then loads and unloads these sections.


For example, in the game RescueDog there are 3 screens: a Boot screen, a Game screen, and a Won screen.

The Boot screen displays the MonoGame logo, then fades out and loads the Game screen.

The Game screen is where the player controls the dog, explores the level, and beats the game.

When the player beats the game, the Won screen is loaded.

The Won screen displays a simple message, then loads the Boot screen - resetting the game.


### Notes on Screens and ScreenManager


Using this approach offers several advantages over other ways of managing a game's state.

Each screen can load and unload it's own content, making it easier to manage how much memory the game requires.

Each screen can perform intro and outro animations, allowing the screen to transition onto or off of other screens.


Screens can be stacked on top of each other, and input can be limited to one screen or several.

A screen's Update() method can be blocked, or ignored, easily 'pausing' that screen.

Screens can load other screens through ScreenManager, and remove themselves at any time.

Best of all, you can change how Screens and ScreenManager function to meet your specific requirements.<Br>


### Summary


In this article we discussed GameState and Managing GameState.

We explored one approach to managing game state using Screens and ScreenManager.



