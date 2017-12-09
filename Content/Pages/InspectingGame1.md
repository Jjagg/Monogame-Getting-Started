


# Inspecting Game1.cs


In this article, we will inspect the Game1.cs class. 

This article assumes that you have already [Built A MonoGame Project](BuildingFirstProject.md).

Let's get started.


### Open Game1.cs in the Editor


Double click on Game1.cs in the solution explorer.


<center>![](../Assets/game1Class.jpg)</center>


This displays the Game1 class in the editor:


<center>![](../Assets/editingGame1.jpg)</center>


Let's look at some of Game1's code:


```cs
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;

namespace Game1
{
    public class Game1 : Game
    {
```


First, Game1 requires some things to run properly, so we have **using statements** that include the XNA framework, graphics, and input.

Then we tell the game which **namespace** it exists in. 

We see Game1 **inherits** from the class of Game from the line:


```cs
public class Game1 : Game
```


So, Game is known as the **base class** of Game1. 

Game1 **extends** the class of Game with it's own functionality. 


In order for Game1 to have it's own unique functionality, Game1 must overwrite some of game's methods. 

Game defines the methods **Initialize(), LoadContent(), UnloadContent(), Update(), and Draw()**. 

Game1 will overwrite each of these methods with it's own methods. 

Let's look at the first method, labeled Game1():


### Inspect The Constructor

```cs
public Game1()
{
	graphics = new GraphicsDeviceManager(this);
	Content.RootDirectory = "Content";
}
```


This method is known as a **constructor**.
The constructor method is called when a class is **instantiated**.

Instantiation occurs when an instance of the class is created using the **new** keyword.


In this constructor, the graphics device manager is set and the content root directory is set.

The game needs a graphics device manger to draw things to the game window.

Monogame communicates with the graphical backend through the graphics device manager.


The game also needs to know where to look for game assets, like textures, meshes, sounds, and fonts.

The line _Content.RootDirectory = "Content";_ tells the game to look in the Content folder.


If you look in the solution explorer window, you can see that your game has a Content folder.


<center>![](../Assets/contentFolder.jpg)</center>


### Inspect Initialize()


Initialize is called once, after the game class is constructed.

Think of this as the game starting up. Notice the term **override** in this line:


```cs
protected override void Initialize()
```	


Override in C# means that this class (Game1) is over writing the base class' initialize method.

Think of it like this: Game.Initialize() is overwritten by Game1.Initialize().

Game defines what a 'game' is. Game1 is your game, and you get to define what you want it to be.

For example, here we can set the size of the game window like this:


```cs
protected override void Initialize()
{
	base.Initialize();
	graphics.PreferredBackBufferWidth = 1280;
	graphics.PreferredBackBufferHeight = 720;
}
```	


Or we could show/hide the mouse cursor, and allow the user to resize the game window:


```cs
protected override void Initialize()
{
	base.Initialize();
	this.IsMouseVisible = true;
	Window.AllowUserResizing = true;
}
```	


Go ahead and rename your game window to "MyFirstGame":


```cs
protected override void Initialize()
{
	base.Initialize();
	Window.Title = "My First Game";
}
```	


Run your game and see the changes.


### Inspect LoadContent()

```cs
protected override void LoadContent()
{
	spriteBatch = new SpriteBatch(GraphicsDevice);
}
```	


		
Load content is called once, after initialize. This is where the game expects to load assets from the Content folder.

Here the game creates a new spriteBatch. A **SpriteBatch** is used to draw textures and fonts to the game window.

We explore the SpriteBatch in the [SpriteBatch Class article](SpriteBatchClass.md).


### Inspect UnloadContent()

```cs
protected override void UnloadContent()
{
	// TODO: Unload any non ContentManager content here
}
```	


		
Note that this method is empty and essentially does nothing right now.

That's because we haven't loaded any content - so there's nothing to unload.

Later on when you have loaded content and you need to unload it, you might use this method to do so.

You may instead choose to create a dedicated class to manage content loading and unloading.

This is commonly done in larger games where there are many assets to be managed.


Let's move on to the two most important methods, **Update()** and **Draw()**.


### Inspect Update()

```cs
protected override void Update(GameTime gameTime)
{
	if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed || Keyboard.GetState().IsKeyDown(Keys.Escape))
		Exit();
	base.Update(gameTime);
}
```	


The update method is called every frame your game runs.

If you've heard of the term "60 frames per second" then you know what a frame is.

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



