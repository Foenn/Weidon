using Data;
using Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Weidon.Models;

namespace Weidon.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            try
            {
                var vm = new MythologyViewModel();
                using (var context = new WeidonDbEntities())
                {
                    var images = context.MythologyImages.ToList();
                    var mythologies = context.Mythology.ToList();
                    if (mythologies.Count > 0)
                    {
                        List<int> ids = (from Mythology in mythologies
                                         select Mythology.Id).ToList();
                        List<string> names = (from Mythology in mythologies
                                              select Mythology.Name).ToList();
                        List<string> contents = (from Mythology in mythologies
                                                 select Mythology.Content).ToList();
                        List<string> imagePaths = (from Image in images
                                                   select Image.ImagePath).ToList();
                        vm.ListIds = ids;
                        vm.ListNames = names;
                        vm.ListContents = contents;
                        vm.ListMythologies = mythologies;
                        vm.ListImagepaths = imagePaths;
                    }
                    else
                    {
                        throw new Exception("Query result does not contain any data.");
                    }
                }
                return View(vm);
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.Message);
                return View("Error");
            }
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

    }
}