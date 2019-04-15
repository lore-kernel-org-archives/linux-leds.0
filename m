From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 5/5] leds: lm3697: Introduce the lm3697 driver
Date: Mon, 15 Apr 2019 14:53:35 -0500
Message-ID: <ea9ac786-7303-5de3-9686-55589eed35ec@ti.com>
References: <20190325142403.30447-1-dmurphy@ti.com>
 <20190325142403.30447-6-dmurphy@ti.com> <20190413200605.GA3013@amd>
 <f47fff9b-bca1-6412-c423-acf01baabc9f@ti.com> <20190415140306.GA13084@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415140306.GA13084@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org



On 4/15/19 9:03 AM, Pavel Machek wrote:
> 
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index 735009e73414..688bb9a6f275 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -776,9 +776,15 @@ config LEDS_NIC78BX
>>>>  	  To compile this driver as a module, choose M here: the module
>>>>  	  will be called leds-nic78bx.
>>>>  
>>>> +config LEDS_LM3697
>>>> +	tristate "LED driver for LM3697"
>>>> +	depends on LEDS_TI_LMU_COMMON
>>>> +	help
>>>> +	  Say Y to enable the LM3697 LED driver for TI LMU devices.
>>>> +	  This supports the LED device LM3697.
>>>> +
>>>>  config LEDS_TI_LMU_COMMON
>>>>  	tristate "LED driver for TI LMU"
>>>> -	depends on REGMAP
>>>>  	help
>>>>            Say Y to enable the LED driver for TI LMU devices.
>>>>            This supports common features between the TI LM3532, LM3631, LM3632,
> ...
>>> Plus we'd normally expect "COMMON" first and then specific driver. Not
>>> sure if Kconfig can handle it out-of-order...
>>
>> OK.  Should I rename the ti_lmu file to leds-common-ti-lmu?
> 
> Oh, no, that is not what I meant.
> 
> You have
> 
> config B
>        depends on A
> 
> config A
> 
> above. We really want
> 
> config A
> 
> config B
>        depends on A
> 

Got it I will rearrange that in v2.

>> This keeps the naming convention the same in the leds directory as well.
>>
>> FYI I will not add your acked-by on the LMU patch that introduced the code unless you approve.
>> Since you found issues with the kconfig
> 
> I did not review it in great detail, so no acked-by's, yet :-).

Thanks
Dan

> 									Pavel
> 
