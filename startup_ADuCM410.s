;/*
;THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES INC. ``AS IS'' AND ANY EXPRESS OR
;IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
;MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT, ARE
;DISCLAIMED. IN NO EVENT SHALL ANALOG DEVICES INC. BE LIABLE FOR ANY DIRECT,
;INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
;ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;POSSIBILITY OF SUCH DAMAGE.
;
;YOU ASSUME ANY AND ALL RISK FROM THE USE OF THIS CODE OR SUPPORT FILE.
;
;IT IS THE RESPONSIBILITY OF THE PERSON INTEGRATING THIS CODE INTO AN APPLICATION
;TO ENSURE THAT THE RESULTING APPLICATION PERFORMS AS REQUIRED AND IS SAFE.
;
;    Module       : startup_ADuCM320.s
;    Description  : Cortex-M3 startup file - ADuCM320 - RealView Version
;    Date         : Thursday May 30 2013 11:58
;    Version      : v0.2
;*/

; Amount of memory (in bytes) allocated for Stack
; Tailor this value to your application needs
; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000200

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit

                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size
                   

__Vectors       DCD     __initial_sp                       ; Top of Stack
				DCD     Reset_Handler               ; Reset Handler
				DCD     NMI_Handler                       ; The NMI handler
				DCD     HardFault_Handler                  ; The hard fault handler
				DCD     MemManage_Handler                 ; The MPU fault handler
				DCD     BusFault_Handler                  ; The bus fault handler
				DCD     UsageFault_Handler                ; The usage fault handler
				DCD     0                                 ; Reserved
				DCD     0                                 ; Reserved
				DCD     0                                 ; Reserved
				DCD     0                                 ; Reserved
				DCD     SVC_Handler                       ; SVCall handler
				DCD     DebugMon_Handler                  ; Debug monitor handler
				DCD     0                                 ; Reserved
				DCD     PendSV_Handler                    ; The PendSV handler
				DCD     SysTick_Handler                   ; The SysTick handler
		
				; External Interrupts
				DCD     WakeUp_Int_Handler        ; Wakeup Timer Interrupt        [ 0]
				DCD     Ext_Int0_Handler          ; External Interrupt 0          [ 1]
				DCD     Ext_Int1_Handler          ; External Interrupt 1          [ 2]
				DCD     Ext_Int2_Handler          ; External Interrupt 2          [ 3]
				DCD     Ext_Int3_Handler          ; External Interrupt 3          [ 4]
				DCD     Ext_Int4_Handler          ; External Interrupt 4          [ 5]
				DCD     Ext_Int5_Handler          ; External Interrupt 5          [ 6]
				DCD     Ext_Int6_Handler          ; External Interrupt 6          [ 7]
				DCD     Ext_Int7_Handler          ; External Interrupt 7          [ 8]
				DCD     Ext_Int8_Handler          ; External Interrupt 8          [ 9]
				DCD     Ext_Int9_Handler          ; External Interrupt 8          [10]
				DCD     WDog_Tmr_Int_Handler      ; Watchdog Timer Interrupt      [11]
				DCD     GP_Tmr0_Int_Handler       ; Timer0 Interrupt              [12]
				DCD     GP_Tmr1_Int_Handler       ; Timer1 Interrupt              [13]
				DCD     GP_Tmr2_Int_Handler       ; Timer2 Interrupt              [14]
				DCD     GP_Tmr3_Int_Handler       ; Timer3 Interrupt              [15]
				DCD     GP_Tmr4_Int_Handler       ; Timer4 Interrupt              [16]
				DCD     MDIO_Int_Handler          ; MDIO Interrupt                [17]
				DCD     Flsh_Int_Handler          ; Flash Memory Interrupt        [18]
				DCD     UART0_Int_Handler         ; UART0 Interrupt               [19]
				DCD     UART1_Int_Handler         ; UART1 Interrupt               [20]
				DCD     SPI0_Int_Handler          ; SPI0 Interrupt                [21]
				DCD     SPI1_Int_Handler          ; SPI1 Interrupt                [22]
				DCD     SPI2_Int_Handler          ; SPI2 Interrupt                [23]
				DCD     I2C0_Slave_Int_Handler    ; I2C0 Slave Interrupt          [24]
				DCD     I2C0_Master_Int_Handler   ; I2C0 Master Interrupt         [25]
				DCD     I2C1_Slave_Int_Handler    ; I2C1 Slave Interrupt          [26]
				DCD     I2C1_Master_Int_Handler   ; I2C1 Master Interrupt         [27]
				DCD     I2C2_Slave_Int_Handler    ; I2C2 Slave Interrupt          [28]
				DCD     I2C2_Master_Int_Handler   ; I2C2 Master Interrupt         [29]
				DCD     PLA0_Int_Handler          ; PLA0 Interrupt                [30]
				DCD     PLA1_Int_Handler          ; PLA1 Interrupt                [31]
				DCD     PLA2_Int_Handler          ; PLA2 Interrupt                [32]
				DCD     PLA3_Int_Handler          ; PLA3 Interrupt                [33]
				DCD     PWMTrip_Int_Handler       ; PWM TRIP Interrupt            [34]
				DCD     PWM0_Int_Handler          ; PWM Channel Pair 0 interrupt  [35]
				DCD     PWM1_Int_Handler          ; PWM Channel Pair 1 interrupt  [36]
				DCD     PWM2_Int_Handler          ; PWM Channel Pair 2 interrupt  [37]
				DCD     PWM3_Int_Handler          ; PWM Channel Pair 3 interrupt  [38]
				DCD     SRAM_Err_Int_Handler      ; SRAM interrupt                [39]
				DCD     DMA_Err_Int_Handler       ; DMA Error Interrupt           [40]
				DCD     DMA_SPI0_TX_Int_Handler   ; DMA SPI0 TX Interrupt         [41]
				DCD     DMA_SPI0_RX_Int_Handler   ; DMA SPI0 RX Interrupt         [42]
				DCD     DMA_SPI1_TX_Int_Handler   ; DMA SPI1 TX Interrupt         [43]
				DCD     DMA_SPI1_RX_Int_Handler   ; DMA SPI1 RX Interrupt         [44]
				DCD     DMA_SPI2_TX_Int_Handler   ; DMA SPI2 TX Interrupt         [45]
				DCD     DMA_SPI2_RX_Int_Handler   ; DMA SPI2 RX Interrupt         [46]
				DCD     DMA_UART0_TX_Int_Handler  ; DMA UART0 TX Interrupt        [47]
				DCD     DMA_UART0_RX_Int_Handler  ; DMA UART0 RX Interrupt        [48]
				DCD     DMA_UART1_TX_Int_Handler  ; DMA UART1 TX Interrupt        [49]
				DCD     DMA_UART1_RX_Int_Handler  ; DMA UART1 RX Interrupt        [50]
				DCD     DMA_I2C0_STX_Int_Handler  ; DMA I2C0 Slave TX Interrupt   [51]
				DCD     DMA_I2C0_SRX_Int_Handler  ; DMA I2C0 Slave RX Interrupt   [52]
				DCD     DMA_I2C0_MTX_Int_Handler  ; DMA I2C0 Master Interrupt     [53]
				DCD     DMA_I2C1_STX_Int_Handler  ; DMA I2C1 Slave TX Interrupt   [54]
				DCD     DMA_I2C1_SRX_Int_Handler  ; DMA I2C1 Slave RX Interrupt   [55]
				DCD     DMA_I2C1_MTX_Int_Handler  ; DMA I2C1 Master Interrupt     [56]
				DCD     DMA_I2C2_STX_Int_Handler  ; DMA I2C2 Slave TX Interrupt   [57]
				DCD     DMA_I2C2_SRX_Int_Handler  ; DMA I2C2 Slave RX Interrupt   [58]
				DCD     DMA_I2C2_MTX_Int_Handler  ; DMA I2C2 Master Interrupt     [59]
				DCD     DMA_MDIO_TX_Int_Handler   ; DMA MDIO Tx Interrupt         [60]
				DCD     DMA_MDIO_RX_Int_Handler   ; DMA MDIO Rx Interrupt         [61]
				DCD     DMA_Flsh_Int_Handler      ; DMA Flash Interrupt           [62]
				DCD     DMA_ADC_Int_Handler       ; DMA ADC Interrupt             [63]
				DCD     PLL_Int_Handler           ; TBD                           [64]
				DCD     HFOSC_Int_Handler         ; TBD                           [65]
				DCD     ADC_Int_Handler           ; TBD                           [66]
				DCD     SEQ_Int_Handler           ; TBD                           [67]
				DCD     COMP0_Int_Handler         ; TBD                           [68]
				DCD     COMP1_Int_Handler         ; TBD                           [69]
				DCD     COMP2_Int_Handler         ; TBD                           [70]
				DCD     COMP3_Int_Handler         ; TBD                           [71]
				DCD     VDAC_Int_Handler          ; TBD                           [72]
				DCD     LVDIE_Int_Handler         ; TBD                           [73]
				DCD     HVDIE_Int_Handler         ; TBD                           [74]
				DCD     SPI_LVD2D_Int_Handler     ; TBD                           [75]
				DCD     SPI_HVD2D_Int_Handler     ; TBD                           [76]
				DCD     SPI_LV_TX_Int_Handler     ; TBD                           [77]
				DCD     SPI_LV_RX_Int_Handler     ; TBD                           [78]
				DCD     SPI_HV_TX_Int_Handler     ; TBD                           [79]
				DCD     SPI_HV_RX_Int_Handler     ; TBD                           [80]
				DCD     DMA_TRIG0_Int_Handler     ; TBD                           [81]
            DCD     DMA_TRIG1_Int_Handler     ; TBD                           [82]
            DCD     DMA_SW0_Int_Handler       ; TBD                           [83]
            DCD     DMA_SW1_Int_Handler       ; TBD                           [84]
            DCD     DMA_CACHE_Int_Handler     ; TBD                           [85]
            DCD     DMA_DIGCOMP_Int_Handler   ; TBD                           [86]
            DCD     GPIO_INTA_Int_Handler     ; TBD                           [87]
            DCD     GPIO_INTB_Int_Handler     ; TBD                           [88]
            DCD     UnUsed_Handler            ; TBD                           [89]
