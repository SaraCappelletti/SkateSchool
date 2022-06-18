namespace SkateSchool
{
    partial class Tariffario
    {
        public string TipoLezione => Privata ? "Privata" : "Corso";
        public string NomeCompleto => $"{TipoLezione} - {NumeroLezioni} {(NumeroLezioni == 1 ? "lezione" : "lezioni")} {Prezzo}€";
    }
}
