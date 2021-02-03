using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Weidon
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "mythology",
                url: "Mythology/{name}",
                defaults: new { controller = "Mythology", action = "Infos" }
            );

            routes.MapRoute(
                name: "deity",
                url: "Deity/{name}",
                defaults: new { controller = "Deity", action = "Index" }
            );

            routes.MapRoute(
                name: "myth",
                url: "Myth/{name}",
                defaults: new { controller = "Myth", action = "Index" }
            );

            routes.MapRoute(
                name: "listdeities",
                url: "ListDeities/{IdMythology}",
                defaults: new { controller = "ListDeities", action = "Index", IdMythology = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "listmyths",
                url: "ListMyths/{IdMythology}",
                defaults: new { controller = "ListMyths", action = "Index", IdMythology = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
