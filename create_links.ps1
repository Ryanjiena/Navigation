# 将当前文件夹下的文件内容合并到 links.toml 文件中。

$sourcepath = "E:\Github\Navigation.git\data"
$destination_file = "links.toml"
$date = Get-Date -Format "dddd yyyy-MM-dd HH:mm:ss K"

function CreateLinks {

    Write-Host ""
    Write-Host -ForegroundColor DarkCyan $sourcepath "目录下发现以下文件"
    $sourcepath_file = Get-ChildItem -Name -Exclude links.toml
    Write-Host ""
    Write-Host -ForegroundColor White $sourcepath_file
    Write-Host ""

    Write-Host -ForegroundColor DarkCyan "开始处理..."
    Write-Host ""
    
    $files = Get-ChildItem -Name | Where-Object { $_.Name -ne $destination_file }
    foreach ($file in $files) {
        Write-Host -ForegroundColor DarkCyan "正在处理文件 " -NoNewline
        Write-Host -ForegroundColor White $File
        Get-Content $file | Out-File -Append -Encoding utf8 -FilePath $destination_file
    }

    Write-Host ""
    Write-Host -ForegroundColor DarkCyan "处理完成!"
}

function Commit {
    git add data\links.toml
    # git commit -m ":rocket: deploy: $date"
    git commit -m ":memo: Update links.toml."
}

function OpenWebsite {
    Start-Process -FilePath https://ryanjiena.github.io/Navigation/
    Start-Process -FilePath https://nav.ryanjie.cn
}

Set-Location $sourcepath
Remove-Item $destination_file
CreateLinks

OpenWebsite
