From: Jelle Martijn Kok <jmkok-i3KCcyIX/XtmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH] leds-pwm: the startup brightness can be specified
Date: Tue, 14 Feb 2017 11:34:23 +0100
Message-ID: <74325158-79f6-ff2a-832e-9f2ece1cf853@youcom.nl>
References: <aed1129a-993a-91d9-7b14-13c3424ee0f4@solutionsradio.com>
 <c4aebca4-d5a1-aaa7-d69b-8d0e4d4d8ba8@gmail.com> <20170210205614.GA6576@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170210205614.GA6576@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


On 10-02-17 21:56, Pavel Machek wrote:
> Hi!
>
>>> +        led.default_brightness = LED_OFF;
>>> +        of_property_read_u32(child, "brightness",
>>> +                     &led.default_brightness);
>> At first you would have to submit a patch for
>> Documentation/devicetree/bindings/leds/common.txt that would add
>> brightness property. The question is whether it is really needed?
>> You can set brightness from userspace via sysfs API.
>>
>> By the way, I have a question to DT maintainers: is DT a proper
>> place for defining this type of configuration that can be set via
>> userspace scripts? Shouldn't DT describe only hardware properties and
>> constraints resulting from board configuration?
> Well, if the hardware has label "half - power, full - transmitting" on
> a LED, we might want kernel to turn it to half power on bootup.
>
> If you have a "disk activity LED" on a PC, it is driven by
> hardware. On arm notebook, it would be nice if "disk activity LED"
> worked, too. Preferably even when running fsck in init=/bin/bash
> mode. We already provide that, AFAICT, so having ability to set
> constant brightness sounds sane to me.
There is also some delay between kernel and user space where the leds 
are too bright or simply off... (which is quite ugly for a simple "power 
on" led)

One thing that I have seen is that several led triggers do not play 
along with the brightness. For example, the "heartbeat" trigger always 
sets the brightness to LED_FULL. Which negates the set brightness on 
each blink... So would it not be an idea to add a "led_set_on_off(led, 
state)" function which retains "brightness" and additionally takes an 
"invert" parameter into account. This might also simplify code in other 
led triggers.

Jelle

-- 
------------------------------------------------------------------------
You/Com Audiocommunicatie b.v.
Motorenweg 5k
2623CR Delft
The Netherlands
tel. : (+31)15 262 59 55
fax. : (+31)15 257 15 95
mail : jmkok-i3KCcyIX/XtmR6Xm/wNWPw@public.gmane.org
http : http://www.youcom.nl
------------------------------------------------------------------------

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
