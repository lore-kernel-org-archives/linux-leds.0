From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash
 class extension
Date: Fri, 6 Feb 2015 10:48:47 -0800
Message-ID: <CAK5ve-KVQRN-quf9+Uh5HcN_Kh21Hs+2B93zC=ONQaG18k9oUA@mail.gmail.com>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:36623 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758236AbbBFStI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 6 Feb 2015 13:49:08 -0500
Received: by iecat20 with SMTP id at20so3500772iec.3
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2015 10:49:08 -0800 (PST)
In-Reply-To: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Pavel Machek <pavel@ucw.cz>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>, Sylwester Nawrocki <s.nawrocki@samsung.com>

On Thu, Feb 5, 2015 at 12:42 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> The documentation being added contains overall description of the
> LED Flash Class and the related sysfs attributes.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---

Jacek, I lost the discussion here. Did you change something since V1 patch?

Pavel, Is this version OK for you?

-Bryan


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
> +       - flash_brightness - flash LED brightness in microamperes (RW)
> +       - max_flash_brightness - maximum available flash LED brightness (RO)
> +       - flash_timeout - flash strobe duration in microseconds (RW)
> +       - max_flash_timeout - maximum available flash strobe duration (RO)
> +       - flash_strobe - flash strobe state (RW)
> +       - available_sync_leds - list of sub-LEDs available for flash strobe
> +                               synchronization (RO)
> +       - flash_sync_strobe - identifier of the sub-LED to synchronize the flash
> +                             strobe with; 0 stands for no synchronization (RW)
> +       - flash_fault - list of flash faults that may have occurred:
> +               * led-over-voltage - flash controller voltage to the flash LED
> +                       has exceededthe limit specific to the flash controller
> +               * flash-timeout-exceeded - the flash strobe was still on when
> +                       the timeout set by the user has expired; not all flash
> +                       controllers may set this in all such conditions
> +               * controller-over-temperature - the flash controller has
> +                       overheated
> +               * controller-short-circuit - the short circuit protection
> +                       of the flash controller has been triggered
> +               * led-power-supply-over-current - current in the LED power
> +                       supply has exceeded the limit specific to the flash
> +                       controller
> +               * indicator-led-fault - the flash controller has detected
> +                       a short or open circuit condition on the indicator LED
> +               * led-under-voltage - flash controller voltage to the flash
> +                       LED has been below the minimum limit specific to
> +                       the flash
> +               * controller-under-voltage - the input voltage of the flash
> +                       controller is below the limit under which strobing the
> +                       flash at full current will not be possible;
> +                       the condition persists until this flag is no longer set
> +               * led-over-temperature - the temperature of the LED has exceeded
> +                       its allowed upper limit
> +
> +               Flash faults should be read in the strobe_set callback, right
> +               after the instruction initiating the strobe. If a flash LED
> +               device provides an instruction for clearing the faults, then,
> +               in case there were any faults read, it should be also executed
> +               in the callback.
> --
> 1.7.9.5
>
