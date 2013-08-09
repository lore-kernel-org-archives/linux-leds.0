From: Ian Pilcher <arequipeno@gmail.com>
Subject: Re: Registering GPIO LEDs
Date: Thu, 08 Aug 2013 22:51:49 -0500
Message-ID: <52046755.7010602@gmail.com>
References: <ktuj0g$qci$1@ger.gmane.org> <A874F61F95741C4A9BA573A70FE3998F82E868B9@DQHE06.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:64496 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758253Ab3HIDvx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Aug 2013 23:51:53 -0400
Received: by mail-ob0-f181.google.com with SMTP id dn14so6057347obc.12
        for <linux-leds@vger.kernel.org>; Thu, 08 Aug 2013 20:51:52 -0700 (PDT)
In-Reply-To: <A874F61F95741C4A9BA573A70FE3998F82E868B9@DQHE06.ent.ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Kim, Milo" <Milo.Kim@ti.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On 08/08/2013 09:08 PM, Kim, Milo wrote:
> From the viewpoint of a GPIO consumer, we don't care the base GPIO number.
> That is required when a GPIO controller is added.
> Just check '/sys/kernel/debug/gpio' and use available GPIOs for LEDs.

Hmm.  I'm using leds-gpio, and it certainly does seem to care about GPIO
numbers.  As a point of reference, here's what I'm doing to set up my
drive activity LEDs:

#define N5550_ICH_GPIO_BASE     195

#define N5550_DISK_ACT_0_GPIO   (N5550_ICH_GPIO_BASE + 0)
#define N5550_DISK_ACT_1_GPIO   (N5550_ICH_GPIO_BASE + 2)
#define N5550_DISK_ACT_2_GPIO   (N5550_ICH_GPIO_BASE + 3)
#define N5550_DISK_ACT_3_GPIO   (N5550_ICH_GPIO_BASE + 4)
#define N5550_DISK_ACT_4_GPIO   (N5550_ICH_GPIO_BASE + 5)

static struct gpio_led n5550_disk_act_leds[5] = {
        {
                .name                   = "n5550:green:disk-act-0",
                .default_trigger        = "thecus-ahci-0",
                .gpio                   = N5550_DISK_ACT_0_GPIO,
                .active_low             = 1,
                .default_state          = LEDS_GPIO_DEFSTATE_OFF,
        },
        {
                .name                   = "n5550:green:disk-act-1",
                .default_trigger        = "thecus-ahci-1",
                .gpio                   = N5550_DISK_ACT_1_GPIO,
                .active_low             = 1,
                .default_state          = LEDS_GPIO_DEFSTATE_OFF,
        },
        {
                .name                   = "n5550:green:disk-act-2",
                .default_trigger        = "thecus-ahci-2",
                .gpio                   = N5550_DISK_ACT_2_GPIO,
                .active_low             = 1,
                .default_state          = LEDS_GPIO_DEFSTATE_OFF,
        },
        {
                .name                   = "n5550:green:disk-act-3",
                .default_trigger        = "thecus-ahci-3",
                .gpio                   = N5550_DISK_ACT_3_GPIO,
                .active_low             = 1,
                .default_state          = LEDS_GPIO_DEFSTATE_OFF,
        },
        {
                .name                   = "n5550:green:disk-act-4",
                .default_trigger        = "thecus-ahci-4",
                .gpio                   = N5550_DISK_ACT_4_GPIO,
                .active_low             = 1,
                .default_state          = LEDS_GPIO_DEFSTATE_OFF,
        },
};

As you can see, every LED has a GPIO number (.gpio), which comes from
the chip's GPIO base, and that number gets hardcoded into the setup
code.  If the ich_gpio driver ever "dynamically" selects a base other
than 195, the LEDs won't work.

I just seems very fragile, and I can't help thinking that there must be
a better way.  Maybe a module parameter ...

Thanks!

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
Sometimes there's nothing left to do but crash and burn...or die trying.
========================================================================
