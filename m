From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [GIT PULL v2] LM3532 backlight support improvements and
 relocation
Date: Mon, 8 Apr 2019 10:53:59 -0500
Message-ID: <f96d09dc-3ddc-4ac7-3668-508df430f686@ti.com>
References: <20190407190951.27288-1-jacek.anaszewski@gmail.com>
 <20190407221740.GA6327@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190407221740.GA6327@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh@kernel.org
Cc: lee.jones@linaro.org, tony@atomide.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

Thanks for the review

On 4/7/19 5:17 PM, Pavel Machek wrote:
> Hi!
> 
>> Changes since v1:
>>
>> - synchronized DT label properties in DT bindings with what has been agreed
>>   for the patch "ARM: dts: omap4-droid4: Update backlight dt properties"
>>
>> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
>>
>>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/lm3532-driver-improvements
>>
>> for you to fetch changes up to bc1b8492c764fea940fc66206047e37a7f8d77e1:
>>
>>   leds: lm3532: Introduce the lm3532 LED driver (2019-04-07 20:45:49 +0200)
>>
>> Thanks,
>> Jacek Anaszewski
>>
>> ----------------------------------------------------------------
>> LM3532 backlight driver improvements and relocation
>> ----------------------------------------------------------------
>> Dan Murphy (4):
>>       dt: lm3532: Add lm3532 dt doc and update ti_lmu doc
> 
> Sorry, this one will need more work.
> 
> When did Rob acknowledge this? I do not remember that mail & quick
> google does not find it.
> 
> I still don't like the fact that it is using different binding from
> other similar chips. It for example replaces "ramp-up-msec" with
> "ramp-up-us".
> 

It does not replace anything.  The LM3532 has a completely different ramping table then
the other LMU devices.  The ramp times for this part is in uS not mS and there is no alignment on
common values or deltas.

> This is certainly wrong:
> 
> +Optional properties if ALS mode is used:
> +	  - ti,als-vmin - Minimum ALS voltage defined in Volts
> +	  - ti,als-vmax - Maximum ALS voltage defined in Volts
> +	  Per the data sheet the max ALS voltage is 2V and the min is
> 0V
> 
> ...but milivolts (or microvolts?) make sense there, and clearly
> milivolts are used because 2000V is way out of range.:
> 

I will send a patch that changes "Volts" to "millivolts" in the description.

> +	  ti,als-vmin = <0>;
> +	  ti,als-vmax = <2000>;
> 
> Plus:
> 
> +Required child properties:
> ...
> +	- ti,led-mode : Defines if the LED strings are manually controlled or
> +			if the LED strings are controlled by the ALS.
> +			       0x00 - LED strings are I2C controlled via full scale brightness control register
> +        		  	  0x01 - LED strings are ALS controlled
> 
> Dunno. Normally we'd have "ti,automatic-led-mode", and if it was not
> present, we'd default to manual, no? (Also "led-mode" is a bit too
> generic. ti,als-enabled would be better description).
> 
> Plus, I'd kind of expect ALS enabled/disabled to be runtime controled,
> not from the device tree.

We can always add runtime override control to the driver.

Just need to see if there is a common interface from input or IIO we can adopt.

Dan


> 
> Best regards,
> 									Pavel
> 


-- 
------------------
Dan Murphy
