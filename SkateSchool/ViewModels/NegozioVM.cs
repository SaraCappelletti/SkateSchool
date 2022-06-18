using System;
using System.Linq;

namespace SkateSchool.ViewModels
{
    internal class NegozioVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        public Sede[] Sedi => db.Sede.ToArray();
        public Sede SedeSelected { get; set; }

        public Oggetto[] Oggetti => IsSedeSelected ? db.Oggetto.Where(o => o.Quantita > 0 && o.CodiceSede == SedeSelected.CodiceSede).ToArray() : null;
        public Oggetto OggettoSelected { get; set; }

        public int[] QuantitaDisponibili => IsOggettoSelected ? Enumerable.Range(1, OggettoSelected.Quantita).ToArray() : null;
        public int? QuantitaSelected { get; set; }

        public bool IsSedeSelected => SedeSelected != null;
        public bool IsOggettoSelected => OggettoSelected != null;
        public bool CanPagare => OggettoSelected != null && QuantitaSelected != null;

        public void AddVendita()
        {
            var vendita = new Vendita
            {
                CodiceOggetto = OggettoSelected.CodiceOggetto,
                Data = DateTime.Now,
                Quantita = QuantitaSelected.Value
            };
            db.Vendita.Add(vendita);
            OggettoSelected.Quantita -= QuantitaSelected.Value;
            db.SaveChanges();
            OnPropertyChanged(nameof(Oggetti));
        }

    }
}
