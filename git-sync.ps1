# git pull 대신 사용하는 동기화 스크립트
# Windows Defender가 git.exe의 파일 생성을 막는 환경에서 우회 동작

$repoRoot = $PSScriptRoot
Push-Location $repoRoot

try {
    Write-Host "Fetching from origin..." -ForegroundColor Cyan
    git fetch origin

    # HEAD와 index를 origin/main으로 이동 (working tree 유지)
    git reset --mixed origin/main | Out-Null

    # index에 있지만 working tree에 없는 파일 목록 (D = deleted in working tree)
    $deletedFiles = git diff --name-only --diff-filter=D HEAD

    if ($deletedFiles) {
        Write-Host "Restoring $($deletedFiles.Count) file(s) blocked by security software..." -ForegroundColor Yellow
        foreach ($file in $deletedFiles) {
            $blobHash = git rev-parse "HEAD:$file"
            $targetPath = Join-Path $repoRoot $file.Replace('/', '\')
            $targetDir = Split-Path $targetPath -Parent

            if (-not (Test-Path $targetDir)) {
                New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
            }

            $tmpFile = [System.IO.Path]::GetTempFileName()
            cmd /c "git cat-file blob $blobHash > `"$tmpFile`""
            [System.IO.File]::Copy($tmpFile, $targetPath, $true)
            Remove-Item $tmpFile
            Write-Host "  Restored: $file" -ForegroundColor Green
        }
    }

    # index에 있고 working tree와 내용이 다른 파일 (M = modified in working tree)
    $modifiedFiles = git diff --name-only --diff-filter=M HEAD

    if ($modifiedFiles) {
        Write-Host "Restoring $($modifiedFiles.Count) modified file(s)..." -ForegroundColor Yellow
        foreach ($file in $modifiedFiles) {
            $blobHash = git rev-parse "HEAD:$file"
            $targetPath = Join-Path $repoRoot $file.Replace('/', '\')

            $tmpFile = [System.IO.Path]::GetTempFileName()
            cmd /c "git cat-file blob $blobHash > `"$tmpFile`""
            [System.IO.File]::Copy($tmpFile, $targetPath, $true)
            Remove-Item $tmpFile
            Write-Host "  Restored: $file" -ForegroundColor Green
        }
    }

    git status
    Write-Host "Sync complete." -ForegroundColor Cyan
}
finally {
    Pop-Location
}
