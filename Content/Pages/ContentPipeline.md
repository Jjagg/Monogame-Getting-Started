


# What is the Content Pipeline?


The content pipeline refers to the process by which a game asset is transformed into the XNB format.

For example, a texture could start out as a PNG file, but it will get transformed into an XNB for Monogame.

MonoGame implements its own content pipeline for transforming your unoptimized assets into platform optimized content.

This is critical in building a game which runs as fast as possible under tight resource constraints.


### What is an XNB?


The acronym XNB stands for Xbox Binary.

The full name for an XNB is a XNA Game Studio Express XNA Framework Content Pipeline Binary file.

An XNB is a compressed proprietary file format used to store textures, sounds, fonts, or other game assets.

Think of an XNB as the compressed and compiled version of your game asset.


### Why XNBs?


Monogame was born from XNA, and XNA loaded game assets in the XNB format.

So, Monogame uses XNB because XNA did. This makes it easier to port XNA games to Monogame.

XNBs also load quickly and are stored in a compressed format, making them ideal for game assets.


### Can I load other file formats instead of XNBs?


Yes, you can, but support is limited and Monogame is moving away from supporting non-XNB files.

Monogame prefers creating XNB files from your game content.

This allows Monogame to transform your unoptimized assets into platform optimized content.

It's preferred that you load XNBs and use the Monogame Pipeline Tool to handle conversion of assets to XNBs.



