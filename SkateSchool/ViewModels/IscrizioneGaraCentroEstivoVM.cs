using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Markup;

namespace SkateSchool.ViewModels
{
    internal class IscrizioneGaraCentroEstivoVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        public Iscritto[] Iscritti => db.Iscritto.ToArray();
        public Iscritto IscrittoSelected { get; set; }

        private IQueryable<Gara> GareFuture => IscrittoSelected != null ? db.Gara.Where(g => g.Data > DateTime.Now && !g.Iscritto.Select(i => i.CodiceIscritto).Contains(IscrittoSelected.CodiceIscritto)) : null;

        public string[] CittaGare => GareFuture?.Select(g => g.Citta).Distinct().ToArray();
        public string CittaSelected { get; set; }

        public string[] CategoriaGare => CittaSelected != null ? GareFuture?.Where(g => g.Citta == CittaSelected).Select(g => g.Categoria).Distinct().ToArray() : null;
        public string CategoriaSelected { get; set; }

        public Gara[] Gare => CategoriaSelected != null ? GareFuture?.Where(g => g.Citta == CittaSelected && g.Categoria == CategoriaSelected).OrderBy(g => g.Data).ToArray() : null;
        public Gara GaraSelected { get; set; }
        public Gara[] GareIscritto => IscrittoSelected != null ? db.Gara.Where(g => g.Data > DateTime.Now && g.Iscritto.Select(i => i.CodiceIscritto).Contains(IscrittoSelected.CodiceIscritto)).OrderBy(g => g.Data).ToArray() : null;

        public CentroEstivo[] CentriEstivi => IscrittoSelected != null ? db.CentroEstivo.Where(c => c.DataFine >= DateTime.Now && !c.Iscritto.Select(i => i.CodiceIscritto).Contains(IscrittoSelected.CodiceIscritto)).OrderBy(c => c.DataInizio).ToArray() : null;
        public CentroEstivo CentroEstivoSelected { get; set; }
        public CentroEstivo[] CentriEstiviIscritto => IscrittoSelected != null ? db.CentroEstivo.Where(c => c.DataFine >= DateTime.Now && c.Iscritto.Select(i => i.CodiceIscritto).Contains(IscrittoSelected.CodiceIscritto)).OrderBy(c => c.DataInizio).ToArray() : null;

        public bool IsIscrittoSelected => IscrittoSelected != null;
        public bool IsCittaSelected => !string.IsNullOrEmpty(CittaSelected);
        public bool IsCategoriaSelected => !string.IsNullOrEmpty(CategoriaSelected);
        public bool CanAddIscrittoGara => IsCittaSelected && IsCategoriaSelected && GaraSelected != null;
        public bool IsCentriEmpty => CentriEstivi != null && CentriEstivi.Length == 0;
        public bool IsGareEmpty => CittaGare != null && CittaGare.Length == 0;
        public bool IsNotGiaIscrittoGara => IsIscrittoSelected && !IsGareEmpty;
        public bool IsNotGiaIscrittoCentroEstivo => IsIscrittoSelected && !IsCentriEmpty;
        public bool CanAddIscrittoCentroEstivo => CentroEstivoSelected != null;

        public void AddIscrittoCentroEstivo()
        {
            CentroEstivoSelected.Iscritto.Add(IscrittoSelected);
            db.SaveChanges();
            CentroEstivoSelected = null;
            OnPropertyChanged(nameof(CentriEstivi), nameof(CentriEstiviIscritto), nameof(IsCentriEmpty), nameof(IsNotGiaIscrittoCentroEstivo));
        }

        public void AddIscrittoGara()
        {
            GaraSelected.Iscritto.Add(IscrittoSelected);
            db.SaveChanges();
            CittaSelected = null;
            OnPropertyChanged(nameof(CittaGare), nameof(GareIscritto), nameof(IsGareEmpty), nameof(IsNotGiaIscrittoGara));
        }
    }
}
