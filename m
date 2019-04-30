From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 4/7] leds: TI LMU: Add common code for TI LMU devices
Date: Tue, 30 Apr 2019 21:32:11 +0200
Message-ID: <98b7f0fd-6f94-b8a1-a367-77d8cae2a97e@gmail.com>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-5-dmurphy@ti.com>
 <7d161cbc-d6bd-83aa-3790-6c45fdf9521f@infradead.org>
 <a953b7e9-ce80-641a-4d0e-f0b96828a732@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a953b7e9-ce80-641a-4d0e-f0b96828a732@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Randy Dunlap <rdunlap@infradead.org>, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 4/30/19 9:30 PM, Dan Murphy wrote:
> Randy
> 
> On 4/30/19 2:23 PM, Randy Dunlap wrote:
>> On 4/30/19 12:17 PM, Dan Murphy wrote:
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index da00b9ed5a5c..3ae24eaf4cde 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -776,6 +776,14 @@ config LEDS_NIC78BX
>>>   	  To compile this driver as a module, choose M here: the module
>>>   	  will be called leds-nic78bx.
>>>   
>>> +config LEDS_TI_LMU_COMMON
>>> +	tristate "LED driver for TI LMU"
>>
>> what does LMU mean?
> 
> Lighting management unit it is defined in the DT documentation
> 
>>
>>> +	depends on REGMAP
>>> +	help
>>> +          Say Y to enable the LED driver for TI LMU devices.
>>> +          This supports common features between the TI LM3532, LM3631, LM3632,
>>> +	  LM3633, LM3695 and LM3697.
>>
>> Fix help indentation above to use tab + 2 spaces consistently.
>>
> 
> UGH I wish I had this comment 2 weeks ago.
> But I can fix it

I will amend this while merging, no need to resend.

-- 
Best regards,
Jacek Anaszewski
