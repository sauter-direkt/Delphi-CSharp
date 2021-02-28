#using <mscorlib.dll>
#include "stdafx.h"
#include "Start.h"


bool __stdcall Start(UInt32& engine)
{
	using namespace System::Runtime::InteropServices;

	engine = 0;
	DW = gcnew DotNetWrapper();

	System::IntPtr ptr = Marshal::GetIUnknownForObject(DW->GetEngine());

	engine = ptr.ToInt32();

	return true;
}

DotNetWrapper::DotNetWrapper()
{
	dotEngine = gcnew Engine::Engine();
}

Object^ DotNetWrapper::GetEngine()
{
	return dotEngine;
}
