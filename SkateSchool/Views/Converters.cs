using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;
using System.Windows.Markup;

namespace SkateSchool.Views
{
    class BoolToVisibilityConverter : BaseConverter<bool>
    {
        protected override object Convert(bool value) => value ? Visibility.Visible : Visibility.Collapsed;
    }

    public abstract class BaseConverter<T> : MarkupExtension, IValueConverter
    {
        public override object ProvideValue(IServiceProvider serviceProvider) => this;
        protected abstract object Convert(T value);
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture) => Convert((T)value);
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) => null;
    }
}
