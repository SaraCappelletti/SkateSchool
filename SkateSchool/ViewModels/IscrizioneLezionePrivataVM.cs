using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SkateSchool.ViewModels
{
    internal class IscrizioneLezionePrivataVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        public Iscritto[] Iscritti => db.Iscritto.ToArray();
        public string NomeIscritto { get; set; }
        public string CognomeIscritto { get; set; }
        public int CodIscritto { get; set; }

        public Istruttore[] Istruttori => db.Istruttore.ToArray();
        public string NomeIstruttore{ get; set; }
        public string CognomeIstruttore{ get; set; }
        public int CodIstruttore { get; set; }

        public Sede[] Sedi => db.Sede.ToArray();
        public string SedeSelected { get; set; }
        public int CodSede { get; set; }

        public DateTime DataLezione { get; set; }

        public void AddLezionePrivata()
        {
            var lezionePrivata = new LezionePrivata
            {
                CodiceIstruttore = CodIstruttore,
                Data = DataLezione,
                CodiceSede = CodSede,
                CodiceIscritto = CodIscritto
            };
            db.LezionePrivata.Add(lezionePrivata);
            db.SaveChanges();
        }
 
    }
}
