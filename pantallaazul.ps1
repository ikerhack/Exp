Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase
Add-Type -AssemblyName System.Windows.Forms

# Crear ventana a pantalla completa, sin bordes y siempre encima
$win = New-Object Windows.Window
$win.WindowStyle = 'None'
$win.ResizeMode  = 'NoResize'
$win.WindowState = 'Maximized'
$win.Topmost     = $true
$win.Background  = New-Object Windows.Media.SolidColorBrush([Windows.Media.Color]::FromRgb(0,120,215)) # azul tipo Windows

# Ocultar el cursor
[System.Windows.Forms.Cursor]::Hide()

# Contenido: texto estilo BSOD
$grid = New-Object Windows.Controls.Grid
$grid.Margin = 80

$stack = New-Object Windows.Controls.StackPanel
$stack.VerticalAlignment = 'Center'
$stack.HorizontalAlignment = 'Left'

$emoji = New-Object Windows.Controls.TextBlock
$emoji.Text = ":("
$emoji.FontSize = 140
$emoji.FontWeight = 'Bold'
$emoji.Foreground = 'White'
$emoji.Margin = '0,0,0,40'

$msg1 = New-Object Windows.Controls.TextBlock
$msg1.Text = "Your PC ran into a problem and needs to restart."
$msg1.FontSize = 34
$msg1.Foreground = 'White'
$msg1.Margin = '0,0,0,10'

$msg2 = New-Object Windows.Controls.TextBlock
$msg2.Text = "We're just collecting some error info, and then we'll restart for you."
$msg2.FontSize = 26
$msg2.Foreground = 'White'
$msg2.Margin = '0,0,0,30'

$perc = New-Object Windows.Controls.TextBlock
$perc.Text = "100% complete"
$perc.FontSize = 26
$perc.Foreground = 'White'
$perc.Margin = '0,0,0,60'

$qr = New-Object Windows.Controls.TextBlock
$qr.Text = "For more information about this issue and possible fixes, visit https://www.windows.com/stopcode"
$qr.FontSize = 18
$qr.Foreground = 'White'
$qr.TextWrapping = 'Wrap'
$qr.Margin = '0,0,0,6'

$stop = New-Object Windows.Controls.TextBlock
$stop.Text = "If you call a support person, give them this info: Stop code: FAKE_SIMULATED_BSOD"
$stop.FontSize = 18
$stop.Foreground = 'White'
$stop.TextWrapping = 'Wrap'

$stack.Children.Add($emoji) | Out-Null
$stack.Children.Add($msg1)  | Out-Null
$stack.Children.Add($msg2)  | Out-Null
$stack.Children.Add($perc)  | Out-Null
$stack.Children.Add($qr)    | Out-Null
$stack.Children.Add($stop)  | Out-Null

$grid.Children.Add($stack) | Out-Null
$win.Content = $grid

# Salir con Esc o Alt+F4
$win.Add_KeyDown({
    if ($_.Key -eq 'Escape') {
        [System.Windows.Forms.Cursor]::Show()
        $this.Close()
    }
})

$win.Closed.Add({
    [System.Windows.Forms.Cursor]::Show()
})

$win.ShowDialog() | Out-Null
