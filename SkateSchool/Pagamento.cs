//------------------------------------------------------------------------------
// <auto-generated>
//     Codice generato da un modello.
//
//     Le modifiche manuali a questo file potrebbero causare un comportamento imprevisto dell'applicazione.
//     Se il codice viene rigenerato, le modifiche manuali al file verranno sovrascritte.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SkateSchool
{
    using System;
    using System.Collections.Generic;
    
    public partial class Pagamento
    {
        public int CodicePagamento { get; set; }
        public int NumeroLezioniRimaste { get; set; }
        public System.DateTime Data { get; set; }
        public int CodiceIscritto { get; set; }
        public int CodiceTariffario { get; set; }
    
        public virtual Iscritto Iscritto { get; set; }
        public virtual Tariffario Tariffario { get; set; }
    }
}
