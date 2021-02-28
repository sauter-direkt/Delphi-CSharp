#pragma once
#include <gcroot.h>;
using namespace System;



public ref class DotNetWrapper {
private:
	Object^ dotEngine;
public:
	DotNetWrapper();
	Object^ GetEngine();
};

bool __stdcall Start(UInt32& engine);

gcroot<DotNetWrapper^> DW = nullptr;



