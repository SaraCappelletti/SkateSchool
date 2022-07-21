using SkateSchool.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SkateSchool.Views
{
    /// <summary>
    /// Logica di interazione per PagamentoPage.xaml
    /// </summary>
    public partial class PagamentoPage : UserControl
    {
        public PagamentoPage()
        {
            InitializeComponent();
        }

        private void ResetVM(object sender, RoutedEventArgs e)
        {
            DataContext = new PagamentoVM();
        }
    }
}
