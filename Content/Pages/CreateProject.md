# Create a MonoGame Project

MonoGame comes with templates to set up a new project.
Templates can be installed in two ways.

- With Visual Studio 2017 or newer
- With .NET Core CLI

## Setting up a Project in Visual Studio

MonoGame templates can be installed as a Visual Studio extension.

- In Visual Studio go to Extensions > Manage Extensions...
- Make sure you have Online selected on the left pane.
- Search for MonoGame.
- Select the MonoGame Project Templates extension and click Download.
- Restart Visual Studio to install the extension.

When Visual Studio restarts click Create a new project. The MonoGame templates should show up at the top, if not search for MonoGame in the search bar.

You'll see a few different templates were installed. For an overview of the different platforms see [Target Platforms](PlatformsAndProjects.md).

For this guide we'll create an OpenGL Cross-Platform Desktop Application (we typically refer to this platform as DesktopGL).
Select the template and click Next.
Pick an appropriate location for the project and click Create.

When the project creation is finished you can build and run it by pressing F5.

You should see a blue window pop up.

You've succesfully set up your MonoGame project!

You can close the game window by clicking the close button or by pressing escape on your keyboard.
If you have a gamepad connected to your computer, you can press the back button to exit.

Next we'll look what's in the project we've just created in [Understanding the Project](UnderstandingProject.md).

## Setting up a Project with .NET CLI

If you do not have Visual Studio installed you can set up a project using the .NET Core CLI (Command Line Interface).
If you don't have the .NET Core SDK installed, go get the latest version [here](https://dotnet.microsoft.com/download).
After installation you can run `dotnet --info` in a terminal to make sure the installation was successful.

Open a terminal and navigate to where you want to create the project.

MonoGame publishes templates for [dotnet new](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-new). To install the C# templates run `dotnet new -i MonoGame.Templates.CSharp`.

There are templates in the package for different platforms. For an overview of the different platforms see [Target Platforms](PlatformsAndProjects.md).

For this guide we'll create a DesktopGL project. The identifier is `mgdesktopgl`, so you can create a project by running `dotnet new mgdesktopgl -o <project-folder>`.

Navigate into the folder and run `dotnet run` to build and run the game.
You should see a blue window pop up.

You've succesfully set up your MonoGame project!

You can close the game window by clicking the close button or by pressing escape on your keyboard.
If you have a gamepad connected to your computer, you can press the back button to exit.

Next we'll look what's in the project we've just created in [Understanding the Project](UnderstandingProject.md).
