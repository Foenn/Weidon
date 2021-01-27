using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Weidon.Models
{
    public class DeityViewModel
    {
        public List<int> ListIds { get; internal set; }
        public List<string> ListNames { get; internal set; }
        public List<string> ListAlternativeNames { get; internal set; }
        public List<string> ListRoles { get; internal set; }
        public List<string> ListEtymologies { get; internal set; }
        public List<string> ListOrigins { get; internal set; }
        public List<string> ListSymbolisms { get; internal set; }
        //public List<string> ListEquivalentDeities { get; internal set; }
        public int Id { get; internal set; }
        public string Name { get; internal set; }
        public string AlternativeNames { get; internal set; }
        public string Roles { get; internal set; }
        public string Etymology { get; internal set; }
        public string Origin { get; internal set; }
        public string Symbolism { get; internal set; }
        //public string EquivalentDeities { get; internal set; }
        public string Mythology { get; internal set; }
        public int IdMythology { get; internal set; }
        public ICollection<EquivalentDeities> EquivalentDeities { get; internal set; }
        public List<ICollection<EquivalentDeities>> ListEquivalentDeities { get; internal set; }
    }
}