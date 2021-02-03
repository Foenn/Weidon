using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Weidon.Models;

namespace Weidon.Controllers
{
    public class ListMythsController : Controller
    {
        // GET: ListMyths
        public ActionResult Index(int? IdMythology)
        {
            try
            {
                if (IdMythology.HasValue)
                {
                    var vm = new MythViewModel();
                    using (var context = new WeidonDbEntities())
                    {
                        var ListMyths = context.Myth.Where(m => m.IdMythology == IdMythology).ToList();
                        if (ListMyths.Count > 0)
                        {
                            vm.IdMythology = IdMythology.Value;
                            vm.Mythology = (from Myth in ListMyths
                                            select Myth.Mythology).FirstOrDefault();
                            vm.ListIds = (from Myth in ListMyths
                                          select Myth.Id).ToList();
                            vm.ListNames = (from Myth in ListMyths
                                            select Myth.Name).ToList();
                            vm.ListAlternativeNames = (from Myth in ListMyths
                                                       select Myth.AlternativeNames).ToList();
                            vm.ListMeanings = (from Myth in ListMyths
                                               select Myth.Meaning).ToList();
                            vm.ListStories = (from Myth in ListMyths
                                              select Myth.Story).ToList();
                            vm.ListOrigins = (from Myth in ListMyths
                                              select Myth.Origin).ToList();
                            vm.ListEquivalentMyths = (from Myth in ListMyths
                                                      select Myth.EquivalentMyths).ToList();
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