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

        public Sede[] Sedi => db.Sede.ToArray();
        public Sede SedeSelected { get; set; }

        public Corso[] Corsi => SedeSelected?.Corsi.ToArray();
        public Corso CorsoSelected { get; set; }

        public Lezione[] Lezioni => CorsoSelected?.Lezioni.ToArray();
        public Lezione LezioneSelected { get; set; }

        public bool IsSedeSelected => SedeSelected != null;
        public bool IsCorsoSelected => CorsoSelected != null;

        public void FaQualcosa()
        {
            Debug.Print("Sto facendo qualcosa!");
        }

        public void AddIscritto()
        {
            var iscritto = new Iscritto
            {
                Nome = NomeIscritto,
                Cognome = CognomeIscritto,
                Eta = EtaIscritto,
                Telefono = TelefonoIscritto,
                Livello = "Base"
            };
            db.Iscritto.Add(iscritto);
            db.SaveChanges();
            //OnPropertyChanged(nameof(Iscritti));
        }

    }
}
