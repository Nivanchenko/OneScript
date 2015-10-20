﻿
/*----------------------------------------------------------
This Source Code Form is subject to the terms of the 
Mozilla Public License, v.2.0. If a copy of the MPL 
was not distributed with this file, You can obtain one 
at http://mozilla.org/MPL/2.0/.
----------------------------------------------------------*/
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using RegExp = System.Text.RegularExpressions;


namespace ScriptEngine.HostedScript.Library.RegexLib
{
    [ContextClass("Совпадение", "Match")]
    class MatchImpl : AutoContext<MatchImpl>
    {
        private RegExp.Match _match;

        public MatchImpl(RegExp.Match match)
        {
            _match = match;
        }

        [ContextProperty("Значение", "Value")]
        public string Value
        {
            get { return _match.Value; }
        }

        [ContextProperty("Индекс", "Index")]
        public int Index
        {
            get { return _match.Index; }
        }

        [ContextProperty("Длина", "Length")]
        public int Length
        {
            get { return _match.Length; }
        }
    }
}
