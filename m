From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Fix platform data in leds-pca955x.c
Date: Wed, 4 Jul 2018 20:00:48 +0300
Message-ID: <CAHp75Vc+2rjFcLfuV5ao0eGmz2aF4jRS_YTZQTaRx=45sOSFOw@mail.gmail.com>
References: <62fb47ea-9296-139b-1eeb-28ddc5826091@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <62fb47ea-9296-139b-1eeb-28ddc5826091@landley.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: clg@kaod.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Andrew Jeffery <andrew@aj.id.au>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Jul 4, 2018 at 3:46 AM, Rob Landley <rob@landley.net> wrote:
> I have some questions about recent changes to leds-pca955x.c since 4.13:
>
> How is non-of platform data supposed to work now? Commit ed1f4b9676a8 switched
> struct led_platform_data *pdata in the _probe() function to a locally defined
> structure that platform data can't provide because it's not in any header it
> can #include.
>
> This is disguised by dev_get_platdata() returning a void * so changing the type
> of pdata the returned pointer is assigned to didn't require a new typecast,
> instead existing board definitions still compile but quietly break at runtime.
> (Specifically the SH7760 board I use at work broke in the pdata->num_leds !=
> chip->bits sanity check, and then userpace sees an empty /sys/class/leds and I
> started start digging because "huh"?)
>
> Why did the type change, anyway? The generic led_platform_data it was
> using before has all the fields the device tree's actually initializing, at
> least if you use flags for the new gpio stuff.
>
> Commit 561099a1a2e9 added CONFIG_LEDS_PCA955X_GPIO, but the initialization
> code adds gpio logic outside this config symbol: probe only calls
> devm_led_classdev_register() within a case statement that depends on setting the
> right "this is not GPIO" value.
>
> The "GPIO" indicator could have been a flag in the existing LED structure's
> flags field, but instead of a bit it's #defining three symbols. The
> PCA955X_TYPE_* macros with the new type constants only exist in the device tree
> header. Strangely, the old default "this is an LED" value isn't zero, zero is
> PCA955X_TYPE_NONE which is unused (never set anywhere in the tree), and would
> cause the LED to be skipped: you have to set a field platform data can't
> access, using a macro platform data probably doesn't have, in order for
> devm_led_classdev_register() to get called on that LED at all. Why?
>
> This is especially odd since if you did want to skip an LED, there was already a
> way to indicate that: by giving it an empty string as a name. (It doesn't seem
> to have come up, but it's the obvious way to do it.) Except commit 390c97dc6e34
> deals with that by writing the index number as a string to the platform data
> struct. Leaving aside "why did you do that?", isn't the platform data supposed to
> be in a read only section when it's actual platform data? And since the probe
> function then immediately copies the data into the another structure, can't we
> just fill out the other one directly without overwriting our arguments?
>
> As for the lifetime rules, the local pca955x_led (writeable copy initialized from
> the read-only platform data) had the name[] array locally living in the
> struct, but the device tree commits added char *default_trigger pointing to
> external memory. Is there a reason this is now inconsistent?
>
> Here's the patch I whipped up at work today (applied to v4.14) that undid enough
> of this to make the driver work again with platform data on the board we ship:

No platform data, please.

So, we have two options here:
- use Unified Device Properties API
- introduce something like LED_LOOKUP_TABLE (see analogue with GPIO /
regulator / PWM)

Looking at the platform data LED framework provides I don't see for
now a necessity of creating lookup tables (though it might be better
choice in long term).

For now, you can switch to unified device properties API (basically
un-ifdef pca955x_pdata_of_init() and replacing of_* by device_* or
fwnode_* compatible calls) and providing a static table of built-in
device properties in the platform code in question.
(see include/linux/property.h, for example users of
PROPERTY_ENTRY_U*() macros, like arch/arm/mach-pxa/raumfeld.c)


-- 
With Best Regards,
Andy Shevchenko
