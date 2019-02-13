From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Thu, 14 Feb 2019 00:25:05 +0100
Message-ID: <42078a81-e32e-81b7-528f-d1adb60d31c3@redhat.com>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-2-jekhor@gmail.com>
 <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com> <20190213230731.GA8557@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213230731.GA8557@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 14-02-19 00:07, Pavel Machek wrote:
> Hi!
> 
>> On 12-02-19 21:59, Yauhen Kharuzhy wrote:
>>> Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
>>> PMIC. Charger and general-purpose leds are supported. Hardware blinking
>>> is implemented, breathing is not.
>>>
>>> This driver was tested with Lenovo Yoga Book notebook.
>>
>> Thank you for working on this. The CHT Whiskey Cove PMIC is
>> also used on the GPD win and GPD pocket devices and there LED1
>> by default indicates the charging status.
>>
>> Since your driver forces the LED into SWCTL mode on probe()
>> this means that any kernel with it enabled will break the
>> charging LEDs OOTB function, this is undesirable.
> 
> Agreed.
> 
>> I believe it would be best to add a custom "mode" attribute
>> to the led classdev, with "manual" and "on-when-charging"
>> modes, this would then control bits 0-1 of reg 0x5e1f and
>> by default these bits should be left as is when the driver
>> loads.
> 
> No. This is not first hardware when we have something like this, and
> we need something generic here.
> 
> One possibility would be magic "hardware drives this led"
> trigger. Hmm? (Jacek disliked this idea before, but maybe we can
> convince him).
> 
> Generic "is this driven by hardware or not" attribute might be
> possible, too... but its interaction with triggers/brightness/etc
> would be confusing.

In this case the interaction is not that tricky, but it will
likely be different per led controller, so I do not think that
we can ever come up with a truely generic solution.

Basically the charge led has 3 states:

1) Off
2) On
3) On when charging

And then when on it has 4 patterns:

1) Permanently off (so still not really on)
2) Permanently on
3) Blinking
4) Breathing

These 4 patterns can be selected when on, independent
of being perma-on or ondemand-on

And Yauhen seems to have discovered we can control
the brightness too (I did not find that out while
poking the hw myself).

So this means that we can control most aspects of the
LED even when it is in "On when charging" state


> 
>> Note that in my experience the "charging" mode only works
>> when bits 0-1 have the value 10. I've some written notes from
>> when I played with this myself and they say:
>>
>>     -CHT WC powerled control 0x5e1f: bits 0-1:
>>      0: ????
>>      1: Off
>>      2: On when charging
>>      3: On
>>     -CHT WC powerled pattern control 0x5e20: bits 1-2:
>>      0: Off
>>      1: On
>>      2: Blinking
>>      3: Glowing
>>
> 
>> As for the 0x5e20 settings, I believe another custom
>> sysfs attribute, called "breathing" would be a good idea to
>> export the breathing functionality.
> 
> We have "pattern" trigger that can do this kind of stuff in
> software. But I'm not sure if this is worth supporting.

The problem is that any changes made are permanent, they
survice reboots and the default is Breathing, so we need
a way to restore that which does not involve removing
the internal battery of these devices.

Regards,

Hans
