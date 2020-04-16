


# The SpriteBatch Class


In this article, we will discuss the SpriteBatch class **and how Monogame draws**.


SpriteBatch is (basically) responsible for drawing textures and spriteFonts (strings) to the screen.

We will not be discussing the code for drawing textures and fonts to the screen.

Refer to the [Texture Drawing article](TextureDrawing.md) 
and the [Font Drawing article](FontDrawing.md) for code examples.

Let's get started.


### What does the SpriteBatch class do exactly?


You can view the source code for SpriteBatch 
[right here](https://github.com/MonoGame/MonoGame/blob/develop/MonoGame.Framework/Graphics/SpriteBatch.cs).


SpriteBatch.cs describes itself as a "Helper class for drawing text strings and sprites in one or more optimized batches".

Essentially, SpriteBatch passes textures and strings to another class called SpriteBatcher.cs.

SpriteBatch checks to make sure Textures and SpriteFonts you pass into it are valid.

SpriteBatch also has a variety of Draw() methods that accept various parameters.


So, SpriteBatch kinda "wraps" the SpriteBatcher class and acts as an intermediary or interface.

For example, you would never interact with the SpriteBatcher class directly.

You would interact with the SpriteBatch class, which would then call _batcher.CreateBatchItem().

SpriteBatch also handles/enforces the Begin() and End() calls necessary for drawing.

Note that drawing actually occurs in the End() method, which calls _batcher.DrawBatch().


### Ok, What does the SpriteBatcher class do?


You can view the source code for SpriteBatcher 
[right here](https://github.com/MonoGame/MonoGame/blob/develop/MonoGame.Framework/Graphics/SpriteBatcher.cs).


SpriteBatcher.cs describes itself as a "class that handles the queueing of batch items into the GPU...".

This is done by "creating triangle tesselations that are used to draw the sprite textures".

Technically, SpriteBatcher doesn't interact with the GPU directly - it calls a GraphicsDevice method.

SpriteBatcher's drawing is done through the GraphicsDevice method _DrawUserIndexedPrimitives();_.


SpriteBatcher.cs communicates with the target graphic device, passing it lists of triangles and textures.

SpriteBatcher must be efficient and fast, so it uses pointer indexing to bypass array checking overhead.

Basically, theres a bunch of code in SpriteBatcher that aims to make it as fast as possible.

Note that SpriteBatcher.cs uses a List of SpriteBatchItem instances to efficiently represent "sprites".


### Hmm, What does the SpriteBatchItem class do?


You can view the source code for SpriteBatchItem 
[right here](https://github.com/MonoGame/MonoGame/blob/develop/MonoGame.Framework/Graphics/SpriteBatchItem.cs).


Think of the SpriteBatchItem class as a rectangular billboard in 3D space.

This billboard has a texture, a position XYZ, and a color.

It also has X and Y Texture Coordinates.

The billboard's corners are represented by 4 VertexPositionColorTexture instances.


### Jeez, What's a VertexPositionColorTexture?


Well, it's a point in 3D space that has an XYZ value.

This point, or vertex, also has a Color value.

In addition, it has XY Texture Coordinates.

When you use 4 VertexPositionColorTextures, you can describe a billboard in 3D space - like the SpriteBatchItem class.


### What's a GraphicsDevice?


You can view the source code for GraphicsDevice 
[right here](https://github.com/MonoGame/MonoGame/blob/develop/MonoGame.Framework/Graphics/GraphicsDevice.cs).


Well, the GraphicsDevice classes are... complicated. **Very complicated**.

A GraphicsDevice communicates with a graphics API like OpenGL or DirectX.

A GraphicsDevice's code path is also controlled by the target platform.

The GraphicsDevice basically handles communication between the graphics API, the target platform, and your game.

It handles communication, translation, and manages graphical state for many disparate systems.


The GraphicsDevice presents generic methods for interacting with the supported graphics APIs.

By doing this, the SpriteBatch/SpriteBatcher classes don't need to know or interact with specific graphics APIs.

Because your codebase can only call SpriteBatch's methods, your codebase never needs to interact with a graphics API either.

This allows your codebase to be (more) cross-platform.


You might recall that the GraphicsDevice is used by SpriteBatcher to draw textured rectangles or triangles to the screen.

This is done using the DrawUserIndexedPrimitives() method.

How this method is actually implemented **depends on the graphics API**.

For example, if the project uses OpenGL, then DrawUserIndexedPrimitives() either calls **GL.DrawElements()** or **GL.DrawArrays()**.

If the project uses DirectX, then DrawUserIndexedPrimitives() either calls **_d3dContext.Draw** or **_d3dContext.DrawIndexed()**.


Explaining OpenGL or DirectX is way beyond the scope of this getting started guide.

Entire books are dedicated to these subjects. If you'd like to learn more, there are many resources available.


### Interesting, I'd like to learn more...


Great, here is a list of resources:

- [Efficent billboards in 3D space](https://blogs.msdn.microsoft.com/shawnhar/2011/01/12/spritebatch-billboards-in-a-3d-world/)
- [3D XNA Tutorials](http://www.riemers.net/)
- [OpenGL Tutorials](http://www.opengl-tutorial.org/)
- [DirectX Tutorials](http://www.directxtutorial.com/)



