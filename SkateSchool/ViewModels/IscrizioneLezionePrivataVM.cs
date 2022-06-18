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
        public Iscritto IscrittoSelected { get; set; }

        public DateTime? DataSelected { get; set; }

        public TimeSpan[] OrariDisponibili { get; } = 
            Enumerable.Range(8, 22).SelectMany(h => new[] { 0, 15, 30, 45 }.Select(m => new TimeSpan(h, m, 0))).ToArray();
        public TimeSpan? OrarioSelected { get; set; }

        public DateTime? DataOraLezione => DataSelected?.Add(OrarioSelected.Value);

        public Istruttore[] Istruttori => IsDataOraSelected ? 
            db.Istruttore.Where(i => i.Lezione.Cast<ILezioneBase>().Concat(i.LezionePrivata).All(l => !l.IsDateTimeDuringLezione(DataOraLezione.Value))).ToArray() : null;
        public Istruttore IstruttoreSelected { get; set; }

        public Sede[] Sedi => db.Sede.ToArray();
        public Sede SedeSelected { get; set; }

        public bool IsDataOraSelected => DataSelected != null && OrarioSelected != null;
        public bool CanAddLezione => IsDataOraSelected && IscrittoSelected != null && IstruttoreSelected != null && SedeSelected != null;

        public void AddLezionePrivata()
        {
            var lezionePrivata = new LezionePrivata
            {
                CodiceIstruttore = IstruttoreSelected.CodiceIstruttore,
                CodiceSede = SedeSelected.CodiceSede,
                CodiceIscritto = IscrittoSelected.CodiceIscritto,
                Data = DataOraLezione.Value
            };
            db.LezionePrivata.Add(lezionePrivata);
            db.SaveChanges();
        }
 
    }
}
