


# Creating InputHelper.cs


In this article, we will create a new class to handle the user's input.

This article assumes that you have already [Built A MonoGame Project](BuildingFirstProject.md).

Let's get started.


### Why Should Input be In It's Own Class?


When you first create a new MonoGame project, you will notice Game1.cs has Input being checked in Update().

While this is technically acceptable, as your project grows your Input checking code will likely grow as well.

Your Update() method will become more complex too. It's a good idea to seperate Input from Update().


To do this, we are going to create a new class called InputHelper.

The responsibility of InputHelper will be to provide the Game with useful information about the mouse and keyboard.

We will then create an instance of InputHelper in Game, and then check user input through InputHelper.

This seperates Input logic from Update logic, and makes your game easier to understand.


### Creating InputHelper.cs


Add a new class to your project name "InputHelper.cs".

Refer to the [Creating A Class](CreateAClass.md) article if you are unfamiliar with this process.

Open InputHelper.cs in the Editor and replace it's code with the code below.


```cs
using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;

namespace Game1
{
    public enum MouseButtons { LeftButton, RightButton }

    public class InputHelper
    {
        public KeyboardState currentKeyboardState = new KeyboardState();
        public MouseState currentMouseState = new MouseState();
        public KeyboardState lastKeyboardState = new KeyboardState();
        public MouseState lastMouseState = new MouseState();
        public Vector2 cursorPos = new Vector2(0, 0);

        public InputHelper() {}

        public void Update()
        {
            lastKeyboardState = currentKeyboardState;
            lastMouseState = currentMouseState;

            currentKeyboardState = Keyboard.GetState();
            currentMouseState = Mouse.GetState();

            //track cursor position
            cursorPos.X = currentMouseState.X;
            cursorPos.Y = currentMouseState.Y;
        }

        //check for keyboard key press, hold, and release
        public bool IsNewKeyPress(Keys key)
        {
            return (currentKeyboardState.IsKeyDown(key) && 
                lastKeyboardState.IsKeyUp(key));
        }

        public bool IsKeyDown(Keys key)
        { return (currentKeyboardState.IsKeyDown(key)); }

        public bool IsNewKeyRelease(Keys key)
        {
            return (lastKeyboardState.IsKeyDown(key) && 
                currentKeyboardState.IsKeyUp(key));
        }

        public bool IsNewMouseButtonPress(MouseButtons button)
        {   //check to see the mouse button was pressed
            if (button == MouseButtons.LeftButton)
            {
                return (currentMouseState.LeftButton == ButtonState.Pressed &&
                    lastMouseState.LeftButton == ButtonState.Released);
            }
            else if (button == MouseButtons.RightButton)
            {
                return (currentMouseState.RightButton == ButtonState.Pressed && 
                    lastMouseState.RightButton == ButtonState.Released);
            }
            else { return false; }
        }

        public bool IsNewMouseButtonRelease(MouseButtons button)
        {   //check to see the mouse button was released
            if (button == MouseButtons.LeftButton)
            {
                return (lastMouseState.LeftButton == ButtonState.Pressed && 
                    currentMouseState.LeftButton == ButtonState.Released);
            }
            else if (button == MouseButtons.RightButton)
            {
                return (lastMouseState.RightButton == ButtonState.Pressed && 
                    currentMouseState.RightButton == ButtonState.Released);
            }
            else { return false; }
        }

        public Boolean IsMouseButtonDown(MouseButtons button)
        {   //check to see if the mouse button is being held down
            if (button == MouseButtons.LeftButton)
            { return (currentMouseState.LeftButton == ButtonState.Pressed); }
            else if (button == MouseButtons.RightButton)
            { return (currentMouseState.RightButton == ButtonState.Pressed); }
            else { return false; }
        }
    }
}
```	


### Understanding InputHelper.cs


Our new InputHelper class introduces several new keywords and concepts, so let's examine all of them.

First, look at the **using** statements at the top of the class.

Notice that we are using **Microsoft.Xna.Framework** and **Microsoft.Xna.Framework.Input**.

Members of our InputHelper class are defined in these Microsoft.Xna classes.


```cs
using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
```	


### MouseButton Enumerator


Now let's look at our new enumerator **MouseButtons**.

An enumerator is used to iterate over a collection of items.

In this case, we have defined two items in our collection **MouseButtons** - LeftButton and RightButton.

These two items represent the Left and Right Buttons of the user's mouse.


```cs
public enum MouseButtons { LeftButton, RightButton }
```	


### Inspecting InputHelper's Members


Let's inspect the members of our InputHelper now.

Below we define several new variables with different class types.

The class types KeyboardState and MouseState are defined in Microsoft.Xna.Framework.Input.

The class type Vector2 is defined in Microsoft.Xna.Framework.


```cs
public KeyboardState currentKeyboardState = new KeyboardState();
public MouseState currentMouseState = new MouseState();
public KeyboardState lastKeyboardState = new KeyboardState();
public MouseState lastMouseState = new MouseState();
public Vector2 cursorPos = new Vector2(0, 0);
```	


