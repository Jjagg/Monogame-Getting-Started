


# Playing Sounds


In this article, we will play background music and a sound effect. 

This article assumes that you have completed the  [Adding Sounds](SoundAdding.md) tutorial.

Let's get started.


### Update Game1 to Load and Play the Sound Files


Replace Game1's code with the code below.


```cs
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;

using Microsoft.Xna.Framework.Audio;

namespace Game1
{
    public class Game1 : Game
    {
        GraphicsDeviceManager graphics;
        SpriteBatch spriteBatch;

        SoundEffect music;
        SoundEffect bark;
        SoundEffectInstance musicInstance;
        SoundEffectInstance barkInstance;

        public Game1()
        {
            graphics = new GraphicsDeviceManager(this);
            Content.RootDirectory = "Content";
        }

        protected override void Initialize() { base.Initialize(); }

        protected override void LoadContent()
        {
            spriteBatch = new SpriteBatch(GraphicsDevice);

            music = Content.Load<SoundEffect>("IotaPart1");
            musicInstance = music.CreateInstance();
            musicInstance.IsLooped = true;
            musicInstance.Play();

            bark = Content.Load<SoundEffect>("8bitBark");
            barkInstance = bark.CreateInstance();
        }

        protected override void UnloadContent() { }

        protected override void Update(GameTime gameTime)
        {
            if (Keyboard.GetState().IsKeyDown(Keys.Space)) { barkInstance.Play(); }
            base.Update(gameTime);
        }

        protected override void Draw(GameTime gameTime)
        {
            GraphicsDevice.Clear(Color.CornflowerBlue);
            base.Draw(gameTime);
        }
    }
}
```	


There shouldn't be any errors in your project.

Build the project. You should see a window like below.

Music will start playing.

If you press the spacebar keyboard button, a sound resembling a bark will play.

You can hold down the keyboard button to continuously play the barking sound.


<center>![](../Assets/runningGame1.jpg)</center>


### Inspect Game1.cs


Lets inspect the changes we made to Game1.cs.

First, since we are using sound files, we need to tell Game1.cs where to find Monogame's sound classes.

This is done by the code below, which essentially 'imports' the audio classes defined in the Xna Framework.

Recall that Monogame is based on XNA.


```cs
using Microsoft.Xna.Framework.Audio;
```		


### SoundEffect and SoundEffectInstance


A SoundEffect loads a sound file. 

A SoundEffectInstance plays, loops, pauses, stops, and restarts a sound loaded via SoundEffect.

You can have multiple SoundEffectInstances playing the same SoundEffect.


You can load and play a soundfile using just a SoundEffect, but that's all you can do - 
you can't loop it, stop it, pause it, or restart it. 

It's suggested that **you should always create a SoundEffectInstance to control a sound in your game.**

Inside Game1.cs we create two SoundEffects and two SoundEffectInstances.


```cs
SoundEffect music;
SoundEffect bark;
SoundEffectInstance musicInstance;
SoundEffectInstance barkInstance;
```	


### Inspect LoadContent()


In the LoadContent method we actually load the sound XNBs into our ContentManager, called Content.

We set the SoundEffect variables to equal our loaded content.

Then we create the SoundEffectInstances that will play and control our loaded sound files.

Note that we set our musicInstance to loop, with the line _musicInstance.IsLooped = true;_.

Also note that we begin playing the game's music with the line _musicInstance.Play();_.


```cs
protected override void LoadContent()
{
	spriteBatch = new SpriteBatch(GraphicsDevice);

	music = Content.Load<SoundEffect>("IotaPart1");
	musicInstance = music.CreateInstance();
	musicInstance.IsLooped = true;
	musicInstance.Play();

	bark = Content.Load<SoundEffect>("8bitBark");
	barkInstance = bark.CreateInstance();
}
```	


### Inspect Update()


Finally, we modified Update() to play the bark sound if the user has pressed the spacebar.

Note that we are only checking to see if the spacebar is being held down.

This means that _SoundEffectInstance.Play()_ will be called every frame that spacebar is held down.

A SoundEffectInstance can only Play() if it's state is Paused or Stopped.

This means that bark will only play again once the sound has reached it's end.


```cs
protected override void Update(GameTime gameTime)
{
	if (Keyboard.GetState().IsKeyDown(Keys.Space)) { barkInstance.Play(); }
	base.Update(gameTime);
}
```	


### Summary


Your sound assets are now playing in your game.

The next step is to modify their volume, pause, stop, play, and loop your sounds.

We'll cover this in the next article [Modifying Sounds](SoundModify.md).



