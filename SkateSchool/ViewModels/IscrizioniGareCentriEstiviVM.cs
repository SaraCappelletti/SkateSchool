using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SkateSchool.ViewModels
{
    internal class IscrizioniGareCentriEstiviVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        public CentroEstivo[] CentriEstivi => db.CentroEstivo.ToArray();
        public CentroEstivo CentroSelected { get; set; }
        public bool IsCentroEstivo { get; set; }

        public Gara[] Gare => db.Gara.ToArray();
        public Gara GaraSelected { get; set; }
        public bool IsGara => !IsCentroEstivo;

        public Iscritto[] Iscritti => db.Iscritto.ToArray();
        public string NomeIscritto { get; set; }
        public string CognomeIscritto { get; set; }

        public void AddIscrittoCentroEstivo()
        {
            
        }

        public void AddIscrittoGara()
        {

        }

    }
}
