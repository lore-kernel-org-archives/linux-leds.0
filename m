From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds-ot200: Fix dependencies
Date: Tue, 11 Mar 2014 10:30:16 -0700
Message-ID: <CAK5ve-KbcyJfa12rUhN=EJyj-7KNf81b2kEyRP8uyWU+NEBC9A@mail.gmail.com>
References: <20140311173053.7b030522@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:36357 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753306AbaCKRah (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 11 Mar 2014 13:30:37 -0400
Received: by mail-la0-f44.google.com with SMTP id hr13so5904322lab.31
        for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2014 10:30:36 -0700 (PDT)
In-Reply-To: <20140311173053.7b030522@endymion.delvare>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Tue, Mar 11, 2014 at 9:30 AM, Jean Delvare <jdelvare@suse.de> wrote:
> The Bachmann OT200 is a Geode-based device, so OT200-specific drivers
> are only useful on X86_32, except for build testing.
>

Thanks, merged
-Bryan

> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
>  drivers/leds/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-3.14-rc6.orig/drivers/leds/Kconfig    2014-03-11 17:20:25.505429515 +0100
> +++ linux-3.14-rc6/drivers/leds/Kconfig 2014-03-11 17:21:57.843560506 +0100
> @@ -474,7 +474,7 @@ config LEDS_LM355x
>
>  config LEDS_OT200
>         tristate "LED support for the Bachmann OT200"
> -       depends on LEDS_CLASS && HAS_IOMEM
> +       depends on LEDS_CLASS && HAS_IOMEM && (X86_32 || COMPILE_TEST)
>         help
>           This option enables support for the LEDs on the Bachmann OT200.
>           Say Y to enable LEDs on the Bachmann OT200.
>
>
> --
> Jean Delvare
> SUSE L3 Support
