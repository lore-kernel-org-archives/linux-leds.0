From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds/led-class: Add missing put_device()
Date: Thu, 30 Jul 2015 22:37:05 +0200
Message-ID: <55BA8AF1.80206@gmail.com>
References: <1437746972-23967-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f193.google.com ([209.85.212.193]:33423 "EHLO
	mail-wi0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750935AbbG3Uiw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 30 Jul 2015 16:38:52 -0400
In-Reply-To: <1437746972-23967-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Ricardo,

On 24.07.2015 16:09, Ricardo Ribalda Delgado wrote:
> Devices found by class_find_device must be freed with put_device().
> Otherwise the reference count will not work properly.
>
> Fixes: a96aa64cb572 ("leds/led-class: Handle LEDs with the same name")
> Reported-by: Alan Tull <delicious.quinoa@gmail.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>
> Thanks Alan!
>
>   drivers/leds/led-class.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index beabfbc6f7cd..380cda0bff72 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -228,12 +228,15 @@ static int led_classdev_next_name(const char *init_name, char *name,
>   {
>   	unsigned int i = 0;
>   	int ret = 0;
> +	struct device *dev;
>
>   	strlcpy(name, init_name, len);
>
> -	while (class_find_device(leds_class, NULL, name, match_name) &&
> -	       (ret < len))
> +	while ((dev = class_find_device(leds_class, NULL, name, match_name)) &&
> +	       (ret < len)) {
> +		put_device(dev);

IIUC, we will be leaking dev if ret >= len.

>   		ret = snprintf(name, len, "%s_%u", init_name, ++i);
> +	}
>
>   	if (ret >= len)
>   		return -ENOMEM;
>

-- 
Best Regards,
Jacek Anaszewski
