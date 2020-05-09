using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcConRepo.Models;

namespace MvcEmpresaMun.Controllers
{
    public class EmpresaController : Controller
    {
        //
        // GET: /Empresa/

        IEmpresa empresaRepositorio = new EmpresaRepositorio();
        IMunicipio municipioRepositorio = new MunicipioRepositorio();
     
        public ActionResult Index()
        {
            return View(empresaRepositorio.obtenerEmpresas());
        }

        public ActionResult Create()
        {
            List<Municipio> LstMunicipio;
            LstMunicipio = municipioRepositorio.obtenerMunicipios();
            ViewData["municipios"] = new SelectList(LstMunicipio, "idMunicipio", "nombre");

            return View();
        }
        [HttpPost]
        public ActionResult Create(Empresa emp)
        {
            empresaRepositorio.insertarEmpresa(emp);

            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            Empresa EmpAux = (empresaRepositorio.obtenerEmpresa(id));
            ViewData["nombreMunicipio"] = municipioRepositorio.obtenerMunicipio(EmpAux.idMunicipio).Nombre;
            return View(EmpAux);

        }
        public ActionResult Delete(int id)
        {

            Empresa empAUX = (empresaRepositorio.obtenerEmpresa(id));
            ViewData["nombreMunicipio"] = municipioRepositorio.obtenerMunicipio(empAUX.idMunicipio).Nombre;
            return View(empAUX);
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection frm)
        {
            empresaRepositorio.eliminarEmpresa(id);
            //Empresa empAUX = (empresaRepositorio.obtenerEmpresa(id));
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int id)
        {
            List<Municipio> LstMunicipio;
            LstMunicipio = municipioRepositorio.obtenerMunicipios();
            ViewData["municipios"] = new SelectList(LstMunicipio, "idMunicipio", "nombre");
            return View(empresaRepositorio.obtenerEmpresa(id));
        }
        [HttpPost]
        public ActionResult Edit(int id, Empresa Nemp)
        {
            Nemp.IdEmpresa = id;
            empresaRepositorio.actualizarEmpresa(Nemp);
            return RedirectToAction("Index");
        }

    }
}
