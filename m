From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH/trivial] ledtrig-activity: Grammar s/a immediate/an
 immediate/
Date: Fri, 1 Dec 2017 21:14:43 +0100
Message-ID: <71729f17-086f-171a-fa19-2c5cae5fecad@gmail.com>
References: <1512049001-19669-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34804 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752356AbdLAUPm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 1 Dec 2017 15:15:42 -0500
In-Reply-To: <1512049001-19669-1-git-send-email-geert+renesas@glider.be>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Jiri Kosina <trivial@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Willy Tarreau <w@1wt.eu>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Geert,

On 11/30/2017 02:36 PM, Geert Uytterhoeven wrote:
> Fixes: 7df4f9a9f0667ee6 ("leds: ledtrig-activity: Add a system activity LED trigger")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/leds/trigger/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index bb090216b4dc338d..6dac48c457d17ca5 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -81,7 +81,7 @@ config LEDS_TRIGGER_ACTIVITY
>  	tristate "LED activity Trigger"
>  	depends on LEDS_TRIGGERS
>  	help
> -	  This allows LEDs to be controlled by a immediate CPU usage.
> +	  This allows LEDs to be controlled by an immediate CPU usage.
>  	  The flash frequency and duty cycle varies from faint flashes to
>  	  intense brightness depending on the instant CPU load.
>  	  If unsure, say N.
> 

Applied, thanks.

-- 
Best regards,
Jacek Anaszewski
