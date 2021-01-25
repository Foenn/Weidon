using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Weidon.Models
{
    public class MythViewModel
    {
        public List<int> ListIds { get; internal set; }
        public List<string> ListNames { get; internal set; }
        public List<string> ListAlternativeNames { get; internal set; }
        public List<string> ListMeanings { get; internal set; }
        public List<string> ListStories { get; internal set; }
        public List<string> ListOrigins { get; internal set; }
        public List<string> ListEquivalentMyths { get; internal set; }
        public int Id { get; internal set; }
        public string Name { get; internal set; }
        public string AlternativeNames { get; internal set; }
        public int IdMythology { get; internal set; }
        public string Mythology { get; internal set; }
        public string Meaning { get; internal set; }
        public string Story { get; internal set; }
        public string Origin { get; internal set; }
        public string EquivalentMyths { get; internal set; }
        public CharacterViewModel Characters { get; internal set; }
    }
}