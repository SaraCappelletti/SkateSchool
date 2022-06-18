using System.Diagnostics;
using System.Linq;

namespace SkateSchool.ViewModels
{
    internal class IscrizioneCorsiVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        public bool IsIscritto { get; set; }
        public bool IsNotIscritto => !IsIscritto;

        public Iscritto[] Iscritti => db.Iscritto.ToArray();
        public string NomeIscritto { get; set; }
        public string CognomeIscritto { get; set; }
        public int EtaIscritto { get; set; }
        public string TelefonoIscritto { get; set; }
        public string LivelloIscritto { get; set; }
        public Iscritto IscrittoSelected { get; set; }

        public Sede[] Sedi => db.Sede.ToArray();
        public Sede SedeSelected { get; set; }

        public Corso[] Corsi => SedeSelected?.Corsi.ToArray();
        public Corso CorsoSelected { get; set; }

        public Lezione[] Lezioni => CorsoSelected?.Lezioni.ToArray();
        public Lezione LezioneSelected { get; set; }

        public int? LezioniRimaste => IscrittoSelected?.Pagamento.Where(p => !p.Tariffario.Privata).Sum(p => p.NumeroLezioniRimaste);

        public bool IsSedeSelected => SedeSelected != null;
        public bool IsCorsoSelected => CorsoSelected != null;
        public bool IsIscrittoSelected => IscrittoSelected != null;
        public bool CanPrenotare => IscrittoSelected != null && LezioneSelected != null && LezioniRimaste != 0;

        public void PrenotaLezione()
        {
            IscrittoSelected.Lezioni.Add(LezioneSelected);
            var pagamento = IscrittoSelected.Pagamento.OrderBy(p => p.Data).First(p => p.NumeroLezioniRimaste > 0 && !p.Tariffario.Privata);
            pagamento.NumeroLezioniRimaste--;
            db.SaveChanges();
            OnPropertyChanged(nameof(LezioniRimaste));
        }

    }
}
