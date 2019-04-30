/******************************************************************************
statemachine.c
CSE/EE 5385/7385 Microprocessor Architecture and Interfacing
ARM MCBSTM32C Final Project
******************************************************************************/

#include "stdio.h"
#include <stm32f10x_cl.h>
#include "GLCD.h"
#include <math.h>
#include <stdlib.h>

	int state = 0;
	int num = 0;
	int led_mask[] = { 1<<15, 1<<14, 1<<13, 1<<12, 1<<11, 1<<10, 1<<9, 1<<8 };
	int i = 0;
	

	
	
int main (void) {
  SystemInit();

  /* Configure the GPIO for Push Buttons                                      */
  RCC->APB2ENR |=  1 <<  2;             /* Enable GPIOA clock                 */
  RCC->APB2ENR |=  1 <<  3;             /* Enable GPIOB clock                 */
  RCC->APB2ENR |=  1 <<  4;             /* Enable GPIOC clock                 */
  GPIOA->CRL   &= 0xFFFFFFF0;
  GPIOA->CRL   |= 0x00000004;
  GPIOB->CRL   &= 0x0FFFFFFF;
  GPIOB->CRL   |= 0x40000000;
  GPIOC->CRH   &= 0xFF0FFFFF;
  GPIOC->CRH   |= 0x00400000;
  
  /* Setup GPIO for LEDs*/
  RCC->APB2ENR |=  1 <<  6;             /* Enable GPIOE clock 			*/
  GPIOE->CRH    = 0x33333333;           /* Configure the GPIO for LEDs 	*/
	
	
	
	RCC->APB1ENR	|=	(1<<2);
	RCC->APB2ENR	|=	(1)|(1<<3);	
	RCC-> CFGR		&=	0000;
	RCC->CR				|= 	1<<0;
	TIM4->PSC &= 0x0000; // 10e4 s   7199
	TIM4->PSC |=0x1F3F << 0; //7999
	TIM4->SMCR &=(000 << 0);
	//TIM4->CR1 	|= 1 << 0;
	//TIM4->CR1		|= 1 << 4;
	//TIM4->ARR   &= 0x0000; 
	//TIM4->CNT   |= 
  GLCD_Init();                          /* Initialize graphical LCD display   */
  GLCD_Clear(White);                    /* Clear graphical LCD display        */
	TIM4->CR1 	|= 0 << 0;
	TIM4->CNT   &=0x0000;
  for (;;) {   
		
		switch(state)
		{
			case 0: 
				GLCD_SetTextColor(White);
				GLCD_SetBackColor(Black);
				GLCD_DisplayString(5,1,1,"   Neutral State   "  ); 
				if (GPIOA->IDR & (1 << 0))
			{
				state = 1;
				
				
			}
				
			break;
			case 1: 
				
				GLCD_SetTextColor(White);
				GLCD_SetBackColor(Black);
				//GLCD_ClearLn(5, 1);
			//GLCD_DisplayString(5,1,1,"                 "   ); 
				GLCD_DisplayString(5,1,1,"             Gear 1   "   ); 
				//time_fct(30000);
				
				
				//TIM4->ARR		|= 0x7530;
				
			
			TIM4->CR1 	|= 	1 << 0;
			if(TIM4->CNT>=3000)
			{
				state = 2;
				TIM4->CNT   &=0x0000;
				TIM4->CR1 	&= 0 << 0;
				
			}
			break;
			case 2: 
				GLCD_SetTextColor(White);
				GLCD_SetBackColor(Black);
				GLCD_DisplayString(5,1,1,"          Gear 2   "   ); 
				//time_fct(50000);
			TIM4->CR1 	|= 1 << 0;
			if(TIM4->CNT>=5000)
			{
				state = 3; 
				TIM4->CNT   &=0x0000;
				TIM4->CR1 	&= 0 << 0;
				
			}
			break;
			case 3:
		
				GLCD_SetTextColor(Black);
				GLCD_SetBackColor(White);
				GLCD_DisplayString(5,1,1,"          Gear 3   "   ); 
				if((!(GPIOC->IDR & (1 << 13))))
				{
					state = 2;
				}
				 if(!(GPIOB->IDR & (1 << 7)))
				{
					state = 4;
					for(num=0; num<8; num++)
					{
							GPIOE->BSRR = led_mask[num];        /* Turn LED on                        */
							for (i = 0; i < 20000; i++);
							GPIOE->BSRR = led_mask[num] << 16;  /* Turn LED off                       */
							for (i = 0; i < 20000; i++);
					}
				}
			TIM4->CR1 	&= 0 << 0;
			TIM4->CNT   &=0x0000;
			break;
			case 4: 
				
			GLCD_SetTextColor(Black);
			GLCD_SetBackColor(White);
			GLCD_DisplayString(5,1,1,"          Gear 4"); 
			//time_fct(60000);
						TIM4->CR1 	|= 1 << 0;
			if(TIM4->CNT>=6000)
			{
				state = 0; 
				TIM4->CNT   &=0x0000;
				TIM4->CR1 	&= 0 << 0;
				
			}
			
			
			break;
		}
		  
  }
}
