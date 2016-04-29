From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Extend the LED panic trigger
Date: Fri, 29 Apr 2016 20:57:22 +0200
Message-ID: <5723AE92.8020203@gmail.com>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461881020-13964-1-git-send-email-ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org



On 29/04/16 00:03, Ezequiel Garcia wrote:
> As per commit 916fe619951f ("leds: trigger: Introduce a kernel
> panic LED trigger"), the kernel now supports a new LED trigger
> to hook on the panic blink.
>
> However, the only way of using this is to dedicate a LED device,
> making it rather useless.
>
> To overcome this limitation, the present series introduces the
> capability to switch the LED trigger of certain LED devices upon
> a kernel panic (using the panic notifier).
>
> The decision of which LEDs should be switched to the panic trigger
> is left to each LED device driver. As an example, a devicetree
> boolean property is introduced and used in the leds-gpio driver.
>
> The big change in this v3 is that I've moved the panic trigger
> switching away from the core code and it's now part of
> ledtrig-panic.c. Pavel, Jacek: How does it look?
>
> Changes from v2:
>
>    * Added Rob's "panic-indicator" devicetree property Acked-by.
>
>    * Fix typo, as pointed out by Robin Murphy.
>
>    * Documented "panic-indicator" in bindings/leds/leds-gpio.txt.
>
>    * Moved the panic trigger switching from the trigger core code,
>      to ledtrig-panic.c.
>
> Changes from v1:
>
>    * Dropped the led_trigger_event_nosleep API, and instead just
>      clear the blink_delay_{on, off} when the panic is notified.
>      This results in less changes.
>
>    * Changed the flag to LED_PANIC_INDICATOR, as requested by Jacek.
>
>    * Changed the firmware property name to "panic-indicator", as
>      requested by Jacek.
>
> Ezequiel Garcia (3):
>    leds: triggers: Allow to switch the trigger to "panic" on a kernel
>      panic
>    devicetree: leds: Introduce "panic-indicator" optional property
>    leds: gpio: Support the "panic-indicator" firmware property
>
>   Documentation/devicetree/bindings/leds/common.txt  |  3 ++
>   .../devicetree/bindings/leds/leds-gpio.txt         |  2 +
>   drivers/leds/led-triggers.c                        |  2 +-
>   drivers/leds/leds-gpio.c                           |  4 ++
>   drivers/leds/leds.h                                |  1 +
>   drivers/leds/trigger/Kconfig                       |  3 ++
>   drivers/leds/trigger/ledtrig-panic.c               | 47 ++++++++++++++++++++++
>   include/linux/leds.h                               |  2 +
>   8 files changed, 63 insertions(+), 1 deletion(-)
>

Looks good to me.

Reviewed-by: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
