using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SkateSchool.ViewModels
{
    internal class PrestitoVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        public Sede[] Sedi => db.Sede.ToArray();   
        public Sede SedeSelected { get; set; }

        public Iscritto[] Iscritti => db.Iscritto.ToArray();
        public Iscritto IscrittoSelected { get; set; }

        public Attrezzatura[] Attrezzatura => IsSedeSelected && IsIscrittoSelected ? (IsRestituzione
            ? SedeSelected.Attrezzatura.Where(a => a.Prestito.Any(p => !p.Restituito && p.CodiceIscritto == IscrittoSelected.CodiceIscritto)).ToArray()
            : SedeSelected.Attrezzatura.Where(a => a.Prestito.All(p => p.Restituito)).ToArray()) : null;
        public Attrezzatura AttrezzaturaSelected { get; set; }

        public bool IsRestituzione { get; set; }
        public bool IsSedeSelected => SedeSelected != null;
        public bool IsIscrittoSelected => IscrittoSelected != null;
        public bool CanPrestito => IsSedeSelected && IsIscrittoSelected && AttrezzaturaSelected != null && !IsRestituzione;
        public bool CanRestituire => IsSedeSelected && IsIscrittoSelected && AttrezzaturaSelected != null && IsRestituzione;


        public void AddPrestito()
        {
            var prestito = new Prestito
            {
                CodiceIscritto = IscrittoSelected.CodiceIscritto,
                CodiceAttrezzo = AttrezzaturaSelected.CodiceAttrezzo,
                Data = DateTime.Now,
                Restituito = false
            };
            db.Prestito.Add(prestito);
            db.SaveChanges();
            OnPropertyChanged(nameof(Attrezzatura));
        }

        public void RemovePrestito()
        {
            var prestito = AttrezzaturaSelected.Prestito.First(p => !p.Restituito && p.CodiceIscritto == IscrittoSelected.CodiceIscritto);
            prestito.Restituito = true;
            db.Entry(prestito).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            OnPropertyChanged(nameof(Attrezzatura));
        }
    }
}
