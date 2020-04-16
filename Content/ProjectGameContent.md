


# Project Content vs Game Content


This article explains the differences between a project's Content folder and a game's Content folder.

**Note that a game's Content folder is not the same as a project's Content folder.**


### Understanding Project Content


When a project is created for the first time, your IDE will make several folders for your project.

One of these folders is the project's Content folder.

Your project's Content folder will be at something like  "...\Desktop\Game1\Game1\Game1\Content"

Your pipeline project file (.mgcb) will live in this folder.


### Understanding Game Content


When a game builds, it creates it's own set of folders to run from.

One of these folders is the game's Content folder.

Your game's Content folder will be at something like "...\Desktop\Game1\Game1\Game1\bin\DesktopGL\x86\Debug\Content"

The pipeline tool will automatically transform your game assets into XNBs and copy them into the game's folder.

Your game's source code will look for game assets (XNBs) in this folder, unless you tell it otherwise.



