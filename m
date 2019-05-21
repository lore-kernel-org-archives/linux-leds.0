From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED driver
Date: Tue, 21 May 2019 14:41:24 -0500
Message-ID: <65c656cd-1b16-0960-fbeb-8172087b88f2@ti.com>
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-7-dmurphy@ti.com>
 <77f1ed5b-bfd2-510c-edd5-1b702f2d1d45@gmail.com>
 <8d126925-9e71-dba4-eb88-50fd6e6c06d8@ti.com>
 <a7cb6628-e501-b580-f714-0e5de78ea39c@gmail.com>
 <d0c49197-984d-5cd8-032a-27d9c5ca6d29@ti.com>
 <97ff2f48-9ec0-06f1-b667-56fcdef8bf03@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <97ff2f48-9ec0-06f1-b667-56fcdef8bf03@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz
Cc: lee.jones@linaro.org, rdunlap@infradead.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 5/21/19 1:46 PM, Jacek Anaszewski wrote:
> Dan,
> 
> On 5/21/19 8:25 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 5/21/19 12:40 PM, Jacek Anaszewski wrote:
>>> On 5/20/19 11:19 PM, Dan Murphy wrote:
>>>> Jacek
>>>>
>>>> On 5/20/19 2:54 PM, Jacek Anaszewski wrote:
>>>>> Hi Dan,
>>>>>
>>>>> On 5/7/19 10:11 PM, Dan Murphy wrote:
>>>>>> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
>>>>>> MFD driver to probe this LED driver.  The driver configures only the
>>>>>> LED registers and enables the outputs according to the config file.
>>>>>>
>>>>>> The driver utilizes the TI LMU (Lighting Management Unit) LED common
>>>>>> framework to set the brightness bits.
>>>>>>
>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>> ---
>>>>>>     drivers/leds/Kconfig        |   7 ++
>>>>>>     drivers/leds/Makefile       |   1 +
>>>>>>     drivers/leds/leds-lm36274.c | 174 ++++++++++++++++++++++++++++++++++++
>>>>>>     3 files changed, 182 insertions(+)
>>>>>>     create mode 100644 drivers/leds/leds-lm36274.c
>>>>>>
>>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>>> index 255fdd5e8491..db83a3feca01 100644
>>>>>> --- a/drivers/leds/Kconfig
>>>>>> +++ b/drivers/leds/Kconfig
>>>>>> @@ -791,6 +791,13 @@ config LEDS_LM3697
>>>>>>           Say Y to enable the LM3697 LED driver for TI LMU devices.
>>>>>>           This supports the LED device LM3697.
>>>>>>     +config LEDS_LM36274
>>>>>> +    tristate "LED driver for LM36274"
>>>>>> +    depends on LEDS_TI_LMU_COMMON
>>>>>
>>>>> Shouldn't we have "depends on MFD_TI_LMU" as well here?
>>>>>
>>>>
>>>> Actually the LEDS_TI_LMU_COMMON flag should depend on MFD_TI_LMU.
>>>> Then it would inherit that dependency.
>>>
>>> LEDS_TI_LMU_COMMON does not seem too have any dependency on MFD_TI_LMU,
>>> and it would be incorrect to require enabling MFD_TI_LMU for all drivers
>>> depending on TI_LMU_COMMON, that can be probed on their own, like
>>> leds-lm3697.c .
>>>
>>
>> Correct.
>>
>> I can update the Kconfigs unless you want to ammend the commits.
> 
> I added "depends on MFD_TI_LMU" to "config LEDS_LM36274".
> Please verify your patch sets pushed to [0].
> 

Pulled
Built
tested
verified

Good to go

Dan

> [0] https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/log/?h=ib-leds-mfd-regulator
> 
