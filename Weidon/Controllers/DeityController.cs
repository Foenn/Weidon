using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Weidon.Models;

namespace Weidon.Controllers
{
    public class DeityController : Controller
    {
        // GET: Deity
        public ActionResult Index(string name)
        {
            try
            {
                if (!(String.IsNullOrEmpty(name)))
                {
                    var vm = new DeityViewModel();
                    using (var context = new WeidonDbEntities())
                    {
                        var deity = context.Deity.FirstOrDefault(d => d.Name == name);
                        if (!(deity is null))
                        {
                            vm.Id = deity.Id;
                            vm.Name = deity.Name;
                            vm.AlternativeNames = deity.AlternativeNames;
                            vm.IdMythology = deity.IdMythology;
                            vm.Mythology = deity.Mythology;
                            vm.Roles = deity.Roles;
                            vm.Etymology = deity.Etymology;
                            vm.Origin = deity.Origin;
                            vm.Symbolism = deity.Symbolism;
                            vm.EquivalentDeities = deity.EquivalentDeities;
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
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.Message);
                return View("Error");
            }
            
        }
    }
}