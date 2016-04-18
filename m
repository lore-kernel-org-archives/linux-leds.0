From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] leds: ledtrig-ide-disk: Move ide_blink_delay to
 ledtrig_ide_activity()
Date: Mon, 18 Apr 2016 16:57:15 +0200
Message-ID: <20160418165715.4668ffa0@bbrezillon>
References: <1460990446-24700-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:52470 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752041AbcDRO5S (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 18 Apr 2016 10:57:18 -0400
In-Reply-To: <1460990446-24700-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, rpurdie@rpsys.net, ezequiel@vanguardiasur.com.ar, pavel@ucw.cz

On Mon, 18 Apr 2016 16:40:46 +0200
Jacek Anaszewski <j.anaszewski@samsung.com> wrote:

> Parameters delay_on and delay_off of led_trigger_blink_oneshot()
> are pointers, to enable blink interval adjustment by LED class drivers
> of the controllers that implement hardware blinking.
> 
> Move ide_blink_delay variable to ledtrig_ide_activity() in order to
> prevent the situation when adjustment committed by one LED class
> driver influences blink interval of the software fallback blink feature,
> that is applied to the drivers that don't implement blink_set op.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/leds/trigger/ledtrig-ide-disk.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-ide-disk.c b/drivers/leds/trigger/ledtrig-ide-disk.c
> index c02a3ac..15123d3 100644
> --- a/drivers/leds/trigger/ledtrig-ide-disk.c
> +++ b/drivers/leds/trigger/ledtrig-ide-disk.c
> @@ -18,10 +18,11 @@
>  #define BLINK_DELAY 30
>  
>  DEFINE_LED_TRIGGER(ledtrig_ide);
> -static unsigned long ide_blink_delay = BLINK_DELAY;
>  
>  void ledtrig_ide_activity(void)
>  {
> +	unsigned long ide_blink_delay = BLINK_DELAY;
> +
>  	led_trigger_blink_oneshot(ledtrig_ide,
>  				  &ide_blink_delay, &ide_blink_delay, 0);
>  }



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
