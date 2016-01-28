From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v2] gpio: Add driver for TI TPIC2810
Date: Thu, 28 Jan 2016 08:56:48 -0600
Message-ID: <56AA2C30.2040708@ti.com>
References: <1453738452-23633-1-git-send-email-afd@ti.com>
 <CACRpkdbkwd4K3rav+gfoSO_TqVQqfPXykGF2TWLQ7xWFOOtSaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbkwd4K3rav+gfoSO_TqVQqfPXykGF2TWLQ7xWFOOtSaA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 01/28/2016 04:47 AM, Linus Walleij wrote:
> On Mon, Jan 25, 2016 at 5:14 PM, Andrew F. Davis <afd@ti.com> wrote:
>
>> Add driver for TI TPIC2810 8-Bit LED Driver with I2C Interface.
>>
>> The TPIC2810 has 8 open-drain outputs that can but used to drive
>> LEDs and other low-side switched resistive loads.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>> Changes from v1:
>>   - Added OF match table at Javier Martinez Canillas request
>
> So the TI datasheet says:
> "8 bit LED driver with I2C interface"
>
> So it is *not* "general purpose input/output" (GPIO).
>
> It is special purpose LED drive output-only circuit.
>
> So why can it not have a driver directly in drivers/leds/*?
>
> I understand that it can also be used as a GPIO (and that it
> is then nice to put leds-gpio on top of it) but then
> I want a reference to the hardware that actually went ahead
> and used this as a GPIO chip rather than using a proper
> GPIO expander.
>
> Yours,
> Linus Walleij
>

These don't really have the traditional LED features (current control,
HW blinking, etc), and all the use cases I've found treat them as GPO,
including our Industrial Dev Kits (although they run them to test LEDs
as well as the IO header):

http://www.ti.com/tool/tmdsice3359
http://www.ti.com/tool/tmdxidk437x

And a couple more that I don't think have any public schematics yet.

Like you said, they can still be used for LEDs with leds-gpio, as they
don't have any LED specific features I figure this way we get both
uses with one driver.

Andrew
