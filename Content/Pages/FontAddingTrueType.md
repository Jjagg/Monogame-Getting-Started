


# Adding a TrueType Font


In this article, we will add a TrueType font asset to your game's pipeline tool, and build the asset into a XNB.

This article assumes that you have completed the **Textures** tutorials.

Let's get started.


### Copy the TrueTypeFont Asset


First, you'll need to download the TTF below. 

Right click the image and choose 'Save As...' then save it to your project's Content folder.


<center>[Arial.ttf](../Assets/Arial.ttf)</center>


### Add the TTF file to Your Project


In your IDE, add the TTF file to your project.

Set the Build Action to 'None' and the Copy Action to 'Copy Always'.


<center>![](../Assets/addTTF1.jpg)</center>

<center>![](../Assets/addTTF2.jpg)</center>

<center>![](../Assets/addTTF3.jpg)</center>


### Create a .spritefont Description File


Return to your pipeline tool.

Click Edit > Add > New Item...


<center>![](../Assets/addTTF4.jpg)</center>


Choose the SpriteFont description file type.

You should name this description file the same name as your font.


<center>![](../Assets/addTTF5.jpg)</center>


Locate this .spritefont file in your project Content folder.

Open this file with a text editor.


<center>![](../Assets/addTTF6.jpg)</center>


Locate the fontname tag in the .spritefont file.

Change the value to your font's name.


<center>![](../Assets/addTTF7.jpg)</center>


Build the pipeline content project.


<center>![](../Assets/addTTF8.jpg)</center>


### Modifying Your Font


Modifying your font's size or weight is done by editing the .spritefont file.


```cs
<!--
Size is a float value, measured in points. Modify this value to change
the size of the font.
-->
<Size>12</Size>
```	


```cs
<!--
Style controls the style of the font. Valid entries are "Regular", "Bold", "Italic",
and "Bold, Italic", and are case sensitive.
-->
<Style>Regular</Style>
```	


### Summary


Your font asset was added to your project, you created a spritefont description file, 
and then built your content project. You also learned how to edit the size and weight
of your font file.


The next step is to load and draw the font in your game.

We'll cover this in the next article [Drawing Text](FontDrawing.md).



