From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
Date: Tue, 15 Jan 2019 18:20:46 -0600
Message-ID: <79394d17-3124-75b2-ccac-dc1046499d14@ti.com>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com> <20190115222223.GA17363@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115222223.GA17363@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org

Hello

Pavel Thanks for the review it is always good to have your comments.

On 1/15/19 4:22 PM, Pavel Machek wrote:
> Hi!
> 
>>> +The 24-bit RGB value passed in follows the pattern 0xXXRRGGBB
>>> +XX - Do not care ignored by the driver
>>> +RR - is the 8 bit Red LED value
>>> +GG - is the 8 bit Green LED value
>>> +BB - is the 8 bit Blue LED value
>>> +
>>> +Example:
>>> +LED module output 4 of the LP5024 will be a yellow color:
>>> +echo 0xe6de00 > /sys/class/leds/lp5024\:led4_mod/color
>>> +
>>> +LED module output 4 of the LP5024 will be dimmed 50%:
>>> +echo 0x80 > /sys/class/leds/lp5024\:led4_mod/brightness
>>> +
>>> +LED banked RGBs of the LP5036 will be a white color:
>>> +echo 0xffffff > /sys/class/leds/lp5036\:led_banked/color
>>
>> This part with example cans remain in Documentation/leds if you
>>> like.
> 
> Does it actually work like that on hardware?

What?

> 
> Is it supposed to support "normal" RGB colors as seen on monitors?

Monitors are not an application for this part.

Data sheet indicates these are the target applications

LED Lighting, Indicator Lights, and Fun Lights for:
Smart Speaker
Smart Home Appliances
Video Doorbell
Electric Smart Lock
Smoke Detector
Set-Top Box
Smart Router
Handheld Devices

ie Echo, Ring

> 
> Because 100% PWM on all channels does not result in white on hardware
> I have.
> 

I don't know I am usually blinded by the light and have no diffuser over
the LEDs to disperse the light so when I look I see all 3 colors.

>>> +	} else {
>>> +		led_offset = (led->led_number * 3);
>>> +		red_reg = priv->mix_out0_reg + led_offset;
>>> +		green_reg = priv->mix_out0_reg + led_offset + 1;
>>> +		blue_reg = priv->mix_out0_reg + led_offset + 2;
>>> +	}
>>> +
>>> +	red_val = (mix_value & 0xff0000) >> 16;
>>> +	green_val = (mix_value & 0xff00) >> 8;
>>> +	blue_val = (mix_value & 0xff);
>>
>> I've been rather thinking about space separated list of decimal
>> "red green blue" values, but maybe this way it will be less
>> controversial. Let's if there will be other opinions.
> 
> We support maximum brightness > 255, so space separated is certainly
> better option than this.
> 

I was using the HSL picker URL that Jacek sent to me that gave me that idea
And there were comments about presenting a single file to control the color.
But that was probably lost in the noise of the email chain.

https://lore.kernel.org/patchwork/patch/1026514/

"Apart of that, I've been also mulling over if we shouldn't go for single
"color" sysfs file for setting r,g,b components at one go."

http://hslpicker.com/#e6e200

> But...
> 
> I believe we should have a reasonable design before we do something
> like this. There's no guarantee someone will not use lp50xx with just
> the white LEDs for example. How will this work? Plus existing hardware
> already uses three separate LEDs for RGB LED. Why not provide same
> interface?
> 

Which existing hardware?  Are they using this part?

<rant>
Why are we delaying getting the RGB framework or HSV in?
I would rather design against something you want instead of having
everyone complain about every implementation I post.
</rant>

It is not a normal RGB driver.  The device collates the individual RGB
clusters into a single brightness register and you can modify the intensity of the individual
LEDs via other registers.  If brightness is 0 then the cluster is OFF regardless of the color
set in the individual registers.

And the RGB clusters can be banked into a single RGB cluster group to
present a single register to control numerous RGB LED clusters.

> (Oh and don't try to say "sysfs is slow", without numbers).

Never said sysfs was slow.

Dan
> 
> Thanks,
> 									Pavel
> 


-- 
------------------
Dan Murphy
