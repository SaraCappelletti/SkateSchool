using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SkateSchool.ViewModels
{
    internal class IscrizioneCorsiVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        /*public void SonoIscritto()
        {
            public bool IsIscritto { get; set; }
        }*/

        public Sede[] Sedi => db.Sede.ToArray();
        public Sede SedeSelected { get; set; }

        public Corso[] Corsi => SedeSelected?.Corsi.ToArray();
        public Corso CorsoSelected { get; set; }

        public Lezione[] Lezioni => CorsoSelected?.Lezioni.ToArray();
        public Lezione LezioneSelected { get; set; }

        public bool IsSedeSelected => SedeSelected != null;

        public void FaQualcosa()
        {
            Debug.Print("Sto facendo qualcosa!");
        }
    }
}
