From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 3/3] leds:pca963x: Update for PCA9635 and correct
 statement about MODE2 OUTDRV default
Date: Wed, 2 Jul 2014 16:44:18 -0700
Message-ID: <CAK5ve-LD9881i5AyYhNWMckY+1xqNaA+HmZ4WgaovBaNHkmtfw@mail.gmail.com>
References: <1404288046-26661-1-git-send-email-pmeerw@pmeerw.net> <1404288046-26661-3-git-send-email-pmeerw@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:32911 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852AbaGBXol (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 2 Jul 2014 19:44:41 -0400
Received: by mail-lb0-f177.google.com with SMTP id u10so8560821lbd.36
        for <linux-leds@vger.kernel.org>; Wed, 02 Jul 2014 16:44:39 -0700 (PDT)
In-Reply-To: <1404288046-26661-3-git-send-email-pmeerw@pmeerw.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Meerwald <pmeerw@pmeerw.net>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>

On Wed, Jul 2, 2014 at 1:00 AM, Peter Meerwald <pmeerw@pmeerw.net> wrote:
> mention support for 16 LED PCA9635 chip
>
> the default of MODE2's OUTDRV was incorrectly stated
>

Looks good to me. Please update the first patch and I can pick up this
whole patchset.

-Bryan

> Signed-off-by: Peter Meerwald <pmeerw@pmeerw.net>
> ---
>  Documentation/devicetree/bindings/leds/pca963x.txt |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
> index aece3ea..dafbe99 100644
> --- a/Documentation/devicetree/bindings/leds/pca963x.txt
> +++ b/Documentation/devicetree/bindings/leds/pca963x.txt
> @@ -1,18 +1,19 @@
>  LEDs connected to pca9632, pca9633 or pca9634
>
>  Required properties:
> -- compatible : should be : "nxp,pca9632", "nxp,pca9633" or "nxp,pca9634"
> +- compatible : should be : "nxp,pca9632", "nxp,pca9633", "nxp,pca9634" or "nxp,pca9635"
>
>  Optional properties:
> -- nxp,totem-pole : use totem pole (push-pull) instead of default open-drain
> +- nxp,totem-pole : use totem pole (push-pull) instead of open-drain (pca9632 defaults
> +  to open-drain, newer chips to totem pole)
>  - nxp,hw-blink : use hardware blinking instead of software blinking
>
>  Each led is represented as a sub-node of the nxp,pca963x device.
>
>  LED sub-node properties:
>  - label : (optional) see Documentation/devicetree/bindings/leds/common.txt
> -- reg : number of LED line (could be from 0 to 3  in pca9632 or pca9633
> -               or 0 to 7 in pca9634)
> +- reg : number of LED line (could be from 0 to 3 in pca9632 or pca9633,
> +               0 to 7 in pca9634, or 0 to 15 in pca9635)
>  - linux,default-trigger : (optional)
>     see Documentation/devicetree/bindings/leds/common.txt
>
> --
> 1.7.9.5
>
