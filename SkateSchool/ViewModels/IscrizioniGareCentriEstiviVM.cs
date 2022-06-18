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

        public Iscritto[] Iscritti => db.Iscritto.ToArray();
        public Iscritto IscrittoSelected { get; set; }

        private IQueryable<Gara> GareFuture => db.Gara.Where(g => g.Data > DateTime.Now);

        public string[] CittaGare => GareFuture.Select(g => g.Città).Distinct().ToArray();
        public string CittaSelected { get; set; }

        public string[] CategoriaGare => GareFuture.Where(g => g.Città == CittaSelected).Select(g => g.Categoria).Distinct().ToArray();
        public string CategoriaSelected { get; set; }

        public Gara[] Gare => GareFuture.Where(g => g.Città == CittaSelected && g.Categoria == CategoriaSelected).ToArray();
        public Gara GaraSelected { get; set; }

        public CentroEstivo[] CentriEstivi => db.CentroEstivo.Where(c => c.DataFine >= DateTime.Now).ToArray();
        public CentroEstivo CentroEstivoSelected { get; set; }

        public bool IsCittaSelected => CittaSelected != null;
        public bool IsCategoriaSelected => CategoriaSelected != null;
        public bool CanAddIscrittoGara => IsCittaSelected && IsCategoriaSelected && GaraSelected != null;
        public bool CanAddIscrittoCentroEstivo => CentroEstivoSelected != null;

        public void AddIscrittoCentroEstivo()
        {
            CentroEstivoSelected.Iscritto.Add(IscrittoSelected);
            db.SaveChanges();
        }

        public void AddIscrittoGara()
        {
            GaraSelected.Iscritto.Add(IscrittoSelected);
            db.SaveChanges();
        }

    }
}
