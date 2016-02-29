From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: Re: [PATCH RFC 3/3] leds: Add driver for the ISSI IS31FL32xx family
 of LED drivers
Date: Mon, 29 Feb 2016 13:26:17 -0500
Message-ID: <20160229132617.209030ad.drivshin.allworx@gmail.com>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
	<1456251445-23970-4-git-send-email-drivshin.allworx@gmail.com>
	<56CDD4AA.5030801@samsung.com>
	<20160224212450.195330ed.drivshin.allworx@gmail.com>
	<56CEDDBE.2080601@samsung.com>
	<20160225141215.2ef2707e.drivshin.allworx@gmail.com>
	<56D01F42.70409@samsung.com>
	<20160226165823.2ff62b21.drivshin.allworx@gmail.com>
	<56D413C0.7030303@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f65.google.com ([209.85.192.65]:34026 "EHLO
	mail-qg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752126AbcB2S0W (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Feb 2016 13:26:22 -0500
In-Reply-To: <56D413C0.7030303@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>

On Mon, 29 Feb 2016 10:47:44 +0100
Jacek Anaszewski <j.anaszewski@samsung.com> wrote:

> On 02/26/2016 10:58 PM, David Rivshin (Allworx) wrote:
> > On Fri, 26 Feb 2016 10:47:46 +0100
> > Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> >
> >> On 02/25/2016 08:12 PM, David Rivshin (Allworx) wrote:
> >>> On Thu, 25 Feb 2016 11:55:58 +0100
> >>> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> >>>
> >>>> On 02/25/2016 03:24 AM, David Rivshin (Allworx) wrote:
> >>>>> On Wed, 24 Feb 2016 17:04:58 +0100
> >>>>> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> >>>>>
> >>>>>> Hi David,
> >>>>>>
> >>>>>> Thanks for the patch. Very nice driver. I have few comments
> >>>>>> below.
> >>>>>
> >>>>> Thanks Jacek, I have responded the comments inline. I also wanted to
> >>>>> double check whether you noticed some questions I had in the cover
> >>>>> letter [1]. As I mentioned in another email to Rob, in hindsight I'm
> >>>>> guessing I should have included them in the patch comments as well (or
> >>>>> instead of).
> >>>>
> >>>> I saw them. I assumed that the review itself will address those
> >>>> questions.
> >>>
> >>> Fair enough, thanks for the confirmation.
> >>>
> >>>>> Your review comments here effectively answered some of the questions, but
> >>>>> the big one I'm still unsure of is whether it actually makes sense to
> >>>>> have all 4 of these devices supported by a single driver.
> >>>>
> >>>> It's perfectly fine. Many drivers implement this pattern.
> >>>
> >>> OK, then I'll assume you think this driver is not yet too complicated
> >>> for it's own good. Out of curiosity, might that view change if the
> >>> 3216 specific features were ever implemented, especially GPIO and HW
> >>> animation support? Gut feel is that would make 3216 specific code
> >>> bigger than the rest of the code combined.
> >>
> >> I don't think so.
> >
> > Thanks, that helps calibrate my intuition for the future.
> >
> >>> Bigger question is what should be done in terms of the overlap in device
> >>> support between this driver and leds-sn3218? If you think I should leave
> >>> the *3218 support in this driver, then I would propose:
> >>>     - remove leds-sn3218 and its separate binding doc
> >>>     - add the "si-en,sn3218" compatible string to this driver and binding doc
> >>> Note that while I expect this driver to work with the 3218 chips, I do
> >>> not have one to test against. If we go down this route I would definitely
> >>> want Stefan to test so that I don't accidentally break him.
> >>
> >> I'd prefer to have a single driver for the same hardware. Stefan, would
> >> it be possible for you to test David's driver with the hardware you
> >> have an access to?
> >
> > Stefan, one thing to note: the existing sn3218 driver/binding uses 0-based
> > 'reg' values, and this driver/binding uses 1-based 'reg' values. So your
> > devicetree(s) would need to be updated for that (as well as the compatible
> > string).
> 
> Actually, If your driver can successfully handle Si-En SN3218 I'd prefer
> to drop leds-sn3218 along with its bindings and add related compatible
> to your bindings documentation.

Agreed. The changing of compatible string would only need to be done with
the current version of the series. 
In the next version I'll add a 4th patch (unless you'd prefer a separate 
patch not part of the series?) that removes leds-sn3218 and moves that
support into the is31fl32xx driver.

> > I didn't see a final answer from Rob as to which way is most appropriate
> > for these devices yet, so I don't know which way this will end up in the
> > final patch.
> >
> >>> Also I feel I should point out some differences between the 3218 support
> >>> in this driver versus the leds-sn3218 driver, in case they have any
> >>> impact:
> >>>     - (as previously mentioned) leds-sn3218 turns off an LEDs enable
> >>>       bit if the brightness is set to 0. This driver just sets the PWM
> >>>       to 0 and leaves the enable bits always on.
> >>
> >> Setting brightness to 0 is an equivalent to turning the device in
> >> a power down mode or at least in the state where the current consumption
> >> is as low as possible. A hardware configuration that is most fitting
> >> for this requirements should be chosen.
> >
> > As far as I can tell from the datasheets, setting the PWM duty cycle for
> > a given channel to 0 should have the same net effect as setting the enable
> > bit of that channel to 0. I assume the purpose of the enable bits is to
> > make it easier to turn an LED on/off without adjusting the PWM duty cycle,
> > but just using always the PWM duty cycle register conveniently maps to
> > the leds API.
> 
> ack.
> 
> >>>     - leds-sn3218 uses a regmap, I think mostly to deal with the enable
> >>>       bits, but it also has the benefit of showing up in debugfs. This
> >>>       could be seen as useful in and of itself by some users. On the other
> >>>       hand regmap introduces another mutex on every write.
> >>
> >> I will not insist on using regmap if you don't refer to the current
> >> state of hw registers in your driver.
> >
> > Currently I have not had a need to refer to the current state of any HW
> > registers. I could imagine that might be needed in the future if extra
> > functionality is implemented, but it wasn't so far.
> 
> Regmap exposes nice debugfs interface, so this, and the fact that there
> are uncovered hw features, can be thought of as a sufficient
> argument in favour of using regmap even now. But it's up to you.

If it's OK with you, I think I'll leave it without regmap for now. I 
don't really relish the thought of having 4 large blocks of reg_default 
(especially the 3216 has a large register set for animation), and I
haven't yet worked out how/if I could dynamically generate them from 
the chipdefs in a reasonable way.

> >>>     - leds-sn3218 implements the shutdown callback. Actually, I think I
> >>>       should add that to this driver in any event.
> >>
> >> Do you see use cases or hardware configurations that need such
> >> a callback? I didn't oppose in case of Stefan's driver, but if we are
> >> at it, we can consult Stefan if he saw that use case?
> >>
> >> I'd say that shutdown op is usually useful when CPU and LED
> >> controller are powered from different sources, which can result in
> >> a situation when CPU is turned off, but LED remains on.
> >
> > That is exactly what happens today on my board: if the system is rebooted
> > or shut down the LEDs all stay in whatever state they were last in. This
> > could also be handled by userspace shutdown scripts easily enough, but I
> > thought it surprising when the system reboots but LEDs stay on.
> 
> That's the shutdown callback is for.

I'll add a shutdown callback that will do the same as the remove callback,
and ensure all LEDs go dark.
Is there anything verboten with having one just call the other, or just
registering the same function for both callbacks?

> > On the
> > other hand someone might have a good reason to want to leave an LED on
> > through a reboot.
> 
> If you have such a use case, then you can add DT property for this.
> E.g. retain-state-on-shutdown.

I don't have such a use case right now, but noted for the future.

> > There is also an inconsistency on what happens during remove() vs shutdown().
> > In led_classdev_unregister() brightness is set to LED_OFF, so that happens
> > for all drivers on remove(). But only some drivers implement a shutdown()
> > which also turns off LEDs, most do not. For instance, leds-gpio turns off
> > all LEDs, but leds-pwm does not.
>  >
> > Is the general policy that LEDs should be forced off by the driver when the
> > kernel halts or reboots the CPU? Or left alone and let userspace deal with
> > it?
> 
> I think that this depends on use cases and hardware configurations
> available on the market. People added the callback when they needed it.
> There is no defined policy for this.
> 
> > And should this (in principle) be the same as what happens when a module
> > is unloaded (which currently always turns LEDs off)?
> 
> Turning the LED off on removal is logically justified IMO.

Agreed. I just found the inconsistency is some/most drivers between remove 
and shutdown unexpected. Given that not all LED drivers turn off on shutdown,
(and my use case desires them to turn off, including a leds-pwm instance), 
I'll just write 0 to /sys/class/leds/*/brightness unconditionally in a 
userspace shutdown script.

> >>>     - leds-sn3218 just puts the chip in software-shutdown mode on remove/
> >>>       shutdown. This driver uses the reset register to put the device in
> >>>       poweron state, and software-shutdown is part of the poweron state.
> >>>       Only difference would be if the next code to use the device does
> >>>       not do it's own full initialization (which seems unlikely, or at
> >>>       least unwise), but instead just clears software-shutdown.
> >>
> >> I believe that my above explanations address this question, i.e.
> >> both brightness = 0 an remove/shutdown should set the device
> >> in a power down mode.
> >
> > I think there is some confusion, there are 3 separate controls:
> >   - per-LED PWM duty cycle
> >   - per-LED enable bit
> >   - device-wide shutdown mode
> > Shutdown-mode results in all LEDs going dark (regardless of any other
> > register state), and I think implies that it also uses less power
> > (compared to just turning them all off with either of the other controls).
> > Registers do retain their value and the I2C interface continues to work.
> > I suspect that all it does is turn off an internal oscillator that drives
> > the PWM circuits, but the documentation is not clear.
> >
> > The distinction I was making was that the leds-sn3218 driver *only* turned
> > on the Shutdown-mode, while this driver reset all other registers in the
> > device to their default values as well. Though in practice I don't expect
> > that to make a difference.
> 
> If documentation isn't clear about that, you can always measure current
> consumption in both cases. Note, that this is not required, you can
> follow your intuition.

