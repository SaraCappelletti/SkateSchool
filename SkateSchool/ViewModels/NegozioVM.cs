using System.Linq;

namespace SkateSchool.ViewModels
{
    internal class NegozioVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        public Oggetto[] Oggetti => db.Oggetto.ToArray();

        public decimal Prezzo { get; set; }
        public int QuantitaDisponibile { get; set; }
        public int QuantitaVendita { get; set; }



        /*public void UpdateQuantita()
        {
            Oggetto.Quantita = QuantitaDisponibile.Value;
            db.SaveChanges();
            OnPropertyChanged(nameof(Prodotti), nameof(QuantitaDisponibile), nameof(CanUpdateQuantita));
        }*/

    }
}
