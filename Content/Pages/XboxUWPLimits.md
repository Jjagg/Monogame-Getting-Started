


# Limits applied to XBox One UWP Apps


This section discusses the various limits applied to UWP apps running on an Xbox One.

UWP apps and games running on Xbox One share resources with the system and other apps.

The information presented here is duplicated from the 
[official documentation](https://docs.microsoft.com/en-us/windows/uwp/xbox-apps/system-resource-allocation).


### Memory Limits


- The maximum memory available to an app running in the foreground is 1 GB.
- The maximum memory available to an app running in the background is 128 MB.
- Apps that exceed these memory requirements will encounter memory allocation failures.


### CPU + GPU Limits


- Share of 2-4 CPU cores depending on the number of apps and games running on the system.
- Share of 45% of the GPU depending on the number of apps and games running on the system.
- All apps must target the x64 architecture in order to be developed or submitted to the store for Xbox.


### Additional Notes


UWP on Xbox One supports DirectX 11 Feature Level 10. DirectX 12 is not supported at this time.

If you are working on a game that requires DirectX 12, you can register with the ID@Xbox program.

This gets you access to Xbox One development kits, which include DirectX 12 support.



