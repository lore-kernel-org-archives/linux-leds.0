From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Single gpio shared by LED and switch?
Date: Tue, 08 Sep 2015 12:51:40 +0200
Message-ID: <55EEBDBC.8040408@samsung.com>
References: <CAMuHMdVPvLgKfHh+d1Gx0W2FzqkJkqG8E93QuAHOS=SAJBZ-xA@mail.gmail.com>
 <55ED8B36.60108@samsung.com>
 <CAMuHMdUrhrJv_3UX32AMC2Z_f4xp+LABgDCjgWdcJFa6=k9n_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <CAMuHMdUrhrJv_3UX32AMC2Z_f4xp+LABgDCjgWdcJFa6=k9n_g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Geert,

Thanks for sharing this.

On 09/07/2015 03:22 PM, Geert Uytterhoeven wrote:
> Hi Jacek,
>
> On Mon, Sep 7, 2015 at 3:03 PM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> On 09/01/2015 07:00 PM, Geert Uytterhoeven wrote:
>>> I'm wondering if there already exists a driver for a gpio that's connected
>>> to both an LED and an input switch.
>>>
>>> I'd expect such a hardware configuration to be fairly common, as gpios can
>>> be
>>> a limited resource.
>>> Most of the time the gpio would be in output mode, driving the LED, but at
>>> regular intervals the mode would be changed for a very short moment to
>>> input,
>>> to monitor the state of the switch.
>>>
>>> I had a quick look at various drivers (and of course at
>>> Documentation/gpio/drivers-on-gpio.txt), but couldn't find any.
>>>
>>> Does such a hybrid of "leds-gpio" and "gpio-keys(-polled)" already exists?
>>
>> Can you share an example of such a circuit? Would it be possible to
>
> Something like this?
>
>                       VCC         VCC
>                        |           |
>                        R           R
>                        |           |
>                __|__   |           |
>            +---o   o---+          _|_
>            |           |          \ /
>            |           |          ---
>           GND          R           |
>                        |           |
>                        |         |-+
>                        |         |<+
> GPIO -----------------+---------|-|
>                                    |
>                                    |
>                                   GND

You would need also resistor to avoid short-circuit
when the switch is on.

>
>> construct it without additional GPIO driven transistor?
>
> Perhaps just like this?
>
>                       VCC
>                        |
>                        R
>                        |
>                        |
>                       _|_
>                       \ /
>                       ---
>                        |
>                        |
> GPIO -----R-----------+
>                        |
>                        |
>                      | o
>                     -|
>                      | o
>                        |
>                        |
>                       GND
>

We'd have to ask Linus if he welcomes drivers for this type
of home-made circuits in mainline. If yes, then probably someone would
have to build the circuit, develop and test the driver on it, and
finally come up with a detailed documentation.
Are you the volunteer? :)

-- 
Best Regards,
Jacek Anaszewski
