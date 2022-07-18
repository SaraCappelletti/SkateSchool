using System;
using System.Linq;

namespace SkateSchool.ViewModels
{
    internal class IscrizioneLezionePrivataVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        public Iscritto[] Iscritti => db.Iscritto.ToArray();
        public Iscritto IscrittoSelected { get; set; }

        public DateTime? DataSelected { get; set; }

        public TimeSpan[] OrariDisponibili { get; } = 
            Enumerable.Range(8, 13).SelectMany(h => new[] { 0, 15, 30, 45 }.Select(m => new TimeSpan(h, m, 0))).ToArray();
        public TimeSpan? OrarioSelected { get; set; }

        public DateTime? DataOraLezione => DataSelected?.Add(OrarioSelected.Value);

        public bool IsDataSelected => DataSelected != null && OrarioSelected != null;

        public Istruttore[] IstruttoriDisponibili => IsDataSelected ? 
            db.Istruttore.ToArray().Where(i => i.Lezione.Cast<ILezioneBase>().Concat(i.LezionePrivata).All(l => !l.IsDateTimeDuringLezione(DataOraLezione.Value))).ToArray() : null;
        public Istruttore IstruttoreSelected { get; set; }

        public Sede[] Sedi => db.Sede.ToArray();
        public Sede SedeSelected { get; set; }

        public LezionePrivata[] LezioniIscritto => IscrittoSelected?.LezioniPrivate.Where(i => i.Data >= DateTime.Now).OrderBy(l => l.Data).ToArray();

        public bool IsIscrittoSelected => IscrittoSelected != null;
        public bool CanAddLezione => IsDataSelected && IscrittoSelected != null && IstruttoreSelected != null && SedeSelected != null;

        public void AddLezionePrivata()
        {
            var lezionePrivata = new LezionePrivata
            {
                CodiceIstruttore = IstruttoreSelected.CodiceIstruttore,
                CodiceSede = SedeSelected.CodiceSede,
                CodiceIscritto = IscrittoSelected.CodiceIscritto,
                Data = DataOraLezione.Value,
                Durata = 60
            };
            db.LezionePrivata.Add(lezionePrivata);
            db.SaveChanges();
            DataSelected = null;
            OrarioSelected = null;
            SedeSelected = null;
            OnPropertyChanged(nameof(IstruttoriDisponibili), nameof(LezioniIscritto));
        }
    }
}
