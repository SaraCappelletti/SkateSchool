﻿using SkateSchool.ViewModels;
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
    public partial class IscrizioneCorsoPage : UserControl
    {
        public IscrizioneCorsoPage()
        {
            InitializeComponent();
        }

        private void ResetVM(object sender, RoutedEventArgs e)
        {
            DataContext = new IscrizioneCorsoVM();
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
