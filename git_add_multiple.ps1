# Define the file containing the list of files to be added to Git
$filePath = "C:\Users\willk\Documents\GitHub\StellarModbuild\modded streamwaves.txt"

# Check if the file exists
if (-Not (Test-Path $filePath)) {
    Write-Host "File not found: $filePath"
    exit
}

# Read each line from the file
$lines = Get-Content $filePath

# Loop through each line in the file
foreach ($line in $lines) {
    # Trim any whitespace from the file path
    $trimmedLine = $line.Trim()

    # Check if the trimmed line is not empty
    if (-Not [string]::IsNullOrWhiteSpace($trimmedLine)) {
        # Forcefully add the file to Git staging
        git add -f $trimmedLine

        # Check for errors in the last command
        if ($LASTEXITCODE -ne 0) {
            Write-Error "Failed to add file: $trimmedLine"
        } else {
            Write-Host "Successfully added file: $trimmedLine"
        }
    }
}
