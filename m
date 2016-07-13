From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v3 1/2] drivers: led: is31fl319x: 1/3/6/9-channel light
 effect led driver
Date: Wed, 13 Jul 2016 09:45:01 +0200
Message-ID: <5785F17D.3010108@samsung.com>
References: <cover.1468007377.git.hns@goldelico.com>
 <524f16ecba240bacf57924f43ec38404cfdcde8f.1468007377.git.hns@goldelico.com>
 <57854FB0.1080605@gmail.com>
 <55F90A44-0B60-4342-8143-56F85EA24772@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <55F90A44-0B60-4342-8143-56F85EA24772@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>
List-Id: linux-leds@vger.kernel.org

Hi Nikolaus,

On 07/13/2016 08:09 AM, H. Nikolaus Schaller wrote:
[...]
>>> +	/*
>>> +	 * Kernel conventions require per-LED led-max-microamp property.
>>> +	 * But the chip does not allow to limit individual LEDs.
>>> +	 * So we take minimum from all subnodes.
>>
>> Why minimum? Choose maximum and reduce max_brightness properties
>> of the sub-LEDs with lesser led-max-microamp.
>
> Hm. Is this really the correct way to handle it?
>
> Assume you connect an LED which is specified with 10mA peak current.
> And another with 20mA peak current.
>
> So you define led-max-microamp in the DT as 10 mA and 20 mA.
>
> Firstly a user can set the brightness only to 50% of LED_FULL since it is limited
> by a reduced max_brightness. And heshe finds that not all LEDs have the same
> max_brightness. The first LED will have 127 and the second one 255 for reasons
> not directly understandable.

You have to know that led-max-microamp property was introduced
to standarize Device Tree definition of maximum brightness allowed for
a sub-LED.

Earlier people defined max-brightness property in DT, but at
some point we realized that brightness level is not a proper unit for
describing a hardware property.

It was not global max-microamp setting that appears in recent LED
controllers that drove the introduction of led-max-microamp property.

If you question the idea of having different maximum brightness per
sub-LEDs controlled by the same device, then it means that you have
objections to the entire idea of LED subsystem max_brightness property,
whereas it has been broadly accepted and successfully used for years.

> This entangles "brightness" with "max-current" - which are IMHO two independent
> things.

The fact that recent LED controllers use the same notion for one of its
settings shouldn't mislead us.

> Next, this will set the hardware limit to 20 mA. So there will be current peaks
> of 20 mA for an LED where the DT developer thinks to have specified a led-max-microamp
> of 10 mA. So you run the LED outside of its specs although the DT seems to
> tell that it is inside and user-space thinks it is ok. This will reduce lifetime of LEDs.

In what circumstances would such current peaks occur? On reset?
Shouldn't such a device be considered as broken by design?
What if all LEDs would have low amperage? Would there be some way
to protect them from being damaged by current peaks?

> So either "led-max-microamp" is the wrong name for this property (could better
> be "led-max-average-microamp") or the whole logic is broken.
>
> This is why we hesitate to hide (or even disable because you can't set the limit
> to 10mA by DT) the current limiting chip feature by such a difficult to understand
> automatic feature.
>
> Using the minimum of all led-max-microamp keeps everything on the safe
> side, running some LEDs with less current than specified. But never outside
> of the spec. And all LEDs have the same max_brightness which is IMHO
> more intuitive for the user.
>
> Our original proposal was to define led-max-microamp for the whole chip
> instead of individual LEDs, which is IMHO much easier to understand,
> because it corresponds one-to-one with the data sheet.



-- 
Best regards,
Jacek Anaszewski
