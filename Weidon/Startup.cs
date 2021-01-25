using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Weidon.Startup))]
namespace Weidon
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
