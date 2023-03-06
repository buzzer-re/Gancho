# 🪝 Gancho Lib 
[![CI](https://github.com/buzzer-re/Gancho/actions/workflows/ci.yml/badge.svg)](https://github.com/buzzer-re/Gancho/actions/workflows/ci.yml)
[![CD](https://github.com/buzzer-re/Gancho/actions/workflows/cd.yml/badge.svg)](https://github.com/buzzer-re/Gancho/actions/workflows/cd.yml)

A tiny and simple hook library that I wrote to use in the [Shinigami](https://github.com/buzzer-re/Shinigami) project

# Usage

Here is a example:

```cpp
#include "Gancho/HookManager.h"

hKernelBase = LoadLibraryA("kernelbase.dll");
if (hKernelBase == NULL) 
{
    // handle somehow
}

// Get the current mapped address
BYTE* pRealVirtualAllocEx = reinterpret_cast<BYTE*>(GetProcAddress(hKernelBase, "VirtualAllocEx"));

// Declare
HookManager manager;
// Hook and return the address that you can use as a function pointer to the original function
oVirtualAllocEx = (pVirtualAllocEx)manager.AddHook(pRealVirtualAllocEx, (BYTE*)hkVirtualAllocEx);
```

It's very simple and just supports install the hook, so you can't remove (yet).

# Install

Go the the [Release](https://github.com/buzzer-re/Gancho/releases) and grab your flavor, the files contains everything you need to setup your project.





