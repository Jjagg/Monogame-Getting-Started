


# Building MonoGame Source Code


This section is for those who need to modify monogame's source code to fit a specific need or platform.

If this is your first time using monogame, it's not recommended that you start by building the source.

You should have a solid understand of how monogame works before proceeding.


### Windows - Option A


Download and install monogame, so visual studio or monodevelop has the monogame project templates.

Download and install [GitHub](https://github.com) for Windows

Download and install Visual Studio, MonoDevelop, or Xamarin Studio

Optionally download Xamarin.Android and Windows Phone 8 SDK

Start up Git Shell, and type in the following:


```cs
git clone https://github.com/mono/MonoGame.git
cd MonoGame
git submodule init
git submodule update
```


Once the repo has been cloned, you'll need to build the source and project files.

Run Protobuild.exe. This should populate the repo folder with the source project files.

If Protobuild.exe doesn't create .csproj files in it's directory, then you should try Option B.


### Windows - Option B


Download and install monogame, so visual studio or monodevelop has the monogame project templates.

Download Tortoise SVN from [https://tortoisesvn.net/](https://tortoisesvn.net/).

Create a new folder called MonoGame Source (you can call it anything you like).

Browse to the MonoGame source repository [https://github.com/mono/MonoGame](https://github.com/mono/MonoGame)  
and copy in https://github.com/mono/MonoGame.git

Right click in the Explorer window where you created the MonoGame Source directory and 
selected SVN checkout by right-clicking in my explorer directory and selecting that option.


<center>![](../Assets/svnCheckout.jpg)</center>


In the window that appears, enter https://github.com/mono/MonoGame.git into the URL for the repository.

Click on OK and wait a while whilst it downloads the entire source (around 300MB) - takes a few minutes.


<center>![](../Assets/svnCheckout2.jpg)</center>


Download GitHub for desktop [https://desktop.github.com/](https://desktop.github.com/)

Run the installer and just skip all the signin steps - ensure it installs the command line tools.

Open your MonoGame source directory and open the trunk folder.

Double-click on ProtoBuild.exe. The cache may be corrupted, which will take a few minutes to rebuild.


<center>![](../Assets/protobuild.jpg)</center>


<center>![](../Assets/sourceBuilt.jpg)</center>


Open Visual Studio 2015 and browse to the newly created MonoGame.Framework.Windows.sln (or whatever platform you wish to open).

Build the project. It should compile without issue.


### Linux and Mac


**Linux:**

Install package called "git".

Install Monodevelop.


**Mac:**

Download and Install [GitHub](https://github.com) for Mac.

Download and Install Xamarin Studio.

Optionally download Xamarin.Android and Xamarin.iOS.


Start terminal and type in the following:


```cs
git clone https://github.com/mono/MonoGame.git
cd MonoGame
git submodule init
git submodule update
```


Once the update completes, type into terminal:


```cs
cd MonoGame
mono Protobuild.exe
```



