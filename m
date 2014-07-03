From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2 3/3] leds:pca963x: Update for PCA9635 and correct
 statement about MODE2 OUTDRV default
Date: Thu, 3 Jul 2014 11:59:14 -0700
Message-ID: <CAK5ve-JfUOD5u_oJ85+QMB9sSCzq5OKqw554XJniv1_p4P-ERw@mail.gmail.com>
References: <1404366636-25469-1-git-send-email-pmeerw@pmeerw.net> <1404366636-25469-3-git-send-email-pmeerw@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:36766 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751698AbaGCS7g (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 3 Jul 2014 14:59:36 -0400
Received: by mail-la0-f48.google.com with SMTP id el20so482937lab.21
        for <linux-leds@vger.kernel.org>; Thu, 03 Jul 2014 11:59:35 -0700 (PDT)
In-Reply-To: <1404366636-25469-3-git-send-email-pmeerw@pmeerw.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Meerwald <pmeerw@pmeerw.net>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>

On Wed, Jul 2, 2014 at 10:50 PM, Peter Meerwald <pmeerw@pmeerw.net> wrote:
> mention support for 16 LED PCA9635 chip
>
> the default of MODE2's OUTDRV was incorrectly stated
>

Applied. Thanks,
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
