using System;
using System.Runtime.InteropServices;
using common;

namespace Engine
{
    [ComVisible(true)]
    [InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    [Guid(Common.GUID_ENGINE)]
    public interface IEngine
    {
        [return: MarshalAs(UnmanagedType.LPWStr)]
        string HalloWord1();

        [return: MarshalAs(UnmanagedType.Struct)]
        object HalloWord2();

        [return: MarshalAs(UnmanagedType.I4)]
        int Number42A();

        [return: MarshalAs(UnmanagedType.Struct)]
        object Number42B();


    }
}