I may try to do that out of curiosity. 

> >>>>> I won't
> >>>>> clutter this email with a duplicate of the details (it's somewhat long),
> >>>>> but if you could check the cover letter and give some guidance, I would
> >>>>> appreciate it.
> >>>>>
> >>>>> [1] http://www.spinics.net/lists/linux-leds/msg05564.html
> >>>>>        http://thread.gmane.org/gmane.linux.leds/4530
> >>>>>
> >>>>>>
> >>>>>> On 02/23/2016 07:17 PM, David Rivshin (Allworx) wrote:
> >>>>>>> From: David Rivshin <drivshin@allworx.com>
> >>>>>>>
> >>>>>>> The IS31FL32xx family of LED drivers are I2C devices with multiple
> >>>>>>> constant-current channels, each with independent 256-level PWM control.
> >>>>>>>
> >>>>>>> HW Docs: http://www.issi.com/US/product-analog-fxled-driver.shtml
> >>>>>>>
> >>>>>>> This has been tested on the IS31FL3236 and IS31FL3216 on an ARM
> >>>>>>> (TI am335x) platform.
> >>>>>>>
> >>>>>>> The programming paradigm of these devices is similar in the following
> >>>>>>> ways:
> >>>>>>>      - All registers are 8 bit
> >>>>>>>      - All LED control registers are write-only
> >>>>>>>      - Each LED channel has a PWM register (0-255)
> >>>>>>>      - PWM register writes are shadowed until an Update register is poked
> >>>>>>>      - All have a concept of Software Shutdown, which disables output
> >>>>>>>
> >>>>>>> However, there are some differences in devices:
> >>>>>>>      - 3236/3235 have a separate Control register for each LED,
> >>>>>>>        (3218/3216 pack the enable bits into fewer registers)
> >>>>>>>      - 3236/3235 have a per-channel current divisor setting
> >>>>>>>      - 3236/3235 have a Global Control register that can turn off all LEDs
> >>>>>>>      - 3216 is unique in a number of ways
> >>>>>>>         - OUT9-OUT16 can be configured as GPIOs instead of LED controls
> >>>>>>>         - LEDs can be programmed with an 8-frame animation, with
> >>>>>>>           programmable delay between frames
> >>>>>>>         - LEDs can be modulated by an input audio signal
> >>>>>>>         - Max output current can be adjusted from 1/4 to 2x globally
> >>>>>>>         - Has a Configuration register instead of a Shutdown register
> >>>>>>>
> >>>>>>> This driver currently only supports the base PWM control function
> >>>>>>> of these devices. The following features of these devices are not
> >>>>>>> implemented, although it should be possible to add them in the future:
> >>>>>>>      - All devices are capable of going into a lower-power "software
> >>>>>>>        shutdown" mode.
> >>>>>>>      - The is31fl3236 and is31fl3235 can reduce the max output current
> >>>>>>>        per-channel with a divisor of 1, 2, 3, or 4.
> >>>>>>>      - The is31fl3216 can use some LED channels as GPIOs instead.
> >>>>>>>      - The is31fl3216 can animate LEDs in hardware.
> >>>>>>>      - The is31fl3216 can modulate LEDs according to an audio input.
> >>>>>>>      - The is31fl3216 can reduce/increase max output current globally.
> >>>>>>>
> >>>>>>> Signed-off-by: David Rivshin <drivshin@allworx.com>
> >>>>>>> ---
> >>>>>>>      drivers/leds/Kconfig           |   9 +
> >>>>>>>      drivers/leds/Makefile          |   1 +
> >>>>>>>      drivers/leds/leds-is31fl32xx.c | 442 +++++++++++++++++++++++++++++++++++++++++
> >>>>>>>      3 files changed, 452 insertions(+)
> >>>>>>>      create mode 100644 drivers/leds/leds-is31fl32xx.c
> >>>>>>>
> >>>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> >>>>>>> index 1034696..8f6c46f 100644
> >>>>>>> --- a/drivers/leds/Kconfig
> >>>>>>> +++ b/drivers/leds/Kconfig
> >>>>>>> @@ -580,6 +580,15 @@ config LEDS_SN3218
> >>>>>>>      	  This driver can also be built as a module. If so the module
> >>>>>>>      	  will be called leds-sn3218.
> >>>>>>>
> >>>>>>> +config LEDS_IS31FL32XX
> >>>>>>> +	tristate "Driver for ISSI IS31FL32XX I2C LED driver chip family"
> >>>>>>
> >>>>>> 2 x "[Dd]river".
> >>>>>>
> >>>>>> How about:
> >>>>>>
> >>>>>> "LED Support for ISSI IS31FL32XX I2C LED chip family" ?
> >>>>>
> >>>>> Yes, I found that awkward as well. HW folks (and the datasheets) seem
> >>>>> always refer to devices of this type as "LED Driver"s (which can lead
> >>>>> to some interesting confusions). Taking a cue from the LP5521/23/62
> >>>>> entries, how about:
> >>>>>     "LED Support for the ISSI IS31FL32XX I2C LED driver chip family" ?
> >>>>
> >>>> "LED Support" means "LED class driver". Driver is a software support
> >>>> for hardware chip. What discrepancy do you see in the description
> >>>> I proposed?
> >>>
> >>> I think in this case "driver" also means "hardware device which drives
> >>> a physical LED".
> >>
> >> Let's not confuse these notions. From Linux perspective "driver" refers
> >> to a piece of software used for controlling a hardware.
> >>
> >>> It seems that "LED driver" is the term universally used
> >>> to describe this type of HW device in datasheets.
> >>
> >> There are also e.g. "LED controllers", "LED current regulators".
> >> Let's stick to the convention predominantly used in the LED subsystem
> >> kernel config menu.
> >>
> >>> So it seemed useful to
> >>> use exactly that phrase in the description of what hardware this software
> >>> supports. I could see someone interpreting the phrase "LED chip" as
> >>> referring to an actual LED device.
> >>> I don't feel very strongly on this topic, but for the sake of discussion,
> >>> maybe "LED controller" would avoid any possible confusion in both
> >>> directions?
> >>
> >> Right, so let's use the following:
> >>
> >> "LED Support for ISSI IS31FL32XX I2C LED controller family"
> >>
> >> I understand "LED Support" as "Linux LED subsystem support".
> >
> > STGM. Done.
> >
> >>>>> Perhaps that's the best of both worlds?
> >>>>>
> >>>>>>> +	depends on LEDS_CLASS && I2C && OF
> >>>>>>> +	help
> >>>>>>> +	  Say Y here to include support for the ISSI 31FL32XX LED driver family.
> >>>>>>
> >>>>>> s/driver/chip/
> >>>>>>
> >>>>>>> +	  They are I2C devices with multiple constant-current channels, each
> >>>>>>> +	  with independent 256-level PWM control. This will only work with
> >>>>>>> +	  device tree enabled devices.
> >>>>>>
> >>>>>> We can skip the last sentence I think.
> >>>>>
> >>>>> OK. FYI, I think I got that verbiage from LEDS_SYSCON.
> >>>>
> >>>> Having "depends on OF" is self-explanatory here.
> >>>
> >>> Noted.
> >>>
> >>>>>>> +
> >>>>>>>      comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
> >>>>>>>
> >>>>>>>      config LEDS_BLINKM
> >>>>>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> >>>>>>> index 89c9b6f..3fdf313 100644
> >>>>>>> --- a/drivers/leds/Makefile
> >>>>>>> +++ b/drivers/leds/Makefile
> >>>>>>> @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
> >>>>>>>      obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
> >>>>>>>      obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
> >>>>>>>      obj-$(CONFIG_LEDS_SN3218)		+= leds-sn3218.o
> >>>>>>> +obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
> >>>>>>>
> >>>>>>>      # LED SPI Drivers
> >>>>>>>      obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> >>>>>>> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> >>>>>>> new file mode 100644
> >>>>>>> index 0000000..8dea518
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/drivers/leds/leds-is31fl32xx.c
> >>>>>>> @@ -0,0 +1,442 @@
> >>>>>>> +/*
> >>>>>>> + * linux/drivers/leds-is31fl32xx.c
> >>>>>>> + *
> >>>>>>> + * Driver for ISSI IS31FL32xx family of I2C LED controllers
> >>>>>>> + *
> >>>>>>> + * Copyright 2015 Allworx Corp.
> >>>>>>> + *
> >>>>>>> + *
> >>>>>>> + * This program is free software; you can redistribute it and/or modify
> >>>>>>> + * it under the terms of the GNU General Public License version 2 as
> >>>>>>> + * published by the Free Software Foundation.
> >>>>>>> + *
> >>>>>>> + * HW Docs: http://www.issi.com/US/product-analog-fxled-driver.shtml
> >>>>>>> + */
> >>>>>>> +
> >>>>>>> +#include <linux/err.h>
> >>>>>>> +#include <linux/i2c.h>
> >>>>>>> +#include <linux/kernel.h>
> >>>>>>> +#include <linux/leds.h>
> >>>>>>> +#include <linux/module.h>
> >>>>>>> +#include <linux/of_platform.h>
> >>>>>>> +
> >>>>>>> +#ifdef DEBUG
> >>>>>>> + #undef dev_dbg
> >>>>>>> + #define dev_dbg dev_info
> >>>>>>> +#endif
> >>>>>>
> >>>>>> What's the benefit of the above?
> >>>>>
> >>>>> It gave me a way to easily see debug output from the driver while it
> >>>>> was parsing the DT (especially if the driver was built-in). Early on
> >>>>> there were other things within that #ifdef as well.
> >>>>> Regardless, passing ddebug_query on the kernel commandline is a more
> >>>>> appropriate way of accomplishing that; I'll remove for the next version.
> >>>>
> >>>> Thanks.
> >>>>
> >>>>>>> +/* Used to indicate a device has no such register */
> >>>>>>> +#define IS31FL32XX_REG_NONE 0xFF
> >>>>>>> +
> >>>>>>> +#define IS31FL3216_CONFIG_REG 0x00
> >>>>>>> +#define IS31FL3216_LIGHTING_EFFECT_REG 0x03
> >>>>>>> +#define IS31FL3216_CHANNEL_CONFIG_REG 0x04
> >>>>>>> +
> >>>>>>> +struct is31fl32xx_priv;
> >>>>>>> +struct is31fl32xx_led_data {
> >>>>>>> +	struct led_classdev cdev;
> >>>>>>> +	u8 channel; /* 1-based, max priv->cdef->channels */
> >>>>>>> +	struct is31fl32xx_priv *priv;
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +struct is31fl32xx_priv {
> >>>>>>> +	const struct is31fl32xx_chipdef *cdef;
> >>>>>>> +	struct i2c_client *client;
> >>>>>>> +	unsigned int num_leds;
> >>>>>>> +	struct is31fl32xx_led_data leds[0];
> >>>>>>
> >>>>>> Is there any specific reason for not having *leds here instead?
> >>>>>
> >>>>> I followed a pattern from leds-pwm where it did a single allocation
> >>>>> for both priv and priv->leds[]. See sizeof_is31fl32xx_priv(), and
> >>>>> its use, below. I saw the benefit as one fewer small allocation, so
> >>>>> slightly more kind to the allocator (and devres). If you'd prefer to
> >>>>> do it as two allocations, I'll make the change.
> >>>>
> >>>> OK, I had to look at this one more time. I like the idea.
> >>>
> >>> OK, I'll keep it as-is.
> >>>
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +/**
> >>>>>>> + * struct is31fl32xx_chipdef - chip-specific attributes
> >>>>>>> + * @channels            : Number of LED channels
> >>>>>>> + * @shutdown_reg        : address of Shutdown register (optional)
> >>>>>>> + * @pwm_update_reg      : address of PWM Update register
> >>>>>>> + * @global_control_reg	: address of Global Control register (optional)
> >>>>>>> + * @reset_reg           : address of Reset register (optional)
> >>>>>>> + * @pwm_register_base	: address of first PWM register
> >>>>>>> + * @pwm_registers_reversed: : true if PWM registers count down instead of up
> >>>>>>> + * @led_control_register_base : address of first LED control register (optional)
> >>>>>>> + * @enable_bits_per_led_control_register: number of LEDs enable bits in each
> >>>>>>> + * @reset_func:         : pointer to reset function
> >>>>>>> + *
> >>>>>>> + * For all optional register addresses, the sentinel value %IS31FL32XX_REG_NONE
> >>>>>>> + * indicates that this chip has no such register.
> >>>>>>> + *
> >>>>>>> + * If non-NULL, @reset_func will be called during probing to set all
> >>>>>>> + * necessary registers to a known initialization state. This is needed
> >>>>>>> + * for chips that do not have a @reset_reg.
> >>>>>>> + *
> >>>>>>> + * @enable_bits_per_led_control_register must be >=1 if
> >>>>>>> + * @led_control_register_base != %IS31FL32XX_REG_NONE.
> >>>>>>> + */
> >>>>>>> +struct is31fl32xx_chipdef {
> >>>>>>> +	u8	channels;
> >>>>>>> +	u8	shutdown_reg;
> >>>>>>> +	u8	pwm_update_reg;
> >>>>>>> +	u8	global_control_reg;
> >>>>>>> +	u8	reset_reg;
> >>>>>>> +	u8	pwm_register_base;
> >>>>>>> +	bool	pwm_registers_reversed;
> >>>>>>> +	u8	led_control_register_base;
> >>>>>>> +	u8	enable_bits_per_led_control_register;
> >>>>>>> +	int (*reset_func)(struct is31fl32xx_priv *priv);
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +static const struct is31fl32xx_chipdef is31fl3236_cdef = {
> >>>>>>> +	.channels				= 36,
> >>>>>>> +	.shutdown_reg				= 0x00,
> >>>>>>> +	.pwm_update_reg				= 0x25,
> >>>>>>> +	.global_control_reg			= 0x4a,
> >>>>>>> +	.reset_reg				= 0x4f,
> >>>>>>> +	.pwm_register_base			= 0x01,
> >>>>>>> +	.led_control_register_base		= 0x26,
> >>>>>>> +	.enable_bits_per_led_control_register	= 1,
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +static const struct is31fl32xx_chipdef is31fl3235_cdef = {
> >>>>>>> +	.channels				= 28,
> >>>>>>> +	.shutdown_reg				= 0x00,
> >>>>>>> +	.pwm_update_reg				= 0x25,
> >>>>>>> +	.global_control_reg			= 0x4a,
> >>>>>>> +	.reset_reg				= 0x4f,
> >>>>>>> +	.pwm_register_base			= 0x05,
> >>>>>>> +	.led_control_register_base		= 0x2a,
> >>>>>>> +	.enable_bits_per_led_control_register	= 1,
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +static const struct is31fl32xx_chipdef is31fl3218_cdef = {
> >>>>>>> +	.channels				= 18,
> >>>>>>> +	.shutdown_reg				= 0x00,
> >>>>>>> +	.pwm_update_reg				= 0x16,
> >>>>>>> +	.global_control_reg			= IS31FL32XX_REG_NONE,
> >>>>>>> +	.reset_reg				= 0x17,
> >>>>>>> +	.pwm_register_base			= 0x01,
> >>>>>>> +	.led_control_register_base		= 0x13,
> >>>>>>> +	.enable_bits_per_led_control_register	= 6,
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +static int is31fl3216_reset(struct is31fl32xx_priv *priv);
> >>>>>>> +static const struct is31fl32xx_chipdef is31fl3216_cdef = {
> >>>>>>> +	.channels				= 16,
> >>>>>>> +	.shutdown_reg				= IS31FL32XX_REG_NONE,
> >>>>>>> +	.pwm_update_reg				= 0xB0,
> >>>>>>> +	.global_control_reg			= IS31FL32XX_REG_NONE,
> >>>>>>> +	.reset_reg				= IS31FL32XX_REG_NONE,
> >>>>>>> +	.pwm_register_base			= 0x10,
> >>>>>>> +	.pwm_registers_reversed			= true,
> >>>>>>> +	.led_control_register_base		= 0x01,
> >>>>>>> +	.enable_bits_per_led_control_register	= 8,
> >>>>>>> +	.reset_func				= is31fl3216_reset,
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +static int is31fl32xx_write(struct is31fl32xx_priv *priv, u8 reg, u8 val)
> >>>>>>> +{
> >>>>>>> +	int ret;
> >>>>>>> +
> >>>>>>> +	dev_dbg(&priv->client->dev, "writing register 0x%02X=0x%02X", reg, val);
> >>>>>>> +
> >>>>>>> +	ret =  i2c_smbus_write_byte_data(priv->client, reg, val);
> >>>>>>> +	if (ret) {
> >>>>>>> +		dev_err(&priv->client->dev,
> >>>>>>> +			"register write to 0x%02X failed (error %d)",
> >>>>>>> +			reg, ret);
> >>>>>>> +	}
> >>>>>>> +	return ret;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +/*
> >>>>>>> + * Custom reset function for IS31FL3216 because it does not have a RESET
> >>>>>>> + * register the way that the other IS31FL32xx chips do. We don't bother
> >>>>>>> + * writing the GPIO and animation registers, because the registers we
> >>>>>>> + * do write ensure those will have no effect.
> >>>>>>> + */
> >>>>>>> +static int is31fl3216_reset(struct is31fl32xx_priv *priv)
> >>>>>>> +{
> >>>>>>> +	unsigned int i;
> >>>>>>> +	int ret;
> >>>>>>> +
> >>>>>>> +	for (i = 0; i < priv->cdef->channels; i++) {
> >>>>>>> +		ret = is31fl32xx_write(priv, priv->cdef->pwm_register_base+i,
> >>>>>>> +				       0x00);
> >>>>>>> +		if (ret)
> >>>>>>> +			return ret;
> >>>>>>> +	}
> >>>>>>> +	ret = is31fl32xx_write(priv, priv->cdef->pwm_update_reg, 0);
> >>>>>>> +	if (ret)
> >>>>>>> +		return ret;
> >>>>>>> +	ret = is31fl32xx_write(priv, IS31FL3216_LIGHTING_EFFECT_REG, 0x00);
> >>>>>>> +	if (ret)
> >>>>>>> +		return ret;
> >>>>>>> +	ret = is31fl32xx_write(priv, IS31FL3216_CHANNEL_CONFIG_REG, 0x00);
> >>>>>>> +	if (ret)
> >>>>>>> +		return ret;
> >>>>>>> +	ret = is31fl32xx_write(priv, IS31FL3216_CONFIG_REG, 0x00);
> >>>>>>> +	if (ret)
> >>>>>>> +		return ret;
> >>>>>>> +
> >>>>>>> +	return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +
> >>>>>>> +static int is31fl32xx_brightness_set(struct led_classdev *led_cdev,
> >>>>>>> +				     enum led_brightness brightness)
> >>>>>>> +{
> >>>>>>> +	const struct is31fl32xx_led_data *led_data =
> >>>>>>> +		container_of(led_cdev, struct is31fl32xx_led_data, cdev);
> >>>>>>> +	const struct is31fl32xx_chipdef *cdef = led_data->priv->cdef;
> >>>>>>> +	u8 pwm_register_offset;
> >>>>>>> +	int ret;
> >>>>>>> +
> >>>>>>> +	dev_dbg(led_cdev->dev, "%s: %d\n", __func__, brightness);
> >>>>>>> +
> >>>>>>> +	/* NOTE: led_data->channel is 1-based */
> >>>>>>> +	if (cdef->pwm_registers_reversed)
> >>>>>>> +		pwm_register_offset = cdef->channels - led_data->channel;
> >>>>>>> +	else
> >>>>>>> +		pwm_register_offset = led_data->channel - 1;
> >>>>>>> +
> >>>>>>> +	ret = is31fl32xx_write(led_data->priv,
> >>>>>>> +			       cdef->pwm_register_base + pwm_register_offset,
> >>>>>>> +			       brightness);
> >>>>>>> +	if (ret)
> >>>>>>> +		return ret;
> >>>>>>
> >>>>>> I infer that nothing wrong happens in case current process is preempted
> >>>>>> here by the call originating from the other sub-LED?
> >>>>>
> >>>>> I do not believe so. All the driver-specific data used here is read-only
> >>>>> after probing. chipdefs are entirely const, and the only thing in priv
> >>>>> that's referenced is the chipdef pointer which logically could not change
> >>>>> post-probe. Actually nothing else in priv is modified post-probe either.
> >>>>>
> >>>>> The I2C core code has a mutex on the bus, so two writes cannot happen at
> >>>>> once.
> >>>>>
> >>>>> In all these devices there is a unique PWM duty-cycle register for each
> >>>>> LED channel (which is what is being written here), so no register writes
> >>>>> for one LED channel effect any others.
> >>>>>
> >>>>> I believe the worst that could happen is that the device would see:
> >>>>> 	PWM_REG_A write X
> >>>>> 	PWM_REG_B write Y
> >>>>> 	UPDATE_REG write 0
> >>>>> 	UPDATE_REG write 0
> >>>>> instead of
> >>>>> 	PWM_REG_A write X
> >>>>> 	UPDATE_REG write 0
> >>>>> 	PWM_REG_B write Y
> >>>>> 	UPDATE_REG write 0
> >>>>> but that makes no difference to the functionality. Poking the update
> >>>>> register merely applies all PWM register writes up to that point (I'm
> >>>>> assuming to allow atomically changing the state of multiple LEDs at
> >>>>> once).
> >>>>
> >>>> Thanks for this comprehensive explanation.
> >>>
> >>> Should I put some part of this explanation in a comment somewhere? Seems
> >>> like the kind of thing someone else might wonder about in the future also.
> >>
> >> Good idea.
> >
> > Done.
> >
> >>>>> I should note here (as mentioned in cover letter), I made a choice to
> >>>>> always leave the per-LED "enable" bits on, and let the PWM just get set
> >>>>> to 0 naturally to turn an LED off. This differs from the existing SN3218
> >>>>> driver, which used regmap_update_bits, and is then protected by a per-
> >>>>> regmap mutex.
> >>>>
> >>>> ack.
> >>>>
> >>>>>>> +	return is31fl32xx_write(led_data->priv, cdef->pwm_update_reg, 0);
> >>>>>>> +
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
> >>>>>>> +{
> >>>>>>> +	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> >>>>>>> +	int ret;
> >>>>>>> +
> >>>>>>> +	if (cdef->reset_reg != IS31FL32XX_REG_NONE) {
> >>>>>>> +		ret = is31fl32xx_write(priv, cdef->reset_reg, 0);
> >>>>>>> +		if (ret)
> >>>>>>> +			return ret;
> >>>>>>> +	}
> >>>>>>> +	if (cdef->reset_func) {
> >>>>>>> +		ret = cdef->reset_func(priv);
> >>>>>>> +		if (ret)
> >>>>>>> +			return ret;
> >>>>>>> +	}
> >>>>>>> +	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
> >>>>>>> +		u8 value =
> >>>>>>> +		    GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
> >>>>>>> +		u8 num_regs = cdef->channels /
> >>>>>>> +				cdef->enable_bits_per_led_control_register;
> >>>>>>> +		int i;
> >>>>>>> +
> >>>>>>> +		for (i = 0; i < num_regs; i++) {
> >>>>>>> +			ret = is31fl32xx_write(priv,
> >>>>>>> +					       cdef->led_control_register_base+i,
> >>>>>>> +					       value);
> >>>>>>> +			if (ret)
> >>>>>>> +				return ret;
> >>>>>>> +		}
> >>>>>>> +	}
> >>>>>>> +	if (cdef->shutdown_reg != IS31FL32XX_REG_NONE) {
> >>>>>>> +		ret = is31fl32xx_write(priv, cdef->shutdown_reg, BIT(0));
> >>>>>>> +		if (ret)
> >>>>>>> +			return ret;
> >>>>>>> +	}
> >>>>>>> +	if (cdef->global_control_reg != IS31FL32XX_REG_NONE) {
> >>>>>>> +		ret = is31fl32xx_write(priv, cdef->global_control_reg, 0x00);
> >>>>>>> +		if (ret)
> >>>>>>> +			return ret;
> >>>>>>> +	}
> >>>>>>> +
> >>>>>>> +	return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static inline size_t sizeof_is31fl32xx_priv(int num_leds)
> >>>>>>> +{
> >>>>>>> +	return sizeof(struct is31fl32xx_priv) +
> >>>>>>> +		      (sizeof(struct is31fl32xx_led_data) * num_leds);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static int is31fl32xx_parse_child_dt(const struct device *dev,
> >>>>>>> +				     const struct device_node *child,
> >>>>>>> +				     struct is31fl32xx_led_data *led_data)
> >>>>>>> +{
> >>>>>>> +	struct led_classdev *cdev = &led_data->cdev;
> >>>>>>> +	int ret = 0;
> >>>>>>> +	u32 reg;
> >>>>>>> +
> >>>>>>> +	cdev->name = of_get_property(child, "label", NULL) ? : child->name;
> >>>>>>> +
> >>>>>>> +	ret = of_property_read_u32(child, "reg", &reg);
> >>>>>>> +	if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
> >>>>>>> +		dev_err(dev,
> >>>>>>> +			"Child node %s does not have a valid reg property\n",
> >>>>>>> +			child->name);
> >>>>>>> +		return -EINVAL;
> >>>>>>> +	}
> >>>>>>> +	led_data->channel = reg;
> >>>>>>> +
> >>>>>>> +	cdev->default_trigger = of_get_property(child, "linux,default-trigger",
> >>>>>>> +						NULL);
> >>>>>>> +	cdev->brightness = LED_OFF;
> >>>>>>
> >>>>>> devm_kzalloc secures that.
> >>>>>
> >>>>> OK, I will remove.
> >>>>>
> >>>>>>> +	ret = of_property_read_u32(child, "max-brightness",
> >>>>>>> +				   &cdev->max_brightness);
> >>>>>>> +	if (ret == -EINVAL) {
> >>>>>>> +		cdev->max_brightness = 255;
> >>>>>>
> >>>>>> s/255/LED_FULL/
> >>>>>
> >>>>> Noted, although (from the patch 2 discussion) max-brightness property is
> >>>>> removed/replaced, this would go away anyways.
> >>>>>
> >>>>>>> +	} else if (ret) {
> >>>>>>> +		dev_dbg(dev,
> >>>>>>> +			"Child node %s has an invalid max-brightness property\n",
> >>>>>>> +			child->name);
> >>>>>>> +		return -EINVAL;
> >>>>>>> +	}
> >>>>>>> +
> >>>>>>> +	cdev->brightness_set_blocking = is31fl32xx_brightness_set;
> >>>>>>
> >>>>>> Please add empty line here.
> >>>>>
> >>>>> Done.
> >>>>>
> >>>>>>> +	return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
> >>>>>>> +					struct is31fl32xx_priv *priv,
> >>>>>>> +					u8 channel)
> >>>>>>> +{
> >>>>>>> +	size_t i;
> >>>>>>> +
> >>>>>>> +	for (i = 0; i < priv->num_leds; i++) {
> >>>>>>> +		if (priv->leds[i].channel == channel)
> >>>>>>> +			return &priv->leds[i];
> >>>>>>> +	}
> >>>>>>
> >>>>>> Ditto.
> >>>>>
> >>>>> Done.
> >>>>>
> >>>>>>> +	return NULL;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static int is31fl32xx_parse_dt(struct device *dev,
> >>>>>>> +			       struct is31fl32xx_priv *priv)
> >>>>>>> +{
> >>>>>>> +	struct device_node *child;
> >>>>>>> +
> >>>>>>> +	for_each_child_of_node(dev->of_node, child) {
> >>>>>>> +		struct is31fl32xx_led_data *led_data =
> >>>>>>> +			&priv->leds[priv->num_leds];
> >>>>>>> +		int ret = 0;
> >>>>>>> +		const struct is31fl32xx_led_data *other_led_data;
> >>>>>>> +
> >>>>>>> +		led_data->priv = priv;
> >>>>>>> +
> >>>>>>> +		ret = is31fl32xx_parse_child_dt(dev, child, led_data);
> >>>>>>> +		if (ret)
> >>>>>>> +			continue;
> >>>>>>
> >>>>>> I prefer failing in such cases,
> >>>>>
> >>>>> OK, I will change to an 'goto err' which will have an 'of_node_put()'
> >>>>> and 'return ret'.
> >>>>>
> >>>>> I will say, however, that while testing the error-detection in the
> >>>>> parsing logic, it was very convenient to construct a single devicetree
> >>>>> with a variety of errors. Then a single boot would test multiple
> >>>>> cases at once.
> >>>>
> >>>> Good idea for testing, but in case some failure occurs during DT child
> >>>> node parsing in the release environment you're left with unused
> >>>> allocated memory.
> >>>
> >>> Agreed. BTW, I assume from this that it's common to say "if there's
> >>> anything wrong in one part of your DT, there is no guarantee as to what
> >>> parts will actually be used"? I say this because what we're saying is that
> >>> if one LED node on this device is faulty, that all of them are ignored.
> >>> Analogy might be to a whole I2C bus being ignored because one of the
> >>> devices on it failed to probe. To the devicetree it's still a parent/child
> >>> bus/address relationship, even though the driver implementation is
> >>> very different.
> >>
> >> I2C example is too generic I think. I2C controller is not as tightly
> >> coupled with I2C clients as LED controller with its current outputs.
> >> Besides, I2C controller doesn't have an idea what devices will attach
> >> to the bus it controls upon probing, contrarily to a LED controller.
> >
> > OK. I realize that in code there is a large distinction in these cases,
> > but I wasn't sure if that would be reflected in how errors in parsing
> > the devicetree should handled. Sounds like there is at least a de-facto
> > distinction between "a device and its children" and "a bus and its
> > children".
> >
> >>>>>>> +
> >>>>>>> +		/* Detect if channel is already in use by another child */
> >>>>>>> +		other_led_data = is31fl32xx_find_led_data(priv,
> >>>>>>> +							  led_data->channel);
> >>>>>>> +		if (other_led_data) {
> >>>>>>> +			dev_err(dev,
> >>>>>>> +				"%s ignored: channel %d already used by %s",
> >>>>>>> +				led_data->cdev.name,
> >>>>>>> +				led_data->channel,
> >>>>>>> +				other_led_data->cdev.name);
> >>>>>>> +			continue;
> >>>>>>
> >>>>>> Ditto.
> >>>>>
> >>>>> OK.
> >>>>>
> >>>>>>> +		}
> >>>>>>> +
> >>>>>>> +		ret = devm_led_classdev_register(dev, &led_data->cdev);
> >>>>>>> +		if (ret == 0) {
> >>>>>>> +			priv->num_leds++;
> >>>>>>> +		} else {
> >>>>>>> +			dev_err(dev, "failed to register PWM led for %s: %d\n",
> >>>>>>> +				led_data->cdev.name, ret);
> >>>>>
> >>>>> Should I also fail here, then? Right now it will continue trying to
> >>>>> register future LED devices if a classdev_register fails for some
> >>>>> reason, and will successfully load even if all of them fail.
> >>>>
> >>>> Please fail here too. If we can't setup the sub-LED that is advertised
> >>>> in a DT child node, then it means that something went wrong.
> >>>> This is clear error case.
> >>>
> >>> Done.
> >>>
> >>>>>>> +		}
> >>>>>>> +	}
> >>>>>>> +
> >>>>>>> +	return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static const struct of_device_id of_is31fl31xx_match[] = {
> >>>>>>> +	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
> >>>>>>> +	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
> >>>>>>> +	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
> >>>>>>> +	{ .compatible = "issi,is31fl3216", .data = &is31fl3216_cdef, },
> >>>>>>> +	{},
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +MODULE_DEVICE_TABLE(of, of_is31fl31xx_match);
> >>>>>>> +
> >>>>>>> +static int is31fl32xx_probe(struct i2c_client *client,
> >>>>>>> +				  const struct i2c_device_id *id)
> >>>>>>> +{
> >>>>>>> +	const struct is31fl32xx_chipdef *cdef;
> >>>>>>> +	const struct of_device_id *of_dev_id;
> >>>>>>> +	struct device *dev = &client->dev;
> >>>>>>> +	struct is31fl32xx_priv *priv;
> >>>>>>> +	int count;
> >>>>>>> +	int ret = 0;
> >>>>>>> +
> >>>>>>> +	of_dev_id = of_match_device(of_is31fl31xx_match, dev);
> >>>>>>> +	if (!of_dev_id)
> >>>>>>> +		return -EINVAL;
> >>>>>>> +
> >>>>>>> +	cdef = of_dev_id->data;
> >>>>>>> +
> >>>>>>> +	count = of_get_child_count(dev->of_node);
> >>>>>>> +	if (!count)
> >>>>>>> +		return -EINVAL;
> >>>>>>> +
> >>>>>>> +	priv = devm_kzalloc(dev, sizeof_is31fl32xx_priv(count),
> >>>>>>> +			    GFP_KERNEL);
> >>>>>>> +	if (!priv)
> >>>>>>> +		return -ENOMEM;
> >>>>>>> +
> >>>>>>> +	priv->client = client;
> >>>>>>> +	priv->cdef = cdef;
> >>>>>>> +	i2c_set_clientdata(client, priv);
> >>>>>>> +
> >>>>>>> +	ret = is31fl32xx_init_regs(priv);
> >>>>>>> +	if (ret)
> >>>>>>> +		return ret;
> >>>>>>> +
> >>>>>>> +	ret = is31fl32xx_parse_dt(dev, priv);
> >>>>>>> +	if (ret)
> >>>>>>> +		return ret;
> >>>>>>> +
> >>>>>>> +	return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static int is31fl32xx_remove(struct i2c_client *client)
> >>>>>>> +{
> >>>>>>> +	struct is31fl32xx_priv *priv = i2c_get_clientdata(client);
> >>>>>>> +
> >>>>>>> +	/* If there is a reset reg, then it does everything we need */
> >>>>>>> +	if (priv->cdef->reset_reg != IS31FL32XX_REG_NONE)
> >>>>>>> +		return is31fl32xx_write(priv, priv->cdef->reset_reg, 0);
> >>>>>>> +
> >>>>>>> +	/* If there is a reset func, then it does everything we need */
> >>>>>>> +	if (priv->cdef->reset_func)
> >>>>>>> +		return priv->cdef->reset_func(priv);
> >>>>>>> +
> >>>>>>> +	/* If we can't reset, then try just using software-shutdown mode */
> >>>>>>> +	if (priv->cdef->shutdown_reg != IS31FL32XX_REG_NONE)
> >>>>>>> +		return is31fl32xx_write(priv, priv->cdef->shutdown_reg, 0x00);
> >>>>>>> +
> >>>>>>> +	return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +/*
> >>>>>>> + * i2c-core requires that id_table be non-NULL, even though
> >>>>>>> + * it is not used for DeviceTree based instantiation.
> >>>>>>> + */
> >>>>>>> +static const struct i2c_device_id is31fl31xx_id[] = {
> >>>>>>> +	{},
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +MODULE_DEVICE_TABLE(i2c, is31fl31xx_id);
> >>>>>>> +
> >>>>>>> +static struct i2c_driver is31fl32xx_driver = {
> >>>>>>> +	.driver = {
> >>>>>>> +		.name	= "is31fl32xx",
> >>>>>>> +		.of_match_table = of_is31fl31xx_match,
> >>>>>>> +	},
> >>>>>>> +	.probe		= is31fl32xx_probe,
> >>>>>>> +	.remove		= is31fl32xx_remove,
> >>>>>>> +	.id_table	= is31fl31xx_id,
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +module_i2c_driver(is31fl32xx_driver);
> >>>>>>> +
> >>>>>>> +MODULE_AUTHOR("David Rivshin <drivshin@allworx.com>");
> >>>>>>> +MODULE_DESCRIPTION("ISSI IS31FL32xx LED driver");
> >>>>>>> +MODULE_LICENSE("GPL v2");
> >>>>>>>
