using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication3.Controllers
{
    public class UploadFileController : Controller
    {
        string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        public ActionResult Index()
        {
            return View();
        }

        private bool isValidContentType(string contentType)
        {
            return contentType.Equals("image/png") || contentType.Equals("image/gif") || contentType.Equals("image/jpg") || contentType.Equals("image/jpeg");
        }

        private bool isValidContentLenght(int contentLenght)
        {
            return ((contentLenght / 1024) / 1024) < 1; // 1MB
        }
        [HttpPost]
        public ActionResult Process(HttpPostedFileBase photo)
        {
            if (!isValidContentType(photo.ContentType))
            {
                ViewBag.Error = "Only PNG, GIF, JPG and JPEG files are allowed.";
                return View("Index");
            }
            else if (!isValidContentLenght(photo.ContentLength))
            {
                ViewBag.Error = "Max file size is 1MB.";
                return View("Index");
            }
            else
            {
                if(photo.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(photo.FileName);
                    var path = Path.Combine(Server.MapPath("~/content/images"), fileName);
                    photo.SaveAs(path);
                    ViewBag.fileName = photo.FileName;
                }
                return View("Success");
            }
            
        }
    }
}