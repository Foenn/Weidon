using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Weidon.Models;

namespace Weidon.Controllers
{
    public class MythController : Controller
    {
        // GET: Myth
        public ActionResult Index(string name)
        {
            try
            {
                if (!(String.IsNullOrEmpty(name)))
                {
                    var mvm = new MythViewModel();
                    var cvm = new CharacterViewModel();
                    using (var context = new WeidonDbEntities())
                    {
                        var myth = context.Myth.FirstOrDefault(m => m.Name == name);
                        if (!(myth is null))
                        {
                            var ListCharacters = context.Characters.Where(c => c.Myth == name).ToList();
                            cvm.ListIds = (from Character in ListCharacters
                                               select Character.Id).ToList();
                            cvm.ListNames = (from Character in ListCharacters
                                                select Character.Name).ToList();
                            cvm.ListIdDeities = (from Character in ListCharacters
                                                    select Character.IdDeity).ToList();
                            cvm.ListIdMythologies = (from Character in ListCharacters
                                                        select Character.IdMythology).ToList();
                            cvm.ListMythologies = (from Character in ListCharacters
                                                    select Character.Mythology).ToList();
                            cvm.ListMyth = (from Character in ListCharacters
                                            select Character.Myth).ToList();
                            cvm.ListIdMyths = (from Character in ListCharacters
                                                select Character.IdMyth).ToList();

                            mvm.Id = myth.Id;
                            mvm.Name = myth.Name;
                            mvm.AlternativeNames = myth.AlternativeNames;
                            mvm.IdMythology = myth.IdMythology;
                            mvm.Mythology = myth.Mythology;
                            mvm.Meaning = myth.Meaning;
                            mvm.Story = myth.Story;
                            mvm.Origin = myth.Origin;
                            mvm.EquivalentMyths = myth.EquivalentMyths;
                            mvm.Characters = cvm;
                        }
                        else
                        {
                            throw new Exception("Query result does not contain any data.");
                        }
                    }
                    return View(mvm);
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