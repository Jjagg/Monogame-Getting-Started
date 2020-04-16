


# Drawing Text


In this article, we will draw Text to the screen.

We will draw both types of fonts, a TrueType font and a Bitmap font.

This article assumes that you have completed the **Textures** articles, 
plus 
[Adding a TrueType Font](FontAddingTrueType.md)
and 
[Adding a Bitmap SpriteFont](FontAddingSpritefont.md).

Let's get started.


### Update Game1 to Draw Your Font


Create two font variables in Game1.cs.

Create two Vector2 variables to store each font's screen position.


**A font's position should always be a whole number** like 1, 256, or 4096.

**Never** use a decimal or floating point number with a value after the period, like 1.2, or 256.6, or 4096.5.

Such a number will cause the font to be drawn blurry and significantly degrade the readability.

If you want crisp, legible fonts - always use a whole number for positioning.


```cs
SpriteFont TTfont;
Vector2 TTFposition = new Vector2(200, 100);
SpriteFont BitmapFont;
Vector2 BitmapFontPosition = new Vector2(200, 150);
```	


Load your fonts in Game1.LoadContent().


```cs
TTfont = Content.Load<SpriteFont>("Arial");
BitmapFont = Content.Load<SpriteFont>("FONT_Bark6pt");
```	


Draw your fonts in Game1.Draw().

Notice how similar a font's draw call is to a texture's draw call.


```cs
spriteBatch.DrawString(TTfont, 
	"True Type Font test text", 
	TTFposition, 
	Color.White, 
	rotation, 
	origin, 
	scale, 
	spriteEffect, 
	zDepth);

spriteBatch.DrawString(BitmapFont,
	"Bitmap Font test text",
	BitmapFontPosition,
	Color.White,
	rotation,
	origin,
	scale,
	spriteEffect,
	zDepth);
```	


Build your project, and view the results.


<center>![](../Assets/drawText1.jpg)</center>


### Summary


You learned how to load and draw fonts to the game's screen.

The next step is to modify the text's position, color, rotation, scale, origin, and effect.

We'll cover this in the next article [Modifying Text](FontModify.md).



