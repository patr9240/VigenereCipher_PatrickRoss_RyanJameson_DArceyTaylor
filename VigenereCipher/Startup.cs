using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VigenereCipher.Startup))]
namespace VigenereCipher
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
