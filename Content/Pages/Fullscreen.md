


# Making The Game Fullscreen


There are 3 options for making a game fullscreen.


One option is using the graphicsManager's built in fullscreen functionality.

Another option is to allow window resizing, so the player can press the fullscreen button on the game window.

Another option is to match the game window's size to the user's screen size.


Each option has it's own set of pros and cons, discussed below.

It's likely that you will use a combination of these options, based on your needs.

**Note**: these code examples refer to Game1.Initialize().


### Option 1 - Use graphics.ToggleFullScreen()

```cs
protected override void Initialize()
{
	base.Initialize();
	graphics.ToggleFullScreen();
	graphics.ApplyChanges();
}
```


**Pros**


- Your game will be stretched to match the user's screen resolution.
- No additional code is necessary to ensure your game displays fullscreen.


**Cons**


- If the ratio of your game window doesn't match the user's display ratio, your game will appear distorted.
- You don't have control over how your game will be displayed across different resolutions.
- Textures and Fonts will be stretched as well, usually with blurry results.
- By default the game window's titlebar will be hidden.


### Option 2 - Allow Resizing

```cs
protected override void Initialize()
{
	base.Initialize();
	Window.AllowUserResizing = true;
}
```


**Pros**


- Your game window can be resized to match the user's max display resolution.
- Your game window can be resized to meet the user's preferences.


**Cons**


- Technically, not fullscreen.
- Your game can be displayed at wildly different aspect ratios.
- Consider that the user could resize the window to a vertical portrait mode.
- Or the window could be resized to a very wide and narrow cinema aspect ratio.
- This means you have to program your game's UI to function in these uncommon aspect ratios.
- The window's titlebar **must** be displayed as well, otherwise the user can't resize or fullscreen the game.
- However, you can programmatically set the minimum and maximum resolutions your game window can be resized to.


### Option 3 - Match the User's Display

```cs
protected override void Initialize()
{
	base.Initialize();

	int displayWidth = GraphicsAdapter.DefaultAdapter.CurrentDisplayMode.Width;
	int displayHeight = GraphicsAdapter.DefaultAdapter.CurrentDisplayMode.Height;
	graphics.PreferredBackBufferWidth = displayWidth;
	graphics.PreferredBackBufferHeight = displayHeight;

	this.IsMouseVisible = true;
	Window.IsBorderless = true;
	graphics.ApplyChanges();
}
```


**Pros**


- The game starts fullscreen, without any border or title bar.
- The "professional" option.


**Cons**


- You'll still need to consider how your game displays at uncommon resolutions.
- You **should** provide a way to exit the game.
- The game cannot be resized by the user.


### Summary


In this article we looked at several ways to make your game display fullscreen.


You'll probably use a combination of Option2 and Option3 to allow control over the game window.

Option1 can lead to unpredictable scaling, which can make your game look bad.

However, Option1 pretty much works all the time - so think of it as a last resort.



