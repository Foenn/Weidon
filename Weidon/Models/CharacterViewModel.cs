using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Weidon.Models
{
    public class CharacterViewModel
    {
        public List<int> ListIds { get; internal set; }
        public List<string> ListNames { get; internal set; }
        public List<int?> ListIdDeities { get; internal set; }
        public List<int> ListIdMythologies { get; internal set; }
        public List<string> ListMythologies { get; internal set; }
        public List<string> ListMyth { get; internal set; }
        public List<int> ListIdMyths { get; internal set; }
    }
}