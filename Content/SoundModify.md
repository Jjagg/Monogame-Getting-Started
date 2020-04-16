


# Modifying Sounds


In this article, we will modify the game's background music

This article assumes that you have completed the  [Playing Sounds](SoundPlaying.md) tutorial.

Let's get started.


### Modify the Update() method


Replace the Update method with the code below.


```cs
protected override void Update(GameTime gameTime)
{
	if (Keyboard.GetState().IsKeyDown(Keys.Space)) { barkInstance.Play(); }

	//stop or pause music
	if (Keyboard.GetState().IsKeyDown(Keys.Escape)) { musicInstance.Stop(); }
	else if (Keyboard.GetState().IsKeyDown(Keys.Delete)) { musicInstance.Pause(); }

	//resume paused music, or play stopped music
	else if (Keyboard.GetState().IsKeyDown(Keys.Enter))
	{
		if (musicInstance.State == SoundState.Paused) { musicInstance.Resume(); }
		else if (musicInstance.State == SoundState.Stopped) { musicInstance.Play(); }
	}

	//increase or decrease music volume
	if (Keyboard.GetState().IsKeyDown(Keys.Up))
	{ if (musicInstance.Volume < 1.0f) { musicInstance.Volume += 0.01f; } }
	else if (Keyboard.GetState().IsKeyDown(Keys.Down))
	{ if (musicInstance.Volume > 0.01f) { musicInstance.Volume -= 0.01f; } }

	//increase or decrease the music's pitch
	if (Keyboard.GetState().IsKeyDown(Keys.PageUp))
	{ if (musicInstance.Pitch < 0.99f) { musicInstance.Pitch += 0.01f; } }
	else if (Keyboard.GetState().IsKeyDown(Keys.PageDown))
	{ if (musicInstance.Pitch > -0.99f) { musicInstance.Pitch -= 0.01f; } }

	base.Update(gameTime);
}
```	


There shouldn't be any errors in your project.

Build the project. You should see a window like below.

Music will start playing.


<center>![](../Assets/runningGame1.jpg)</center>


If you press the Escape key, the music will stop.

If you press the Delete key, the music will pause.

If you press the Enter key, the music will start playing again.

If you press the Up Arrow key, the music's volume will increase.

If you press the Down Arrow key, the music's volume will decrease.

If you press the PageUp key, the music's pitch will increase.

If you press the PageDown key, the music's pitch will decrease.


### Stopping, Playing, and Pausing the Music


In the code below, we check the keyboard for various kinds of user input.

First, we check if the Escape key is down. If this is true, then we tell the music instance to stop playing.

Then we check if the Delete key is down. If this is true, then we tell the music instance to pause.


Finally, we check if the Enter key is down.

If the Enter key is down, we then check the state of the music instance.

If the music is paused, then we resume playing the paused music instance.

If the music is stopped, then we restart (play) the stopped music instance.


```cs
//stop or pause music
if (Keyboard.GetState().IsKeyDown(Keys.Escape)) { musicInstance.Stop(); }
else if (Keyboard.GetState().IsKeyDown(Keys.Delete)) { musicInstance.Pause(); }

//resume paused music, or play stopped music
else if (Keyboard.GetState().IsKeyDown(Keys.Enter))
{
	if (musicInstance.State == SoundState.Paused) { musicInstance.Resume(); }
	else if (musicInstance.State == SoundState.Stopped) { musicInstance.Play(); }
}
```	


### Changing the Music's Volume


In the code below, we check to see if the user is pressing the Up or Down arrow key.

If the Up key is being pressed, we increase the music's volume to a maximum of 1.0.

If the Down key is being pressed, we decrease the music's volume to a minimum of 0.01.


```cs
//increase or decrease music volume
if (Keyboard.GetState().IsKeyDown(Keys.Up))
{ if (musicInstance.Volume < 1.0f) { musicInstance.Volume += 0.01f; } }

else if (Keyboard.GetState().IsKeyDown(Keys.Down))
{ if (musicInstance.Volume > 0.01f) { musicInstance.Volume -= 0.01f; } }
```	


### Changing the Music's Pitch


In the code below, we check to see if the user is pressing the PageUp or PageDown arrow key.

If the PageUp key is being pressed, we increase the music's pitch to a maximum of 0.99.

If the PageDown key is being pressed, we decrease the music's pitch to a minimum of -0.99.


```cs
//increase or decrease the music's pitch
if (Keyboard.GetState().IsKeyDown(Keys.PageUp))
{ if (musicInstance.Pitch < 0.99f) { musicInstance.Pitch += 0.01f; } }

else if (Keyboard.GetState().IsKeyDown(Keys.PageDown))
{ if (musicInstance.Pitch > -0.99f) { musicInstance.Pitch -= 0.01f; } }
```	


### Summary


You now know how to play, pause, stop, and restart a SoundEffectInstance.

You also learned how to increase and decrease the volume and pitch.

The next step is learning how to layer sounds.

This will allow you to create music that adapts to your game.

We'll cover this in the next article [Layering Sounds](SoundLayering.md).



