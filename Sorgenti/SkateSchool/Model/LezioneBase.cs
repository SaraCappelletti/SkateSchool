using System;

namespace SkateSchool
{
    public interface ILezioneBase
    {
        int CodiceIstruttore { get; set; }
        DateTime Data { get; set; }
    }

    public static class LezioneBaseExtensions
    {
        public static bool IsDateTimeDuringLezione(this ILezioneBase lezione, DateTime dateTime) =>
            dateTime >= lezione.Data.Subtract(TimeSpan.FromHours(1)) && dateTime <= lezione.Data.Add(TimeSpan.FromHours(1));
    }
}