# 🪝 Gancho Lib 
[![CI](https://github.com/buzzer-re/Gancho/actions/workflows/ci.yml/badge.svg)](https://github.com/buzzer-re/Gancho/actions/workflows/ci.yml)
[![CD](https://github.com/buzzer-re/Gancho/actions/workflows/cd.yml/badge.svg)](https://github.com/buzzer-re/Gancho/actions/workflows/cd.yml)


Gancho is a small and straightforward hook library that I developed specifically for the [Shinigami](https://github.com/buzzer-re/Shinigami) project. Gancho's operation is based on the concept of trampoline functions. This involves overwriting the original code with a jump to the hooked code. For greater accuracy in the hooking process, Gancho relies on [Zydis](https://github.com/zyantific/zydis) disassembler.

# Usage

Here is an example:

```cpp
#include "Gancho/HookManager.h"
#include <iostream>

// Define a function pointer for the original VirtualAlloc function
typedef LPVOID(WINAPI* pVirtualAlloc) (
    LPVOID lpAddress,
    SIZE_T dwSize,
    DWORD  flAllocationType,
    DWORD  flProtect
    );

pVirtualAlloc oVirtualAlloc;

// Hook function for VirtualAllocEx
LPVOID WINAPI hkVirtualAlloc(
    LPVOID lpAddress,
    SIZE_T dwSize,
    DWORD  flAllocationType,
    DWORD  flProtect
)
{
    std::puts("VirtualAlloc Hooked!");
    // Call the original VirtualAlloc function
    return oVirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect);
}

int main()
{
    // Load kernelbase.dll and get the address of VirtualAlloc function
    HMODULE kernelbase = LoadLibraryA("kernelbase.dll");
    BYTE* virtualAlloc = (BYTE*)GetProcAddress(kernelbase, "VirtualAlloc");

    // Declare HookManager instance
    HookManager manager;

    // Add hook to VirtualAlloc function and return the address of the original function as a function pointer
    oVirtualAlloc = (pVirtualAlloc)manager.AddHook(virtualAlloc, (BYTE*)hkVirtualAlloc);

    // Allocate memory using VirtualAlloc
    LPVOID mem = VirtualAlloc(NULL, 0x20, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);

    if (mem)
    {
        std::puts("Allocated!");
    }


    std::cout << "Hello World!\n";
}

```

The current version of this software is simple and only allows for the installation of the hook. However, it does not currently support hook removal (yet).
# Install

To obtain Gancho, navigate to the [Release](https://github.com/buzzer-re/Gancho/releases) page and select your preferred version. The zip file includes the Gancho DLL and its dependencies, as well as the necessary headers for including in your project.




