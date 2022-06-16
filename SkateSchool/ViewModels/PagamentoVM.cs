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

        public Tariffario[] Tariffari => db.Tariffario.ToArray();
    }
}
