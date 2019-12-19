# function forcing powershell to work even though powershell already ahs admin permissions
function force {
	Set-ExecutionPolicy AllSigned -Scope CurrentUser -Force
	Set-ExecutionPolicy Bypass -Scope CurrentUser -Force
	Set-ExecutionPolicy Default -Scope CurrentUser -Force
	Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
	Set-ExecutionPolicy Restricted -Scope CurrentUser -Force
	Set-ExecutionPolicy Undefined -Scope CurrentUser -Force
	Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
}
# testing if the one line works
function single_force {
	Set-ExecutionPolicy -ExecutionPolicy Unrestricted
}

# Taking user input for a if,elseif, else optoin menu
$param=$args[0]

if ($param -Match "-w") {
write-host "hello world"
}
elseif ($param -Match "-f") {
	force
}
elseif ($param -Match "-of") {
	single_force
}
else {
	write-host ".\open_force.ps1 <option>`n"
	write-host ".\open_force.ps1 -w [ Prints hello world ]`n" 
	write-host ".\open_force.ps1 -f [ Allows powershell shell to run ps1 scripts ]" 
	write=host ".\open_force.ps1 -of [ more simple than -f with a single line ]"
}

