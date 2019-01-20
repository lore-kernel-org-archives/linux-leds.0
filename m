From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: RGB LED class Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX
 family of the RGB LED driver
Date: Sun, 20 Jan 2019 16:30:36 +0100
Message-ID: <9d2e0220-69f0-faaa-adb9-13d905f9c51d@gmail.com>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com> <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com> <20190116105537.GA1803@amd>
 <86299268-3202-814a-134b-04bd2170faab@ti.com>
 <8dfa2854-2814-6874-ab8e-1858e9a18acf@gmail.com> <20190118000235.GB27661@amd>
 <61fa89eb-c12e-8f9c-9457-9d6d17ba7717@gmail.com> <20190119213629.GA3654@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119213629.GA3654@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org

On 1/19/19 10:36 PM, Pavel Machek wrote:
> Hi!
> 
>>> First, I think we want to decide if RGB LED should be presented as
>>> 3 LEDs or as 1 LED... and what to do with existing RGB leds being
>>> presented as 3 LEDs.
>>>
>>> I don't think we want to support both RGB and HSV in the kernel. It is
>>> math, and not a nice one.
>>>
>>> Yes, both have advantages and disadvantages, but having _both_ in
>>> kernel has disadvantages of both.
>>>
>>> One way I could imagine the interface:
>>>
>>>      RGB LED presented as one LED.
>>>
>>>      brightness -- controls brightness of whole RGB module.
>>
>> What algorithm would be used for mapping brightness levels to RGB values
>> in case of devices without hardware support for that?
> 
> Output power = brightness / max_brightness * pwm_channel[x].

IIUC you mean it as a formula for calculating r,g,b, values?
I.e., on brightness setting we would have to do this calculation for
each of three channels?

Then, it will result in changing hue as well. That's why we're
discussing HSV.

>>>      pwm_channels -- "1000 240 300" -- "red part should be full on, green
>>>      should be pwm controlled to 240/1000, blue should be 300/1000"
>>>
>>>      pwm_white -- "1000 500 400" -- tells userspace what to write to PWM
>>>      channels to get approximately white color.
>>>
>>>      This would assume that RGB LEDs are always pwm controlled. That
>>>      seems to be true for hardware I seen.
>>
>> Why pwm in the file names? I don't see any gain and only possible
>> problems. Many LED controllers use current level and not PWM
>> for driving LEDs.
> 
> I want to make sure userspace understands this has linear relation to
> output power. I'd like to avoid mentioning color because there power
> output is not linear with "RGB"
> 
>> s/pwm/color/
> 
> s/pwm/power/ would work for me.

Power implies physical units. I'd prefer "intensity".

>> Besides white also other color presets could be defined in DT.
> 
> They should not be neccessary. When userspace knows what is white and
> that power is linear with values in power_channels, it should be able
> to do colorspace conversion itself.

Have you verified it in practice? Would it allow to convert RGB values
of the color displayed on the monitor to LED RGB class intensities,
allowing to achieve similar color on the LED?

-- 
Best regards,
Jacek Anaszewski
