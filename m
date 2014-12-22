From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCHv3] DT: leds: Add flash LED devices related properties
 (fwd) (fwd)
Date: Mon, 22 Dec 2014 14:41:53 -0800
Message-ID: <CAK5ve-JSv6-jHL5FmDNM1e0_5-+RJok8KXDE90xQnMEn=-Pohw@mail.gmail.com>
References: <20141222222729.GA19981@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:44665 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182AbaLVWmO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 22 Dec 2014 17:42:14 -0500
In-Reply-To: <20141222222729.GA19981@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>

On Mon, Dec 22, 2014 at 2:27 PM, Pavel Machek <pavel@ucw.cz> wrote:
> Addition of a LED Flash class extension entails the need for flash LED
> specific device tree properties. The properties being added are:
> max-microamp, flash-max-microamp, flash-timeout-microsec.
>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Rob Herring <robh@kernel.org>
>

Applied after removing some white spaces, thanks,
-Bryan

> ---
>
> This will allow me to add device tree support for adp1653 i2c flash
> LED driver, and allow Jacek Anaszewski to add support for more LED
> drivers..
>
> Rob Herring requested to change microsec to us.
>
> Yes, microamp vs. us does look inconsistent, but that's what other
> subsystems do, and what Rob asked.
>
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 2d88816..e9acbbc 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -14,6 +14,15 @@ Optional properties for child nodes:
>       "ide-disk" - LED indicates disk activity
>       "timer" - LED flashes at a fixed, configurable rate
>
> +- max-microamp : maximum intensity in microamperes of the LED
> +                (torch LED for flash devices)
> +- flash-max-microamp : maximum intensity in microamperes of the
> +                       flash LED; it is mandatory if the LED should
> +                      support the flash mode
> +- flash-timeout-us : timeout in microseconds after which the flash
> +                     LED is turned off
> +
> +
>  Examples:
>
>  system-status {
> @@ -21,3 +30,10 @@ system-status {
>         linux,default-trigger = "heartbeat";
>         ...
>  };
> +
> +camera-flash {
> +       label = "Flash";
> +       max-microamp = <50000>;
> +       flash-max-microamp = <320000>;
> +       flash-timeout-us = <500000>;
> +}
>
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
