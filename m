From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: RGB LED class Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX
 family of the RGB LED driver
Date: Fri, 18 Jan 2019 23:13:10 +0100
Message-ID: <61fa89eb-c12e-8f9c-9457-9d6d17ba7717@gmail.com>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com> <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com> <20190116105537.GA1803@amd>
 <86299268-3202-814a-134b-04bd2170faab@ti.com>
 <8dfa2854-2814-6874-ab8e-1858e9a18acf@gmail.com> <20190118000235.GB27661@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118000235.GB27661@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 1/18/19 1:02 AM, Pavel Machek wrote:
> Hi!
> 
> 
>>> I am willing to work with you on the HSV and adapting the LP50xx part to this framework.
>>> Or any RGB framework for that matter.  I still don't agree with the kernel needing to declare colors
>>>   maybe color capabilities but not specific colors.
>>
>> Dan, if you have a bandwidth for LED RGB class implementation
>> then please go ahead. It would be good to compare colors produced
>> by software HSV->RGB algorithm to what can be achieved with
>> LEDn_BRIGHTNESS feature.
> 
> Don't get me wrong, I'd like to see LED RGB class implementation. But
> it will delay merge of this driver.
> 
> If we want to do that, we should first discuss the requirements, and
> then come up with interface.. and only then we can talk about the
> driver code.
> 
> That's why I believe preferable way would be to merge the driver using
> the existing interface.
> 
> Of course, first designing RGB LED class and then merging the
> driver.. is okay with me. But lets not rush the class because there's
> driver waiting for it.
> 
>> The requirements for LED RGB class as I would see it:
>>
>> sysfs interface:
>>
>> brightness-model: space separated list of available options:
>> - rgb (default):
>>    - creates color file with "red green blue" decimal values
>>    - creates brightness file
>> 	a) for devices with hardware support for adjusting color
>>             intensity it maps to corresponding register
>>          b) for the rest writing any value greater than 0 will result
>>             in setting all color registers to max
>> - hsv:
>>    - creates color file with "h s v" values - it shall
>>      use software HSV->RGB algorithm for setting color registers
>>
>> - any other custom color ranges defined in DT, but it can be covered
>>    later
>> - other options?
> 
> First, I think we want to decide if RGB LED should be presented as
> 3 LEDs or as 1 LED... and what to do with existing RGB leds being
> presented as 3 LEDs.
> 
> I don't think we want to support both RGB and HSV in the kernel. It is
> math, and not a nice one.
> 
> Yes, both have advantages and disadvantages, but having _both_ in
> kernel has disadvantages of both.
> 
> One way I could imagine the interface:
> 
>      RGB LED presented as one LED.
> 
>      brightness -- controls brightness of whole RGB module.

What algorithm would be used for mapping brightness levels to RGB values
in case of devices without hardware support for that?

>      pwm_channels -- "1000 240 300" -- "red part should be full on, green
>      should be pwm controlled to 240/1000, blue should be 300/1000"
> 
>      pwm_white -- "1000 500 400" -- tells userspace what to write to PWM
>      channels to get approximately white color.
> 
>      This would assume that RGB LEDs are always pwm controlled. That
>      seems to be true for hardware I seen.

Why pwm in the file names? I don't see any gain and only possible
problems. Many LED controllers use current level and not PWM
for driving LEDs.

Even mainline RGB LED driver: drivers/leds/leds-lp3952.c [0].

s/pwm/color/

Besides white also other color presets could be defined in DT.

>      + no complex math in kernel
> 
>      + userspace knows enough to display arbitrary colors
> 
>      + userspace can use full range of available PWM intensities
> 
>      + existing triggers will work nicely
> 
>      - userland needs to do non-trivial math to get colors it wants
> 
>      - not sure how to migrate existing devices
> 
> Thoughts? Other possible interfaces?


[0] https://www.mouser.com/ds/2/348/bd2802gu-e-210449.pdf

-- 
Best regards,
Jacek Anaszewski
