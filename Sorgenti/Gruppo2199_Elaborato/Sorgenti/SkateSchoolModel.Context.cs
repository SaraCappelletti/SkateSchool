﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SkateSchoolEntities : DbContext
    {
        public SkateSchoolEntities()
            : base("name=SkateSchoolEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Attrezzatura> Attrezzatura { get; set; }
        public virtual DbSet<CentroEstivo> CentroEstivo { get; set; }
        public virtual DbSet<Corso> Corso { get; set; }
        public virtual DbSet<Gara> Gara { get; set; }
        public virtual DbSet<Iscritto> Iscritto { get; set; }
        public virtual DbSet<Istruttore> Istruttore { get; set; }
        public virtual DbSet<Lezione> Lezione { get; set; }
        public virtual DbSet<LezionePrivata> LezionePrivata { get; set; }
        public virtual DbSet<Oggetto> Oggetto { get; set; }
        public virtual DbSet<Pagamento> Pagamento { get; set; }
        public virtual DbSet<Prestito> Prestito { get; set; }
        public virtual DbSet<Sede> Sede { get; set; }
        public virtual DbSet<Tariffario> Tariffario { get; set; }
        public virtual DbSet<TipologiaOggetto> TipologiaOggetto { get; set; }
        public virtual DbSet<Vendita> Vendita { get; set; }
    }
}