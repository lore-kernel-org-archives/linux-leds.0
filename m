From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash
 class extension
Date: Wed, 11 Feb 2015 22:57:24 +0100
Message-ID: <20150211215723.GC11313@amd>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55115 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753990AbbBKV50 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 11 Feb 2015 16:57:26 -0500
Content-Disposition: inline
In-Reply-To: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com

On Thu 2015-02-05 09:42:53, Jacek Anaszewski wrote:
> The documentation being added contains overall description of the
> LED Flash Class and the related sysfs attributes.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
>  Documentation/leds/leds-class-flash.txt |   63 +++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/leds/leds-class-flash.txt
> 
> diff --git a/Documentation/leds/leds-class-flash.txt b/Documentation/leds/leds-class-flash.txt
> new file mode 100644
> index 0000000..16c6187
> --- /dev/null
> +++ b/Documentation/leds/leds-class-flash.txt
> @@ -0,0 +1,63 @@
> +
> +Flash LED handling under Linux
> +==============================
> +
> +Some LED devices support two modes - torch and flash. In the LED subsystem
> +those modes are supported by LED class (see Documentation/leds/leds-class.txt)
> +and LED Flash class respectively. The torch mode related features are enabled
> +by default and the flash ones only if a driver declares it by setting
> +LED_DEV_CAP_FLASH flag.
> +
> +In order to enable support for flash LEDs CONFIG_LEDS_CLASS_FLASH symbol
> +must be defined in the kernel config. A flash LED driver must register
> +in the LED subsystem with led_classdev_flash_register function to gain flash
> +related capabilities.
> +
> +There are flash LED devices which can control more than one LED and allow for
> +strobing the sub-LEDs synchronously. A LED will be strobed synchronously with
> +the one whose identifier is written to the flash_sync_strobe sysfs attribute.
> +The list of available sub-LED identifiers can be read from the available_sync_leds
> +sysfs attribute. In order to enable the related settings the driver must set
> +LED_DEV_CAP_SYNC_STROBE flag.
> +
> +Following sysfs attributes are exposed for controlling flash LED devices:
> +
> +	- flash_brightness - flash LED brightness in microamperes (RW)
> +	- max_flash_brightness - maximum available flash LED brightness (RO)

in microamperes

> +	- flash_timeout - flash strobe duration in microseconds (RW)
> +	- max_flash_timeout - maximum available flash strobe duration
> (RO)

in microseconds

> +	- flash_strobe - flash strobe state (RW)

This is integer..?

> +	- available_sync_leds - list of sub-LEDs available for flash strobe
> +				synchronization (RO)

"space separated"?

So this will say something like "0 3 5"

> +	- flash_sync_strobe - identifier of the sub-LED to synchronize the flash
> +			      strobe with; 0 stands for no synchronization (RW)

...and it means that I can put 0, 3 or 5 into this file?

> +	- flash_fault - list of flash faults that may have occurred:

"space separated"?

> +		* led-over-voltage - flash controller voltage to the flash LED
> +			has exceededthe limit specific to the flash controller
> +		* flash-timeout-exceeded - the flash strobe was still on when
> +			the timeout set by the user has expired; not all flash
> +			controllers may set this in all such conditions
> +		* controller-over-temperature - the flash controller has
> +			overheated
> +		* controller-short-circuit - the short circuit protection
> +			of the flash controller has been triggered
> +		* led-power-supply-over-current - current in the LED power
> +			supply has exceeded the limit specific to the flash
> +			controller
> +		* indicator-led-fault - the flash controller has detected
> +			a short or open circuit condition on the indicator LED
> +		* led-under-voltage - flash controller voltage to the flash
> +			LED has been below the minimum limit specific to
> +			the flash
> +		* controller-under-voltage - the input voltage of the flash
> +			controller is below the limit under which strobing the
> +			flash at full current will not be possible;
> +			the condition persists until this flag is no longer set
> +		* led-over-temperature - the temperature of the LED has exceeded
> +			its allowed upper limit
> +
> +		Flash faults should be read in the strobe_set callback, right
> +		after the instruction initiating the strobe. If a flash LED

Ok, so this is part sysfs documentation, part kernel class
documentation... it is a bit confusing.

Best regards,
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
