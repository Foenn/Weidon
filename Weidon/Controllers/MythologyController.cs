using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Logic;
using Data;
using Weidon.Models;

namespace Weidon.Controllers
{
    public class MythologyController : Controller
    {
        // GET: Mythology
        public ActionResult Infos(string name)
        {
            var vm = new MythologyViewModel();
            using (var context = new WeidonDbEntities())
            { 
                var mythology = context.Mythology.FirstOrDefault(m => m.Name == name);
                //var mythology = mythologies.FirstOrDefault(m => m.Id == id);
                vm.Id = mythology.Id;
                vm.Name = mythology.Name;
                vm.Content = mythology.Content;
                vm.Area = mythology.Area;
                vm.Mythology = mythology;
            }
            return View(vm);
        }
    }
}