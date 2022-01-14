function convert-jfif(){
    param(
        [parameter(mandatory=$True)][string] $PictureFilePath
    )

    $Pictures = get-childitem -path $PictureFilePath

    foreach ($Picture in $Pictures)
    {
        if ($Picture.Name -like "*.jfif")
        {
            $NewName = $Picture.name.split('.')[0] + '.jpeg'

            try{

                write-host  "Converting " -NoNewline
                Write-Host $Picture.name -ForegroundColor Cyan -NoNewline
                Write-Host " to: " -NoNewline
                write-host $NewName -ForegroundColor Magenta
                Write-Host "Status: " -NoNewline

                $Picture | rename-item -NewName $NewName

                write-host "Success" -ForegroundColor Green
            }
            catch{
                Write-Host "Failed" -ForegroundColor Red
            }
        }
    }
}
