From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFD] Sharing GPIOs for input (buttons) and output (LEDs)
Date: Mon, 22 Feb 2016 13:14:54 +0100
Message-ID: <CAMuHMdWbpj=ZnFqh1uWZSCojvrM+NB=Bbzw=UebodTr+vAKy7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:35830 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754203AbcBVMOz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 22 Feb 2016 07:14:55 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

TL;DR: If a GPIO is connected to both a push button and an LED, can we
(1) still use both, or can we (2) chose which one to use?
This affects both the hardware description in DT and user policies.


Introduction
------------

On the Renesas Salvator-X development board, 3 GPIO pins are connected to both
push buttons and LEDs.
  - If the GPIO is configured for output, it can control the LED,
  - If the GPIO is configured for input, the push button status can be
    read. Note that the LED is on if the push button is not pressed; it is
    turned off while holding the button.


DT Hardware Description
-----------------------

There exist device tree bindings for push buttons connected to GPIOs,
and the following works:

        keyboard {
                compatible = "gpio-keys";

                key-a {
                        gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
                        label = "SW20";
                        wakeup-source;
                        linux,code = <KEY_A>;
                };
                key-b {
                        gpios = <&gpio6 12 GPIO_ACTIVE_LOW>;
                        label = "SW21";
                        wakeup-source;
                        linux,code = <KEY_B>;
                };
                key-c {
                        gpios = <&gpio6 13 GPIO_ACTIVE_LOW>;
                        label = "SW22";
                        wakeup-source;
                        linux,code = <KEY_C>;
                };
        };


There exist device tree bindings for LEDs connected to GPIOs, and the
following also works:

        leds {
                compatible = "gpio-leds";

                led4 {
                        gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
                        label = "LED4";
                };
                led5 {
                        gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
                        label = "LED5";
                };
                led6 {
                        gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
                        label = "LED6";
                };
        };


However, having both in the DTS doesn't mean you'll have working buttons
and LEDs. The first driver initialized will bind to the GPIOs. The
second driver will fail to initialize as the GPIOs are already busy.

One option to solve this is to introduce new bindings for GPIOs shared
by push buttons and LEDs. But that isn't without its own set of
problems. E.g. in my case the buttons use GPIO_ACTIVE_LOW, while the
LEDs use GPIO_ACTIVE_HIGH (I'm sure other combinations are possible),
which is supposed to be encoded in the GPIO descriptor.

Hence I'm inclined to keep the existing bindings, as they do describe
the hardware.


Device Driver
-------------

As a proof-of-concept, I hacked up a new driver that binds to both
"gpio-keys" and "gpio-leds", by combining the existing gpio-keys-polled
and gpio-leds drivers.

If a GPIO is found busy during initialization, and if it's already in
use by the other half of the driver, the driver switches to a special
"polled-key-and-LED" mode. I.e. during polling, it does:
  - Save the GPIO output state,
  - Switch the GPIO to input mode,
  - Wait 5 ms (else it will read the old output state, depending on
    e.g. hardware capacitance),
  - Read the GPIO input state,
  - Switch the GPIO to output mode,
  - Restore the GPIO output state.

And it works, the LEDs can be controlled, and the push button states can
be read!

However, due to the 5 ms delay, there's a visible flickering of LEDs
that are supposed to be turned off (remember, when the GPIO is
configured for input and the button is not pressed, the LED is lit).

If we go this route, adding support for non-polled GPIOs (if the GPIO is
not shared with an LED) and wake-up should be doable.


User Policies
-------------

Hence we can have support for GPIOs connected to both push buttons and
LEDs. But perhaps the user doesn't want to use both at the same time,
or not for all GPIOs. On a final product this is probably not the case,
but it is on a development board like Salvator-X.

If it wasn't for the visible flickering when both are enabled, this
wouldn't matter. But the flickering may be considered annoying, so it
would be good if the user could disable either the push button or LED by
software.

One option is to disable the keyboard node using a DT overlay. But
that's cheating, as it modifies the hardware description, while this is
clearly a user policy.

Another use case would be to use the LEDs, and not the buttons, except
for system wake-up. Then there wouldn't be a need to poll during normal
system operation.


Thanks for your comments!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
