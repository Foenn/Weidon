using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Weidon.Models;

namespace Weidon.Controllers
{
    public class ListDeitiesController : Controller
    {
        // GET: ListDeities
        public ActionResult Index(int IdMythology)
        {
            var vm = new DeityViewModel();
            using (var context = new WeidonDbEntities())
            {
                var ListDeities = context.Deity.Where(d => d.IdMythology == IdMythology).ToList();
                vm.IdMythology = IdMythology;
                vm.Mythology = (from Deity in ListDeities
                                select Deity.Mythology).FirstOrDefault();
                vm.ListIds = (from Deity in ListDeities
                              select Deity.Id).ToList();
                vm.ListNames = (from Deity in ListDeities
                                select Deity.Name).ToList();
                vm.ListAlternativeNames = (from Deity in ListDeities
                                           select Deity.AlternativeNames).ToList();
                vm.ListRoles = (from Deity in ListDeities
                                select Deity.Roles).ToList();
                vm.ListEtymologies = (from Deity in ListDeities
                                      select Deity.Etymology).ToList();
                vm.ListOrigins = (from Deity in ListDeities
                                  select Deity.Origin).ToList();
                vm.ListSymbolisms = (from Deity in ListDeities
                                     select Deity.Symbolism).ToList();
                vm.ListEquivalentDeities = (from Deity in ListDeities
                                            select Deity.EquivalentDeities).ToList();
            }
            return View(vm);
        }
    }
}