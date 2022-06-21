using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SkateSchool.ViewModels
{
    internal class PagamentoVM : BaseVM
    {
        SkateSchoolEntities db = new SkateSchoolEntities();

        public bool IsIscritto { get; set; } = true;
        public bool IsNotIscritto => !IsIscritto;

        public Iscritto[] Iscritti => db.Iscritto.ToArray();
        public Iscritto IscrittoSelected { get; set; }

        public string NomeIscritto { get; set; }
        public string CognomeIscritto { get; set; }
        public int? EtaIscritto { get; set; }
        public string TelefonoIscritto { get; set; }
        public bool IsEtaValid { get; set; }

        public Tariffario[] Tariffari => db.Tariffario.ToArray();
        public Tariffario TariffarioSelected { get; set; }

        public bool IsIscrittoSelected => IscrittoSelected != null;
        public bool CanAddIscritto => NomeIscritto != null && CognomeIscritto != null && EtaIscritto != null && TelefonoIscritto != null;
        public bool CanPagare => IscrittoSelected != null && TariffarioSelected != null && IsEtaValid;

        public void AddIscritto()
        {
            var iscritto = new Iscritto
            {
                Nome = NomeIscritto,
                Cognome = CognomeIscritto,
                Eta = EtaIscritto.Value,
                Telefono = TelefonoIscritto,
                Livello = "Base"
            };
            db.Iscritto.Add(iscritto);
            db.SaveChanges();
            OnPropertyChanged(nameof(Iscritti));
            IscrittoSelected = iscritto;
            IsIscritto = true;
        }

        public void AddPagamento()
        {
            var pagamento = new Pagamento
            {
                CodiceIscritto = IscrittoSelected.CodiceIscritto,
                CodiceTariffario = TariffarioSelected.CodiceTariffario,
                Data = DateTime.Now,
                NumeroLezioniRimaste = TariffarioSelected.NumeroLezioni
            };
            db.Pagamento.Add(pagamento);
            db.SaveChanges();
            TariffarioSelected = null;
        }
    }
}
