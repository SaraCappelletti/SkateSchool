using System.ComponentModel;

namespace SkateSchool.ViewModels
{
    abstract class BaseVM : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(PropertyChangedEventArgs eventArgs) => PropertyChanged?.Invoke(this, eventArgs);

        protected void OnPropertyChanged(params string[] properties)
        {
            foreach (var p in properties)
                OnPropertyChanged(new PropertyChangedEventArgs(p));
        }
    }
}