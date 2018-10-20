#Persistent
#SingleInstance, force

NumpadSub::
	SoundSet -10
	KnobbySoundMessage(0)
return

NumpadAdd::
	SoundSet +10
	KnobbySoundMessage(1)
return

NumpadDiv::
	Run nircmd setdefaultsounddevice "Speakers"
	KnobbyDefaultDisplayMessage(0)
return

NumpadMult::
	Run nircmd setdefaultsounddevice "Headset"
	Run nircmd setdefaultsounddevice "Headset" 2
	KnobbyDefaultDisplayMessage(1)
return

KnobbyMessageOff(){
	SplashTextOff
}

KnobbySoundMessage(u)
{
	SoundGet, master_volume
	t := Chr(128251)
	v := ceil(master_volume)
	m := Chr(128265)
	if (u == 1)
		m := Chr(128266)
	if (v == 100)
		v := Chr(128175)
	SplashTextOn, 60, 50, %t%, %m%%v%
	WinMove, %t%, , 0, 0
	SetTimer, KnobbyMessageOff, 2000
}

KnobbyDefaultDisplayMessage(u)
{
	SoundGet, master_volume
	t := Chr(128251)
	m := Chr(128364)
	if (u == 1)
		m := Chr(127911)
	SplashTextOn, 60, 50, %t%, %m%
	WinMove, %t%, , 0, 0
	SetTimer, KnobbyMessageOff, 2000
}
