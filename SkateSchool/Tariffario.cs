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
    
    public partial class Tariffario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tariffario()
        {
            this.Pagamento = new HashSet<Pagamento>();
        }
    
        public int CodiceTariffario { get; set; }
        public int NumeroLezioni { get; set; }
        public float Prezzo { get; set; }
        public bool Privata { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Pagamento> Pagamento { get; set; }
    }
}
