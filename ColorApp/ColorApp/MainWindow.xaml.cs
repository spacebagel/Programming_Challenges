using System.Windows;

namespace ColorApp;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow : Window
{
    MainViewModel viewModel = new MainViewModel();
    public MainWindow()
    {
        InitializeComponent();
        DataContext = viewModel;
    }
}