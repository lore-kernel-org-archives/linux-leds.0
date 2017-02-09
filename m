From: Felix Brack <fb@ltec.ch>
Subject: Re: [PATCH] leds: pca9532: Extend pca9532 device tree support
Date: Thu, 9 Feb 2017 09:41:19 +0100
Message-ID: <3bfc9206-18c7-470b-ca53-d7bdb9a34f0a@ltec.ch>
References: <aed3d861-eb7d-7bad-1fe2-73b5b3299a0c@ltec.ch>
 <f1649865-87cd-eb1c-68de-184990f64661@gmail.com>
 <c23bd1c9-934b-c1c6-e9ff-8d2041c52d09@ltec.ch>
 <725c338e-af4c-1332-6c27-462c2dc1b97f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <725c338e-af4c-1332-6c27-462c2dc1b97f@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, riku.voipio@iki.fi, rpurdie@rpsys.net, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: f.brack@eets.ch
List-Id: linux-leds@vger.kernel.org

Hello Jacek,

On 08.02.2017 20:42, Jacek Anaszewski wrote:
> Hi Felix,
> 
> On 02/08/2017 05:12 PM, Felix Brack wrote:
>> Hello Jacek,
>>
>> On 07.02.2017 21:45, Jacek Anaszewski wrote:
>>> Hi Felix,
>>>
>>> Thanks for the patch.
>>>
>>> On 02/07/2017 07:11 PM, Felix Brack wrote:
>>>> This patch extends the device tree support for the pca9532 allowing LEDs to blink, dim or even being unchanged, i.e. not being turned off during driver initialization.
>>>
>>> Isn't it possible to apply desired settings with existing LED subsystem
>>> brightness file, and delay_on/off files exposed by timer trigger?
>>>
>>> Best regards,
>>> Jacek Anaszewski
>>>
>>
>> This might be a misunderstanding. My patch is not meant to replace
>> anything for driving the LEDs once the kernel is fully loaded. The LED
>> subsystem offers quite a lot of possibilities to do this.
>>
>> My patch mainly deals with the 'default' state of the LEDs immediately
>> when the driver gets loaded.
>> Here is an example: I have a system with a LED named 'RUN' which is
>> turned on steady by U-Boot (indicating "system booting"). When the
>> PCA9532 driver loads this LED gets turned off due to initialization.
>> However I would like it remain lit until later a script will make that
>> 'RUN' LED blink (indicating "system running"). This script will of
>> course use the existing LED subsystem to do so. To keep the 'RUN' LED
>> lit I need the DT property 'default-state' being set to 'PCA9532_KEEP'.
> 
> It looks like all you need is default-state property.

For the example with keeping the 'RUN' led turned on, yes. However I
would have to configure PSC and PWM registers to make the 'RUN' LED
blink, for example.

> I'd rather avoid exposing prescaler and pwm registers in DT.

I don't see that exposing PSC and PWM registers to the DT would do any
harm. Is there something I'm missing here?

> 

One could pass parameters to the driver but I think that is worse, as
nowadays we have DT.

regards Felix
