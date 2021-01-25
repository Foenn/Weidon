using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;

namespace Logic
{
    public class MythologyManager
    {
        public List<Mythology> GetMythologies()
        {
            List<Mythology> mythologies = new List<Mythology>();

            //mythologies.Add(new Mythology
            //{
            //    Name = "Greek Mythology",
            //    Deities = new DeityManager().GetGreekDeities(),
            //    Myths = new MythManager().GetMyths(),
            //    Content = "This is about Greek Mythology.",
            //});
            //mythologies.Add(new Mythology
            //{
            //    Name = "Roman Mythology",
            //    Deities = new DeityManager().GetRomanDeities(),
            //    Myths = new MythManager().GetMyths(),
            //    Content = "This is about Roman Mythology.",
            //});
            //mythologies.Add(new Mythology
            //{
            //    Name = "Norse Mythology",
            //    Deities = new DeityManager().GetNorseDeities(),
            //    Myths = new MythManager().GetMyths(),
            //    Content = "This is about Norse Mythology.",
            //});

            return mythologies;
        }
    }
}
