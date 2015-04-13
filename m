From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v6] DT: leds: Improve description of flash LEDs related
 properties
Date: Mon, 13 Apr 2015 10:43:51 +0200
Message-ID: <552B81C7.8010004@samsung.com>
References: <1428655016-17752-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60334 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753287AbbDMIn5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 13 Apr 2015 04:43:57 -0400
In-reply-to: <1428655016-17752-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

We're missing only a DT maintainer ack now. Could anyone take
a look at this, please?

On 04/10/2015 10:36 AM, Jacek Anaszewski wrote:
> 1. Since max-microamp property has had no users so far, then rename
>     it to more descriptive led-max-microamp.
> 2. Since flash-timeout-us property has had no users so far, then rename
>     it to more accurate flash-max-timeout-us.
> 3. Describe led-max-microamp property as mandatory for specific board
>     configurations.
> 4. Make flash-max-microamp and flash-max-timeout-us properties mandatory
>     for devices with configurable flash current and flash timeout settings
>     respectively.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: devicetree@vger.kernel.org
> ---
>   Documentation/devicetree/bindings/leds/common.txt |   27 ++++++++++++++-------
>   1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 747c538..6841984 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -29,14 +29,23 @@ Optional properties for child nodes:
>        "ide-disk" - LED indicates disk activity
>        "timer" - LED flashes at a fixed, configurable rate
>
> -- max-microamp : maximum intensity in microamperes of the LED
> -		 (torch LED for flash devices)
> -- flash-max-microamp : maximum intensity in microamperes of the
> -                       flash LED; it is mandatory if the LED should
> -		       support the flash mode
> -- flash-timeout-us : timeout in microseconds after which the flash
> -                     LED is turned off
> +- led-max-microamp : Maximum LED supply current in microamperes. This property
> +                     can be made mandatory for the board configurations
> +                     introducing a risk of hardware damage in case an excessive
> +                     current is set.
> +                     For flash LED controllers with configurable current this
> +                     property is mandatory for the LEDs in the non-flash modes
> +                     (e.g. torch or indicator).
>
> +Required properties for flash LED child nodes:
> +- flash-max-microamp : Maximum flash LED supply current in microamperes.
> +- flash-max-timeout-us : Maximum timeout in microseconds after which the flash
> +                         LED is turned off.
> +
> +For controllers that have no configurable current the flash-max-microamp
> +property can be omitted.
> +For controllers that have no configurable timeout the flash-max-timeout-us
> +property can be omitted.
>
>   Examples:
>
> @@ -49,7 +58,7 @@ system-status {
>   camera-flash {
>   	label = "Flash";
>   	led-sources = <0>, <1>;
> -	max-microamp = <50000>;
> +	led-max-microamp = <50000>;
>   	flash-max-microamp = <320000>;
> -	flash-timeout-us = <500000>;
> +	flash-max-timeout-us = <500000>;
>   };
>


-- 
Best Regards,
Jacek Anaszewski
