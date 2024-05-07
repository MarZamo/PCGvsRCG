REM Example for /R .\Totems\ %%G in (*.mesh) do ( OgreMeshUpgrader.exe -l 5 %%G )

for /R .\ %%G in (*.mesh) do ( OgreMeshUpgrader.exe %%G )