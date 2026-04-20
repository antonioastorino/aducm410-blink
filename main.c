#include "ADuCM410.h"
#include "DioLib.h"

static void busy_delay(volatile uint32_t count)
{
    while (count--);
}

int main(void)
{
    /* Configure P0_5 as GPIO (mode 0), output */
    DioCfgPin(pADI_GPIO0, PIN5, P0_5_GPIO);
    DioOenPin(pADI_GPIO0, PIN5, 1);

    while (1)
    {
        DioSetPin(pADI_GPIO0, PIN5);
        busy_delay(100000);
        DioClrPin(pADI_GPIO0, PIN5);
        busy_delay(100000);
    }
}
