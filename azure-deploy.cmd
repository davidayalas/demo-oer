@ECHO ON

REM Install Hugo if it's not installed
pushd D:\home\site\deployments\tools 
if not exist Hugo md Hugo
cd Hugo 
if exist bin goto build
md bin
cd bin
:install
curl -o hugo.zip -L https://github.com/gohugoio/hugo/releases/download/v0.40/hugo_0.40_Windows-64bit.zip
echo Installing Hugo...
SetLocal DisableDelayedExpansion & d:\7zip\7za x hugo.zip


REM Generate Hugo static site from source on GitHub
:build
popd
REM call node D:\home\site\repository\tasks\rename-languages.js
REM call node D:\home\site\repository\tasks\create-relative-cms.js
call D:\home\site\deployments\tools\hugo\bin\hugo -d D:\home\site\wwwroot
call cp web.config D:\home\site\wwwroot
REM call rename D:\home\site\wwwroot todelete
REM call rename D:\home\site\wwwroot2 wwwroot
REM call rd /s /q D:\home\site\todelete
call cd ./tasks/search/
call npm install
call node azure-indexer.js
echo Hugo build finished successfully. 