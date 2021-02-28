using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace Engine
{
    public class Engine: IEngine
    {
        public string HalloWord1()
        {
            return "Hallo World (1)";
        }

        public object HalloWord2()
        {
            return "Hallo World (2)";
        }

        int IEngine.Number42A()
        {
            return 42;
        }

        object IEngine.Number42B()
        {
            return 42;
        }
    }
}
