#SingleInstance force
#Persistent 
SetBatchLines, -1

;<--Adjusting Variables-->

a := 4.52296
b := 1.00596
warpadjust := 6
centerY := 578
lineWidth := 2
lineHeight := 20
activatex := 921
activatey := 616


;<--Adjusting Variables-->


^!r::
    Reload
return




NumpadAdd::
F10::
    ; Main section
    WinActivate, Roblox
    InputBox, Distance, Enter distance,, 0, 0, , , 30, 150
    if (Distance > 0)  ; if the input is valid, continue with the rest of the script
    {
        PrePixelXTarget := Round(Log(Distance / a) / Log(b))
        PixelXTarget := PrePixelXTarget -= warpadjust 
	
    	

        CoordMode, Pixel, Screen ; set pixel coordinate mode to screen
        Send, v ; push "v" key
        Loop ; start an infinite loop
        {
            PixelGetColor, color1, %activatex%, %activatey% 
            PixelGetColor, color2, %activatex%, %activatey%


            if (color1 = 0x00AA00 and color2 = 0x00AA00)
            {
		loop{

        	PixelGetColor, warp, %PixelXTarget%, %centerY%

        	if (warp = 0xFFFFFF || warp = 0x2B2B2B)
        	{
        	PixelXTarget -= 1 
        	}
        
        	else 
       		{
        	break
        	}
        
        	}

		Loop
		{
		PixelGetColor, check, %PixelXTarget%, %centerY%
		if (check = 0xFFFFFF || check = 0x0065CB || check = 0x97ABC0 || check = 0x1C76D1 || check = 0x4890DA || check = 0x106DCA)
			{
			break
			}
		else
			{
			PixelGetColor, check, %PixelXTarget%, %centerY%
			
			}

		}

                SendInput, v
		Sleep, 5000
                If (state := 1)
                {
                    ; addons   
		    return

                }
                else
                {
                    ; addons
                    return
                }
            }
            Sleep, 5
        }
    }
return
