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
        public ActionResult Index(int? IdMythology)
        {
            try 
            {
                if (IdMythology.HasValue)
                {
                        var vm = new DeityViewModel();
                        using (var context = new WeidonDbEntities())
                        {

                            var ListDeities = context.Deity.Where(d => d.IdMythology == IdMythology.Value).ToList();
                            if (ListDeities.Count > 0)
                            {
                                vm.IdMythology = IdMythology.Value;
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
                            else
                            {
                                throw new Exception("Query result does not contain any data.");
                            }
                        }
                        return View(vm);
                }
                else
                {
                    throw new ArgumentNullException();
                }
            }
            catch(Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.Message);
                return View("Error");
            }
        }
    }
}