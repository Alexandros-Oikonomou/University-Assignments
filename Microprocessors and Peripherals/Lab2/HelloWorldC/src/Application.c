#include <Application.h>
#include <Platform.h>
#include <stdbool.h>

static unsigned char ledValue = false;
static unsigned char doBlink = true;

static void onPushButtonChangedCbk()
{
		if (doBlink){                    //    If Led is blinking
        doBlink = false;        //    Stop Blinking
        ledValue = true;        //    Open Led
        Platform_Led_setValue(ledValue);
    }
    else
        if (ledValue){                //    If led is open
            ledValue = false;    //     Close Led
            Platform_Led_setValue(ledValue);
        }
        else
            doBlink = true;        //    If Led is closed start blinking
}

static void onSystemTick()
{
 static unsigned int count = 0;
  if (doBlink){                                //    If Led is blinking
        count++;
        if (count > 500)                    //    On 500+ SystemTicks 
    {
      count = 0;                                                    //    Initialize counter
      ledValue = !ledValue;                                //    Change Led Value(If led was open, close it and vice versa)
      Platform_Led_setValue(ledValue);
    }
    }
  else                                                //    If Led is not blinking
        count = 0;                                //    Initialize counter
}

void Application_run()
{
  Platform_Led_setValue( ledValue );
  Platform_PushButton_setIsrCallback(onPushButtonChangedCbk);
  Platform_PushButton_enableInterrupt();
  Platform_registerSystickCallback(onSystemTick);
  while( 1 );
}