**KeyboardState** is a class that represents a user's keyboard. 

If a key is pressed, this is represented in KeyboardState.

We create a current keyboard state, and a last keyboard state.

These two instances allow us to see if a user pressed a key, is holding a key, or released a key.


**MouseState** is a class that represents a user's mouse.

If a mouse button is pressed, this is represented in MouseState.

We create a current mouse state, and a last mouse state.

These two instances allows us to see if a user pressed a mouse button, is holding a button, or released a button.


Finally we have **Vector2**. Vector2 has two floats, X and Y.

This Vector2, known as CursorPos, represents where on the screen our cursor is.

We initially set our Vector2 variable to 0.


### Understanding Update()


Examine the Update Method below.

In this method, we capture the previous frame's keyboard and mouse state.

Then we capture the current frame's keyboard and mouse state.

Later we will compare the previous and current states to reason about the user's input.

Finally we capture the mouse's screen position in cursorPos.


```cs
public void Update()
{
	lastKeyboardState = currentKeyboardState;
	lastMouseState = currentMouseState;

	currentKeyboardState = Keyboard.GetState();
	currentMouseState = Mouse.GetState();

	//track cursor position
	cursorPos.X = currentMouseState.X;
	cursorPos.Y = currentMouseState.Y;
}
```	


### Understanding The Keyboard Methods


Examine the methods below.


**IsKeyDown()** checks to see if the passed Key parameter is being held down in currentKeyboardState.

Note the Key parameter. This allows the function to check whatever Key is passed to it.


**IsNewKeyPress()** compares previous keyboard state to current keyboard state . 

If the current state is down, and the previous state was up, then the key press occurred on this frame.

Note that IsNewKeyPress() takes a Key parameter just like IsKeyDown().


**IsNewKeyRelease()** can be thought of as the opposite of IsNewKeyPress().

If the last state was down, and the current state is up, then the key release occurred on this frame.

Note that IsNewKeyRelease() takes a Key parameter just like IsKeyDown().


```cs
//check for keyboard key press, hold, and release

public bool IsKeyDown(Keys key)
{ return (currentKeyboardState.IsKeyDown(key)); }

public bool IsNewKeyPress(Keys key)
{ return (currentKeyboardState.IsKeyDown(key) && lastKeyboardState.IsKeyUp(key)); }

public bool IsNewKeyRelease(Keys key)
{ return (lastKeyboardState.IsKeyDown(key) && currentKeyboardState.IsKeyUp(key)); }
```	


### Understanding The Mouse Methods


Examine the methods below.


**IsMouseButtonDown()** checks to see if the passed MouseButton parameter is being held down in currentMouseState.

Note the MouseButtons parameter. This allows the function to check either Left or Right MouseButtons.


**IsNewMouseButtonPress()** compares previous mouse state to current mouse state . 

If the current state is down, and the previous state was up, then the button press occurred on this frame.

Note that IsNewMouseButtonPress() takes a MouseButton parameter just like IsMouseButtonDown().


**IsNewMouseButtonRelease()** can be thought of as the opposite of IsNewMouseButtonPress().

If the last state was down, and the current state is up, then the button release occurred on this frame.

Note that IsNewMouseButtonRelease() takes a MouseButton parameter just like IsMouseButtonDown().


```cs
public Boolean IsMouseButtonDown(MouseButtons button)
{  	//check to see if the mouse button is being held down
	if (button == MouseButtons.LeftButton)
	{ return (currentMouseState.LeftButton == ButtonState.Pressed); }
	else if (button == MouseButtons.RightButton)
	{ return (currentMouseState.RightButton == ButtonState.Pressed); }
	else { return false; }
}

public bool IsNewMouseButtonPress(MouseButtons button)
{	//check to see the mouse button was pressed
	if (button == MouseButtons.LeftButton)
	{
		return (currentMouseState.LeftButton == ButtonState.Pressed &&
			lastMouseState.LeftButton == ButtonState.Released);
	}
	else if (button == MouseButtons.RightButton)
	{
		return (currentMouseState.RightButton == ButtonState.Pressed && 
			lastMouseState.RightButton == ButtonState.Released);
	}
	else { return false; }
}

public bool IsNewMouseButtonRelease(MouseButtons button)
{	//check to see the mouse button was released
	if (button == MouseButtons.LeftButton)
	{
		return (lastMouseState.LeftButton == ButtonState.Pressed && 
			currentMouseState.LeftButton == ButtonState.Released);
	}
	else if (button == MouseButtons.RightButton)
	{
		return (lastMouseState.RightButton == ButtonState.Pressed && 
			currentMouseState.RightButton == ButtonState.Released);
	}
	else { return false; }
}
```	


### Summary


You created InputHelper.cs.

You inspected InputHelper's members and methods.

You should understand how key presses and releases are tracked using previous and current keyboard states.

You should understand how button presses and releases are tracked using previous and current mouse states.


Next we will [Add InputHelper to Game](InputHelperAdd.md) and interact with it.



