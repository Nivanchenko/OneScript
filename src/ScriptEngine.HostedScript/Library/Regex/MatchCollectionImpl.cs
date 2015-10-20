﻿/*----------------------------------------------------------
This Source Code Form is subject to the terms of the 
Mozilla Public License, v.2.0. If a copy of the MPL 
was not distributed with this file, You can obtain one 
at http://mozilla.org/MPL/2.0/.
----------------------------------------------------------*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using RegExp = System.Text.RegularExpressions;

namespace ScriptEngine.HostedScript.Library.RegexLib
{
    [ContextClass("Matches", "Matches")]
    class MatchCollection : AutoContext<MatchCollection>, ICollectionContext
    {
        RegExp.MatchCollection _matches;

        public MatchCollection(RegExp.MatchCollection matches)
        {
            _matches = matches;
        }

        #region ICollectionContext Members

        [ContextMethod("Количество", "Count")]
        public int Count()
        {
            return _matches.Count;
        }

        //[ContextMethod("Очистить", "Clear")]
        //public void Clear()
        //{
        //}

        public CollectionEnumerator GetManagedIterator()
        {
            return new CollectionEnumerator(GetEnumerator());
        }

        #endregion

        #region IEnumerable<IRuntimeContextInstance> Members

        public IEnumerator<IValue> GetEnumerator()
        {
            foreach (RegExp.Match item in _matches)
            {
                yield return new MatchImpl(item);
            }
        }
        public override IValue GetIndexedValue(IValue index)
        {
            return new MatchImpl(_matches[(int)index.AsNumber()]);
        }

        #endregion

        #region IEnumerable Members

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }

        #endregion

    }
}
