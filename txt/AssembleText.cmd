
@echo off

set "textprocess=%~dp0..\tools\TextProcess\text-process-classic.py"
set "parsefile=%~dp0..\EventAssembler\Tools\ParseFile.exe"

echo: | (python3 "%textprocess%" "entries.txt" --parser-exe "%parsefile%" --depends "parseDefs.txt" --installer "installTextData.event" --definitions "textDefs.event")

pause
