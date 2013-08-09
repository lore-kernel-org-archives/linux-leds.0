From: "Kim, Milo" <Milo.Kim@ti.com>
Subject: RE: Registering GPIO LEDs
Date: Fri, 9 Aug 2013 05:26:30 +0000
Message-ID: <A874F61F95741C4A9BA573A70FE3998F82E86950@DQHE06.ent.ti.com>
References: <ktuj0g$qci$1@ger.gmane.org>
 <A874F61F95741C4A9BA573A70FE3998F82E868B9@DQHE06.ent.ti.com>
 <52046755.7010602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:50576 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932676Ab3HIF0g convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 9 Aug 2013 01:26:36 -0400
In-Reply-To: <52046755.7010602@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ian Pilcher <arequipeno@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

> > From the viewpoint of a GPIO consumer, we don't care the base GPIO number.
> > That is required when a GPIO controller is added.
> > Just check '/sys/kernel/debug/gpio' and use available GPIOs for LEDs.
> 
> Hmm.  I'm using leds-gpio, and it certainly does seem to care about GPIO
> numbers.  As a point of reference, here's what I'm doing to set up my
> drive activity LEDs:
> 
> #define N5550_ICH_GPIO_BASE     195
> 
> #define N5550_DISK_ACT_0_GPIO   (N5550_ICH_GPIO_BASE + 0)
> #define N5550_DISK_ACT_1_GPIO   (N5550_ICH_GPIO_BASE + 2)
> #define N5550_DISK_ACT_2_GPIO   (N5550_ICH_GPIO_BASE + 3)
> #define N5550_DISK_ACT_3_GPIO   (N5550_ICH_GPIO_BASE + 4)
> #define N5550_DISK_ACT_4_GPIO   (N5550_ICH_GPIO_BASE + 5)
> 
> static struct gpio_led n5550_disk_act_leds[5] = {
>         {
>                 .name                   = "n5550:green:disk-act-0",
>                 .default_trigger        = "thecus-ahci-0",
>                 .gpio                   = N5550_DISK_ACT_0_GPIO,
>                 .active_low             = 1,
>                 .default_state          = LEDS_GPIO_DEFSTATE_OFF,
>         },
>         {
>                 .name                   = "n5550:green:disk-act-1",
>                 .default_trigger        = "thecus-ahci-1",
>                 .gpio                   = N5550_DISK_ACT_1_GPIO,
>                 .active_low             = 1,
>                 .default_state          = LEDS_GPIO_DEFSTATE_OFF,
>         },
>         {
>                 .name                   = "n5550:green:disk-act-2",
>                 .default_trigger        = "thecus-ahci-2",
>                 .gpio                   = N5550_DISK_ACT_2_GPIO,
>                 .active_low             = 1,
>                 .default_state          = LEDS_GPIO_DEFSTATE_OFF,
>         },
>         {
>                 .name                   = "n5550:green:disk-act-3",
>                 .default_trigger        = "thecus-ahci-3",
>                 .gpio                   = N5550_DISK_ACT_3_GPIO,
>                 .active_low             = 1,
>                 .default_state          = LEDS_GPIO_DEFSTATE_OFF,
>         },
>         {
>                 .name                   = "n5550:green:disk-act-4",
>                 .default_trigger        = "thecus-ahci-4",
>                 .gpio                   = N5550_DISK_ACT_4_GPIO,
>                 .active_low             = 1,
>                 .default_state          = LEDS_GPIO_DEFSTATE_OFF,
>         },
> };
> 
> As you can see, every LED has a GPIO number (.gpio), which comes from
> the chip's GPIO base, and that number gets hardcoded into the setup
> code.  If the ich_gpio driver ever "dynamically" selects a base other
> than 195, the LEDs won't work.

It sounds you want to make the LED platform data flexible, right?

> I just seems very fragile, and I can't help thinking that there must be
> a better way.  Maybe a module parameter ...

If you can use .dtb file in your system, it may be possible to use just offset
values with GPIO controller, ich_gpio. Then, no hardcoded GPIO is required.

For example, leds-gpio can be created with the DT below.

leds {
	compatible = "gpio-leds";
	hdd0 {
		label = " n5550:green:disk-act-0";
		gpios = <&ich_gpio 0 1>; /* offset 0, active low */
		linux,default-trigger = " thecus-ahci-0";
		default-state = "off";
	};

	.
	.
	.

	hdd4 {
		label = " n5550:green:disk-act-4";
		gpios = <&ich_gpio 4 1>; /* offset 4, active low */
		linux,default-trigger = " thecus-ahci-4";
		default-state = "off";
	};
};

Then, we don't care the base number of the ich_gpio controller.

However, ich_gpio driver should support the GPIO DT structure.
I've not checked it yet.

Best regards,
Milo

