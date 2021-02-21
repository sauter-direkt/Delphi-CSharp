
#using <mscorlib.dll>


bool __stdcall Start(int& Value)
{
	using namespace System::Runtime::InteropServices;

	Engine::Engine^ o = gcnew Engine::Engine();
	Value = o->Test();

	return true;
}