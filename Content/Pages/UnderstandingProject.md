# Understanding the Project

## Program.cs

Open up `Program.cs`.

```cs
using (var game = new Game1())
    game.Run();
```

This is the entry point of the project. It creates and runs a `Game1`.
The `Run` method kicks off the game loop,
which schedules draw and update calls for the game.
You won't need to make any changes in this file to create your game,
for that we need to check out `Game1`.

## Game1.cs

Open up the `Game1.cs` file.

Let's go through the code

```cs
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
```

The first thing you might notice is that MonoGame types live in the
`Microsoft.Xna.Framework` namespace. The reason for this is compatibility
with Microsofts discontinued XNA framework.
For more information on the relation between MonoGame and XNA see [About MonoGame](AboutMonoGame.md).

```cs
public class Game1 : Game
```

`Game1` inherits from MonoGame's `Game` class. By overriding the methods
from `Game` you can hook into the [game loop](https://gameprogrammingpatterns.com/game-loop.html) that MonoGame runs.

You'll typically want to override at least **Initialize(), LoadContent(), Update(), and Draw()**. We'll go over them one by one, but first the `Game1` constructor.

### Constructor

```cs
public Game1()
{
    _graphics = new GraphicsDeviceManager(this);
    Content.RootDirectory = "Content";
	IsMouseVisible = true;
}
```

`GraphicsDeviceManager` is used to create a `GraphicsDevice`, the main
class to run graphics operations in MonoGame. We create and assign an 
instance in the constructor so we can change settings before a
`GraphicsDevice` is created. We pass our `Game` instance in the constructor
so `Game` can use this `GraphicsDeviceManager` to get a `GraphicsDevice`.

`Content` is a property of `Game` of type `ContentManager`. `ContentManager`
is the type used to load content for your game. Since MonoGame templates
build content into the `Content` folder we set the root folder for `ContentManager` to `Content` here.

`Game` has some configuration properties like `IsMouseVisible`.
You can set this at any time to show or hide the mouse cursor.
It's initialized to `true` by default, so the above call is not really necessary. `Game` has a `Window` property of type `GameWindow` where
more configuration properties are exposed, such as the window title (`Window.Title`)
and whether users can resize the window (`Window.AllowUserResizing`).

### Initialize()

Initialize is called once, after the game class is constructed.
Use it for any non-graphical set up of your game, to configure
`GraphicsDeviceManager` properties for `GraphicsDevice` creation
or to load non-graphical resources.

```cs
protected override void Initialize()
{
    _graphics.PreferredBackBufferWidth = 1280;
    _graphics.PreferredBackBufferHeight = 720;
    base.Initialize();
}
```	

Make sure you call `base.Initialize()` at the end of your `Initialize` implementation.
This will create the `Game.GraphicsDevice` with the settings from your 
`GraphicsDeviceManager` and will call `LoadContent`.

Some other things you might want to do in Initialize include:
- Set the game window title: `Window.Title = "My First Game"`
- Hide the mouse cursor: `IsMouseVisible = false`.
- Let players resize the game window: `Window.AllowUserResizing = true`.
- Set the game to [fullscreen](Fullscreen.md). 

### LoadContent()

```cs
protected override void LoadContent()
{
    _spriteBatch = new SpriteBatch(GraphicsDevice);
}
```	

Load content is called by `Game.Initialize` (the `base.Initialize` call you made in your `Game1.Initialize`).
This is where you should load graphical assets required by your game.

The templates create an instance of `SpriteBatch`. **SpriteBatch** is used to draw textures and text to the game window. For simple 2D games `SpriteBatch`
is powerful enough to handle all rendering.

We explore `SpriteBatch` more in-depth in [SpriteBatch](SpriteBatch.md).

### Update()

```cs
protected override void Update(GameTime gameTime)
{
    if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed || Keyboard.GetState().IsKeyDown(Keys.Escape))
    	Exit();
    base.Update(gameTime);
}
```	

The update method is called every frame your game runs.

For a game running at 60 frames per second, **Update() is called every 16ms**.

By default, Monogame runs at 60 frames per second - but this can be changed.

Update() methods are commonly used to track, inspect, change, and calculate game data or state.

If you inspect this method you see the first line of code contains an if statement that reads input.

In this case, input and update code exist in the same method.

It is common to seperate input and update code into different methods.


Let's inspect the if statement in update():


```cs
if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed || Keyboard.GetState().IsKeyDown(Keys.Escape))
	Exit();
```	


Here you can see the game getting the input state of any attached gamepad or keyboard.

Then the state is checked to see if the user is pressing the gamepad's back button or keyboard's escape key.

Either input triggers the **Exit()** method, which exits the game and closes the game window.


Notice the code _PlayerIndex.One_. 

The game is getting input from the gamepad controller associated with PlayerIndex.One.

This is usually the gamepad that was plugged in first.

The gamepad plugged in second would be associated with PlayerIndex.Two.

You could target player 2's controller using the code _PlayerIndex.Two_.


### Inspect Draw()

```cs
protected override void Draw(GameTime gameTime)
{
	GraphicsDevice.Clear(Color.CornflowerBlue);
	base.Draw(gameTime);
}
```	


		
Draw() is called each frame, just like Update().

However, Draw() is called **after** Update().

So in terms of execution, each frame your game calls Update(), then Draw().

At 60 frames per second, this means **every 16ms both Update() and Draw() are called**.


Divided evenly, this means Update() and Draw() each have 8ms to complete their work.

Because of time constraints like 16ms, the Update and Draw methods should be kept as fast as possible.

By default Monogame runs at 60 frames per second, or 16ms each frame.

If Update and Draw take less than 16ms to finish, Monogame will wait until the next frame should be called.


So what does draw actually do?

Well, **draw is where the game should draw textures, sprites, images, meshes, and text to the screen**.

Let's change the background color to something else, like black:


```cs
GraphicsDevice.Clear(Color.Black);
```	


### Summary


And that's it! You should now have a solid understanding of how the game class operates.

We learned how to:


- change the size of the game window
- show or hide the mouse cursor
- disable or allow resizing of the game window
- rename the game window
- change the background color of your game



