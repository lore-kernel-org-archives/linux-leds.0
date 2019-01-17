From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
Date: Thu, 17 Jan 2019 22:08:07 +0100
Message-ID: <efb4e1c1-0d13-bed7-d262-284fc1a0c9ab@gmail.com>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com> <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com> <20190116105537.GA1803@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116105537.GA1803@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org

On 1/16/19 11:55 AM, Pavel Machek wrote:
> Hi!
> 
>> On 1/15/19 4:22 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>> +The 24-bit RGB value passed in follows the pattern 0xXXRRGGBB
>>>>> +XX - Do not care ignored by the driver
>>>>> +RR - is the 8 bit Red LED value
>>>>> +GG - is the 8 bit Green LED value
>>>>> +BB - is the 8 bit Blue LED value
>>>>> +
>>>>> +Example:
>>>>> +LED module output 4 of the LP5024 will be a yellow color:
>>>>> +echo 0xe6de00 > /sys/class/leds/lp5024\:led4_mod/color
>>>>> +
>>>>> +LED module output 4 of the LP5024 will be dimmed 50%:
>>>>> +echo 0x80 > /sys/class/leds/lp5024\:led4_mod/brightness
>>>>> +
>>>>> +LED banked RGBs of the LP5036 will be a white color:
>>>>> +echo 0xffffff > /sys/class/leds/lp5036\:led_banked/color
>>>>
>>>> This part with example cans remain in Documentation/leds if you
>>>>> like.
>>>
>>> Does it actually work like that on hardware?
>>
>> What?
> 
> If you do echo 0xffffff > /sys/class/leds/lp5036\:led_banked/color,
> does it actually produce white? With all the different RGB modules
> manufacturers can use with lp5024P?
> 
> If you do echo 0xe6de00 > /sys/class/leds/lp5024\:led4_mod/color, does
> it actually produce yellow, with all the different RGB modules
> manufacturers can use with lp5024P?

Vesa proposed using icc-profiles to make the colors looking similar
on various LEDs. It was in reply to your message with requirements
for RGB LED class.

For this device we can however do without it. Videos showing the
performance of this particular device with a reference design using
RGB LEDs prove it works nice.

>>> Is it supposed to support "normal" RGB colors as seen on monitors?
>>
>> Monitors are not an application for this part.
> 
> You did not answer the question. When you talk about yellow, is it
> same yellow the rest of world talks about?
> 
>>> Because 100% PWM on all channels does not result in white on hardware
>>> I have.
>>
>> I don't know I am usually blinded by the light and have no diffuser over
>> the LEDs to disperse the light so when I look I see all 3 colors.
> 
> How can we have useful discussion about colors when you don't see the
> colors?
> 
> Place a piece of paper over the LEDs....
> 
>>> But...
>>>
>>> I believe we should have a reasonable design before we do something
>>> like this. There's no guarantee someone will not use lp50xx with just
>>> the white LEDs for example. How will this work? Plus existing hardware
>>> already uses three separate LEDs for RGB LED. Why not provide same
>>> interface?
>>
>> Which existing hardware?  Are they using this part?
> 
> Nokia N900. They are not using this part, but any interface we invent
> should work there, too.
> 
>> <rant>
>> Why are we delaying getting the RGB framework or HSV in?
>> I would rather design against something you want instead of having
>> everyone complain about every implementation I post.
>> </rant>
> 
> Because you insist on creating new kernel interfaces, when existing
> interfaces work, and are doing that badly.
> 
> Because your patches are of lower quality than is acceptable for linux
> kernel.

Lets keep things civil please.

This sentence should look familiar to you - it's not the first time
you resort to this type of narration.

> Because you don't seem to be reading the emails.
> 
> I sent list of requirements for RGB led support. This does not meet
> them.

And you didn't respond to the comments from Vesa. The requirements
has not been acclaimed.

>> It is not a normal RGB driver.  The device collates the individual RGB
>> clusters into a single brightness register and you can modify the intensity of the individual
>> LEDs via other registers.  If brightness is 0 then the cluster is OFF regardless of the color
>> set in the individual registers.
> 
> I understand that. So just set cluster brightness to 255 and you have
> normal RGB driver you can control with existing interfaces. You don't
> have to use every feature your hardware has.

This feature is one of the core advantages of this device.

> You did not answer the "what if someone uses this with all white LEDs"
> question.
> 
> You know what? First, submit driver with similar functionality to
> existing RGB drivers, using same interface existing drivers are
> using. When that is accepted, we can talk about extending
> kernel<->user interfaces.

This stands in contradiction with my request.

Provided there will be no other NAKs, I am eager to accept the
interface with color and brightness files.

Moreover, I think that RGB LED class with configurable
brightness-model, and with possible color range adjustments via
icc-profiles or something similar, is the best solution that has been 
proposed so far. It is just flexible.

I'd like to capitalize on the ideas shared in this thread and have
finally LED RGB class materialized.

-- 
Best regards,
Jacek Anaszewski
