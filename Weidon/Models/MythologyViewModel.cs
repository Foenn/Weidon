using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Weidon.Models
{
    public class MythologyViewModel
    {
        public List<string> ListNames { get; internal set; }
        public List<string> ListContents { get; internal set; }
        public List<Mythology> ListMythologies { get; internal set; }
        public List<int> ListIds { get; internal set; }
        public int Id { get; internal set; }
        public string Name { get; internal set; }
        public string Content { get; internal set; }
        public Mythology Mythology { get; internal set; }
        public string Area { get; internal set; }
    }
}