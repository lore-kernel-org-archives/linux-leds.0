From: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Subject: Re: [PATCH] leds: bcm6328: fix signal source assignment for leds 4 to
 7
Date: Sat, 3 Jun 2017 11:27:39 +0200
Message-ID: <447ffd3d-ae9b-ec02-83d2-9cba3f4c39a3@gmail.com>
References: <20170602121705.9645-1-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36713 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751112AbdFCJ1r (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Jun 2017 05:27:47 -0400
Received: by mail-wm0-f65.google.com with SMTP id k15so22351709wmh.3
        for <linux-leds@vger.kernel.org>; Sat, 03 Jun 2017 02:27:46 -0700 (PDT)
In-Reply-To: <20170602121705.9645-1-jonas.gorski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>, linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>

Acked-by: Álvaro Fernández Rojas <noltari@gmail.com>

El 02/06/2017 a las 14:17, Jonas Gorski escribió:
> Each nibble represents 4 LEDs, and in case of the higher register, bit 0
> represents LED 4, so we need to use modulus for the LED number as well.
> 
> Fixes: fd7b025a238d0a5440bfa26c585eb78097bf48dc ("leds: add BCM6328 LED driver")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  drivers/leds/leds-bcm6328.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
> index 1548259297c1..2cfd9389ee96 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -242,7 +242,7 @@ static int bcm6328_hwled(struct device *dev, struct device_node *nc, u32 reg,
>  
>  		spin_lock_irqsave(lock, flags);
>  		val = bcm6328_led_read(addr);
> -		val |= (BIT(reg) << (((sel % 4) * 4) + 16));
> +		val |= (BIT(reg % 4) << (((sel % 4) * 4) + 16));
>  		bcm6328_led_write(addr, val);
>  		spin_unlock_irqrestore(lock, flags);
>  	}
> @@ -269,7 +269,7 @@ static int bcm6328_hwled(struct device *dev, struct device_node *nc, u32 reg,
>  
>  		spin_lock_irqsave(lock, flags);
>  		val = bcm6328_led_read(addr);
> -		val |= (BIT(reg) << ((sel % 4) * 4));
> +		val |= (BIT(reg % 4) << ((sel % 4) * 4));
>  		bcm6328_led_write(addr, val);
>  		spin_unlock_irqrestore(lock, flags);
>  	}
> 
