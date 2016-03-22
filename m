From: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Subject: Re: [RFD] Sharing GPIOs for input (buttons) and output (LEDs)
Date: Tue, 22 Mar 2016 19:29:30 +0530
Message-ID: <56F14FC2.8060804@linaro.org>
References: <CAMuHMdWbpj=ZnFqh1uWZSCojvrM+NB=Bbzw=UebodTr+vAKy7g@mail.gmail.com>
 <CACRpkdb1J+-_9szuv6xWhrD7+NFeCjug+cqaYsHDYyLUYbLw1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:32771 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758623AbcCVN7h (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 22 Mar 2016 09:59:37 -0400
Received: by mail-pf0-f172.google.com with SMTP id 4so181879128pfd.0
        for <linux-leds@vger.kernel.org>; Tue, 22 Mar 2016 06:59:36 -0700 (PDT)
In-Reply-To: <CACRpkdb1J+-_9szuv6xWhrD7+NFeCjug+cqaYsHDYyLUYbLw1w@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



On Thursday 17 March 2016 03:48 PM, Linus Walleij wrote:
> On Mon, Feb 22, 2016 at 1:14 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>
>> On the Renesas Salvator-X development board, 3 GPIO pins are connected to both
>> push buttons and LEDs.

Not exactly related to buttons and leds,
but recently I came across another usecase of shared gpio,

Say, for example, we have multiple external I2C peripheral which share
interrupt line over gpio (ofcourse irq line is muxed onto single gpio).

Now in kernel I would have multiple instances of driver supporting each
peripheral but gpio can not be shared for registering irq.

Do you suggest MFD driver for such simple usecases ? Should gpiolib
support SHARED gpios, and gpiolib can define all the policies over
configuration (input only, what about conflicts, bidirectional mode?)

Thanks,
Vaibhav


>>    - If the GPIO is configured for output, it can control the LED,
>>    - If the GPIO is configured for input, the push button status can be
>>      read. Note that the LED is on if the push button is not pressed; it is
>>      turned off while holding the button.
>
> Have you asked the hardware engineer who did this construction
> what s/he was thinking? And I mean seriously: what was the
> usecase? Did they really design the LEDs to be used to flicker
> with or just as an indication as to whether the button was being
> pushed or not?
>
> Your approach seems dedicated to use it for both usecases (also
> as a stand-alone heartbeat or whatever) but was that really
> intended?
>
>>          keyboard {
>>                  compatible = "gpio-keys";
>>
>>                  key-a {
>>                          gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
>>                          label = "SW20";
>>                          wakeup-source;
>>                          linux,code = <KEY_A>;
>>                  };
>>                  key-b {
>>                          gpios = <&gpio6 12 GPIO_ACTIVE_LOW>;
>>                          label = "SW21";
>>                          wakeup-source;
>>                          linux,code = <KEY_B>;
>>                  };
>>                  key-c {
>>                          gpios = <&gpio6 13 GPIO_ACTIVE_LOW>;
>>                          label = "SW22";
>>                          wakeup-source;
>>                          linux,code = <KEY_C>;
>>                  };
>>          };
>
> I suspect that in this usecase, the GPIO should be flagged
> GPIO_OPEN_DRAIN rather than GPIO_ACTIVE_LOW,
> as the construction with the LED draws current fron the line.
>
>> There exist device tree bindings for LEDs connected to GPIOs, and the
>> following also works:
>>
>>          leds {
>>                  compatible = "gpio-leds";
>>
>>                  led4 {
>>                          gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
>>                          label = "LED4";
>>                  };
>>                  led5 {
>>                          gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
>>                          label = "LED5";
>>                  };
>>                  led6 {
>>                          gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
>>                          label = "LED6";
>>                  };
>>          };
>
> OK
>
>> If a GPIO is found busy during initialization, and if it's already in
>> use by the other half of the driver, the driver switches to a special
>> "polled-key-and-LED" mode. I.e. during polling, it does:
>>    - Save the GPIO output state,
>>    - Switch the GPIO to input mode,
>>    - Wait 5 ms (else it will read the old output state, depending on
>>      e.g. hardware capacitance),
>>    - Read the GPIO input state,
>>    - Switch the GPIO to output mode,
>>    - Restore the GPIO output state.
>>
>> And it works, the LEDs can be controlled, and the push button states can
>> be read!
>
> Why go to such troubles of switching the line from output to
> input to read it?
>
> Especially when a line is OPEN_DRAIN it should be perfectly legal
> to read it's value even if it is set as output, but AFAICT that is
> always working no matter whether the line is set as output.
>
>> However, due to the 5 ms delay, there's a visible flickering of LEDs
>> that are supposed to be turned off (remember, when the GPIO is
>> configured for input and the button is not pressed, the LED is lit).
>>
>> If we go this route, adding support for non-polled GPIOs (if the GPIO is
>> not shared with an LED) and wake-up should be doable.
>
> I think this actually implies OPEN_DRAIN and if you flag it as such
> the core should be happy using it as input and output at the same
> time.
>
> If the hardware has a problem with reading the value from a line
> that is set to output, it needs a workaround hack in the driver to
> support reading and output line, *NOT* changes to gpiolib,
> because the lib assumes this is always possible, i.e. it will
> call the driver .get() callback no matter what.
>
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
