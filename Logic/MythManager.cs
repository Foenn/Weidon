using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;

namespace Logic
{
    public class MythManager
    {
        public List<Myth> GetMyths()
        {
            List<Myth> myths = new List<Myth>();

            //myths.Add(new Myth
            //{
            //    Name = "Persephone's abduction",
            //    Mythology = "Greek",
            //    Characters = new List<string> { "Persephone", "Hades", "Zeus", "Demeter" },
            //    EquivalentMyths = new List<Myth>(),
            //    Story = "The story of how Persephone was abducted by Hades.",
            //});
            //myths.Add(new Myth
            //{
            //    Name = "Founding of Rome",
            //    Mythology = "Roman",
            //    Characters = new List<string> { "Romulus", "Remus", "Rhea Silvia", "Mars"},
            //    EquivalentMyths = new List<Myth>(),
            //    Story = "The story of the founding of Rome by Romulus and Remus.",
            //});
            //myths.Add(new Myth
            //{
            //    Name = "",
            //    Mythology = "Norse",
            //    Characters = new List<string>(),
            //    EquivalentMyths = new List<Myth>(),
            //    Story = "",
            //});

            return myths;
        }
        }
}
