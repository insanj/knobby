#SingleInstance, force
NumpadSub::
    SoundSet -10
    KnobbyMessage(0)
return

NumpadAdd::
    SoundSet +10
    KnobbyMessage(1)
return

KnobbyMessage(u)
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
	Sleep, 1000
	SplashTextOff
}