__Vectors_End

__Vectors_Size  EQU  __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY
                THUMB

SRAMCON_ADDR          EQU      0x40065000
USERKEY_ADDR          EQU      0x40002134
USERKEY               EQU      0x8D5F9FEC
CACHESETUP_ADDR       EQU      0x40044004
CACHE_KEY             EQU      0xF123F456
CACHE_KEY_ADDR        EQU      0x40044008
CACHE_STATUS_ADDR     EQU      0x40044000
SetupSram       PROC
                EXPORT  SetupSram                [WEAK]	
				LDR     R4, =USERKEY_ADDR
				LDR     R5, =USERKEY
				STR     R5, [R4]        ;write user key
				LDR     R6, =SRAMCON_ADDR
				MOV     R9, LR			;save previous lr
				BL      Enable_Cache
				STR     R5, [R4]     ;write user key
				MOV     R2, #0       ;ISRAM and cache enable
				STR     R2, [R6]
				BX      R9								
                ENDP

; Reset handler
Reset_Handler    PROC
                 EXPORT  Reset_Handler             [WEAK]
        IMPORT  SystemInit
        IMPORT  __main
			     LDR     R0, =SetupSram
				 BLX	 R0
		  	     LDR     R0, =__Vectors
			     LDR     R0, [R0, #0]
			     MSR     MSP, R0
			     LDR     R0, =__main
                 BX      R0
                 ENDP

Disable_Cache
        LDR   R0, =CACHESETUP_ADDR
        LDR   R1, [R0]
        UBFX  R2, R1, #0, #1 ;get current bit0 value
        CMP   R2, #0
        BEQ   CacheWapDone   ; cache already disabled.
        BFC   R1, #0, #1  ;clear bit0
        LDR   R7, = CACHE_KEY_ADDR
        LDR   R8, = CACHE_KEY
        STR   R8, [R7]     ;write cache key
        STR   R1, [R0]
        LDR   R7, = CACHE_STATUS_ADDR
CacheWip
        LDR   R8, [R7]	;read cache status
        UBFX  R0, R8, #3, #1	;BIT3 of cache status register ind
        CMP   R0, #1
        BNE   CacheWip  	; Cache is wapping
CacheWapDone
        LDR   R8, [R7]	;read cache status
        UBFX  R0, R8, #3, #1	;BIT3 of cache status register ind
        CMP   R0, #0
        BNE   CacheWapDone  	; Cache wapping done		
        MOV   R7, #0
        MOV   R8, #0
        BX    LR
      
Enable_Cache
        LDR   R0, =CACHESETUP_ADDR
        LDR   R1, [R0]
        MOV   R7, #1
        BFI   R1, R7, #0, #1  ;SET bit0
        LDR   R7, = CACHE_KEY_ADDR
        LDR   R8, = CACHE_KEY
        STR   R8, [R7]     ;write cache key
        STR   R1, [R0]
        MOV   R7, #0
        MOV   R8, #0
        BX    LR
		
		ALIGN

; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler                [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler          [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler          [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler           [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler         [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler                [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler           [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler             [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler            [WEAK]
                B       .
                ENDP

Default_Handler PROC
		EXPORT WakeUp_Int_Handler          [WEAK]
		EXPORT Ext_Int0_Handler            [WEAK]
		EXPORT Ext_Int1_Handler            [WEAK]
		EXPORT Ext_Int2_Handler            [WEAK]
		EXPORT Ext_Int3_Handler            [WEAK]
		EXPORT Ext_Int4_Handler            [WEAK]
		EXPORT Ext_Int5_Handler            [WEAK]
		EXPORT Ext_Int6_Handler            [WEAK]
		EXPORT Ext_Int7_Handler            [WEAK]
		EXPORT Ext_Int8_Handler            [WEAK]
		EXPORT Ext_Int9_Handler            [WEAK]
		EXPORT WDog_Tmr_Int_Handler        [WEAK]
		EXPORT GP_Tmr0_Int_Handler         [WEAK]
		EXPORT GP_Tmr1_Int_Handler         [WEAK]
		EXPORT GP_Tmr2_Int_Handler         [WEAK]
		EXPORT GP_Tmr3_Int_Handler         [WEAK]
		EXPORT GP_Tmr4_Int_Handler         [WEAK]
		EXPORT MDIO_Int_Handler            [WEAK]
		EXPORT Flsh_Int_Handler            [WEAK]
		EXPORT UART0_Int_Handler           [WEAK]
		EXPORT UART1_Int_Handler           [WEAK]
		EXPORT SPI0_Int_Handler            [WEAK]
		EXPORT SPI1_Int_Handler            [WEAK]
		EXPORT SPI2_Int_Handler            [WEAK]
		EXPORT I2C0_Slave_Int_Handler      [WEAK]
		EXPORT I2C0_Master_Int_Handler     [WEAK]
		EXPORT I2C1_Slave_Int_Handler      [WEAK]
		EXPORT I2C1_Master_Int_Handler     [WEAK]
		EXPORT I2C2_Slave_Int_Handler      [WEAK]
		EXPORT I2C2_Master_Int_Handler     [WEAK]
		EXPORT PLA0_Int_Handler            [WEAK]
		EXPORT PLA1_Int_Handler            [WEAK]
		EXPORT PLA2_Int_Handler            [WEAK]
		EXPORT PLA3_Int_Handler            [WEAK]
		EXPORT PWMTrip_Int_Handler         [WEAK]
		EXPORT PWM0_Int_Handler            [WEAK]
		EXPORT PWM1_Int_Handler            [WEAK]
		EXPORT PWM2_Int_Handler            [WEAK]
		EXPORT PWM3_Int_Handler            [WEAK]
		EXPORT SRAM_Err_Int_Handler        [WEAK]
		EXPORT DMA_Err_Int_Handler         [WEAK]
		EXPORT DMA_SPI0_TX_Int_Handler     [WEAK]
		EXPORT DMA_SPI0_RX_Int_Handler     [WEAK]
		EXPORT DMA_SPI1_TX_Int_Handler     [WEAK]
		EXPORT DMA_SPI1_RX_Int_Handler     [WEAK]
		EXPORT DMA_SPI2_TX_Int_Handler     [WEAK]
		EXPORT DMA_SPI2_RX_Int_Handler     [WEAK]
		EXPORT DMA_UART0_TX_Int_Handler    [WEAK]
		EXPORT DMA_UART0_RX_Int_Handler    [WEAK]
        EXPORT DMA_UART1_TX_Int_Handler    [WEAK] 
        EXPORT DMA_UART1_RX_Int_Handler    [WEAK]
        EXPORT DMA_I2C0_STX_Int_Handler    [WEAK]
        EXPORT DMA_I2C0_SRX_Int_Handler    [WEAK]
        EXPORT DMA_I2C0_MTX_Int_Handler    [WEAK]
        EXPORT DMA_I2C1_STX_Int_Handler    [WEAK]
        EXPORT DMA_I2C1_SRX_Int_Handler    [WEAK]
        EXPORT DMA_I2C1_MTX_Int_Handler    [WEAK]
        EXPORT DMA_I2C2_STX_Int_Handler    [WEAK]
        EXPORT DMA_I2C2_SRX_Int_Handler    [WEAK]
        EXPORT DMA_I2C2_MTX_Int_Handler    [WEAK]
        EXPORT DMA_MDIO_TX_Int_Handler     [WEAK]
        EXPORT DMA_MDIO_RX_Int_Handler     [WEAK]
        EXPORT DMA_Flsh_Int_Handler        [WEAK]
        EXPORT DMA_ADC_Int_Handler         [WEAK]
        EXPORT PLL_Int_Handler             [WEAK]
        EXPORT HFOSC_Int_Handler           [WEAK]
        EXPORT ADC_Int_Handler             [WEAK]
        EXPORT SEQ_Int_Handler             [WEAK]
        EXPORT COMP0_Int_Handler           [WEAK]
        EXPORT COMP1_Int_Handler           [WEAK]
        EXPORT COMP2_Int_Handler           [WEAK]
        EXPORT COMP3_Int_Handler           [WEAK]
        EXPORT VDAC_Int_Handler            [WEAK]
        EXPORT LVDIE_Int_Handler           [WEAK]
        EXPORT HVDIE_Int_Handler           [WEAK]
        EXPORT SPI_LVD2D_Int_Handler       [WEAK]
        EXPORT SPI_HVD2D_Int_Handler       [WEAK]
        EXPORT SPI_LV_TX_Int_Handler       [WEAK]
        EXPORT SPI_LV_RX_Int_Handler       [WEAK]
        EXPORT SPI_HV_TX_Int_Handler       [WEAK]
        EXPORT SPI_HV_RX_Int_Handler       [WEAK]
		  EXPORT DMA_TRIG0_Int_Handler       [WEAK]
        EXPORT DMA_TRIG1_Int_Handler       [WEAK]
        EXPORT DMA_SW0_Int_Handler         [WEAK]
        EXPORT DMA_SW1_Int_Handler         [WEAK]
        EXPORT DMA_CACHE_Int_Handler       [WEAK]
        EXPORT DMA_DIGCOMP_Int_Handler     [WEAK] 
        EXPORT GPIO_INTA_Int_Handler       [WEAK] 
        EXPORT GPIO_INTB_Int_Handler       [WEAK] 
        EXPORT UnUsed_Handler              [WEAK]    
      

WakeUp_Int_Handler         
Ext_Int0_Handler           
Ext_Int1_Handler           
Ext_Int2_Handler           
Ext_Int3_Handler           
Ext_Int4_Handler           
Ext_Int5_Handler           
Ext_Int6_Handler           
Ext_Int7_Handler           
Ext_Int8_Handler           
Ext_Int9_Handler           
WDog_Tmr_Int_Handler       
GP_Tmr0_Int_Handler        
GP_Tmr1_Int_Handler        
GP_Tmr2_Int_Handler        
GP_Tmr3_Int_Handler        
GP_Tmr4_Int_Handler        
MDIO_Int_Handler           
Flsh_Int_Handler           
UART0_Int_Handler          
UART1_Int_Handler          
SPI0_Int_Handler           
SPI1_Int_Handler           
SPI2_Int_Handler           
I2C0_Slave_Int_Handler     
I2C0_Master_Int_Handler    
I2C1_Slave_Int_Handler     
I2C1_Master_Int_Handler    
I2C2_Slave_Int_Handler     
I2C2_Master_Int_Handler    
PLA0_Int_Handler           
PLA1_Int_Handler           
PLA2_Int_Handler           
PLA3_Int_Handler           
PWMTrip_Int_Handler        
PWM0_Int_Handler           
PWM1_Int_Handler           
PWM2_Int_Handler           
PWM3_Int_Handler           
SRAM_Err_Int_Handler       
DMA_Err_Int_Handler        
DMA_SPI0_TX_Int_Handler    
DMA_SPI0_RX_Int_Handler    
DMA_SPI1_TX_Int_Handler    
DMA_SPI1_RX_Int_Handler    
DMA_SPI2_TX_Int_Handler    
DMA_SPI2_RX_Int_Handler    
DMA_UART0_TX_Int_Handler   
DMA_UART0_RX_Int_Handler   
DMA_UART1_TX_Int_Handler   
DMA_UART1_RX_Int_Handler   
DMA_I2C0_STX_Int_Handler   
DMA_I2C0_SRX_Int_Handler   
DMA_I2C0_MTX_Int_Handler   
DMA_I2C1_STX_Int_Handler   
DMA_I2C1_SRX_Int_Handler   
DMA_I2C1_MTX_Int_Handler   
DMA_I2C2_STX_Int_Handler   
DMA_I2C2_SRX_Int_Handler   
DMA_I2C2_MTX_Int_Handler   
DMA_MDIO_TX_Int_Handler    
DMA_MDIO_RX_Int_Handler    
DMA_Flsh_Int_Handler       
DMA_ADC_Int_Handler        
PLL_Int_Handler            
HFOSC_Int_Handler          
ADC_Int_Handler            
SEQ_Int_Handler            
COMP0_Int_Handler          
COMP1_Int_Handler          
COMP2_Int_Handler          
COMP3_Int_Handler          
VDAC_Int_Handler           
LVDIE_Int_Handler          
HVDIE_Int_Handler          
SPI_LVD2D_Int_Handler      
SPI_HVD2D_Int_Handler      
SPI_LV_TX_Int_Handler      
SPI_LV_RX_Int_Handler      
SPI_HV_TX_Int_Handler      
SPI_HV_RX_Int_Handler      
DMA_TRIG0_Int_Handler  
DMA_TRIG1_Int_Handler  
DMA_SW0_Int_Handler    
DMA_SW1_Int_Handler    
DMA_CACHE_Int_Handler  
DMA_DIGCOMP_Int_Handler
GPIO_INTA_Int_Handler
GPIO_INTB_Int_Handler
UnUsed_Handler                     
                B       .

                ENDP

                ALIGN

;*******************************************************************************
; User Stack and Heap initialization
;*******************************************************************************
                 IF      :DEF:__MICROLIB

                 EXPORT  __initial_sp
                 EXPORT  __heap_base
                 EXPORT  __heap_limit

                 ELSE

                 IMPORT  __use_two_region_memory
                 EXPORT  __user_initial_stackheap

__user_initial_stackheap

                 LDR     R0, =  Heap_Mem
                 LDR     R1, =(Stack_Mem + Stack_Size)
                 LDR     R2, = (Heap_Mem +  Heap_Size)
                 LDR     R3, = Stack_Mem
                 BX      LR

                 ALIGN

                 ENDIF

                 END
