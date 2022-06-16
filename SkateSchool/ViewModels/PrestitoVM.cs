using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SkateSchool.ViewModels
{
    internal class PrestitoVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        public bool IsPrestato { get; set; }

        public Attrezzatura[] Attrezzi => db.Attrezzatura.ToArray();
        public int AttrezzaturaId { get; set; }
        public int CodSede { get; set; }
        public string Descrizione { get; set; }

        public Sede[] Sedi => db.Sede.ToArray();   
        public Sede SedeSelected { get; set; }

        public Iscritto[] Iscritti => db.Iscritto.ToArray();

    }
}
