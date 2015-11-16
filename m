From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: ktd2692: Add missing of_node_put
Date: Mon, 16 Nov 2015 11:00:12 +0100
Message-ID: <5649A92C.1020502@samsung.com>
References: <1447124424-16525-1-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46266 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751661AbbKPKAS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2015 05:00:18 -0500
In-reply-to: <1447124424-16525-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Ingi, Rob,

With this patch we will be leaking of_node when parsing succeeds.
I think that "return 0" should be removed. I can remove it and apply,
provided that Rob's ack is still in force with this. Rob?

Best Regards,
Jacek Anaszewski

On 11/10/2015 04:00 AM, Ingi Kim wrote:
> The refcount of device_node increases after of_node_get() is called.
> So, a break out of the loop requires of_node_put().
>
> This patch adds missing of_node_put() when loop breaks.
>
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
> ---
>   drivers/leds/leds-ktd2692.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
> index feca07b..dbf37ce 100644
> --- a/drivers/leds/leds-ktd2692.c
> +++ b/drivers/leds/leds-ktd2692.c
> @@ -332,21 +332,26 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
>   				   &cfg->movie_max_microamp);
>   	if (ret) {
>   		dev_err(dev, "failed to parse led-max-microamp\n");
> -		return ret;
> +		goto err_parse_dt;
>   	}
>
>   	ret = of_property_read_u32(child_node, "flash-max-microamp",
>   				   &cfg->flash_max_microamp);
>   	if (ret) {
>   		dev_err(dev, "failed to parse flash-max-microamp\n");
> -		return ret;
> +		goto err_parse_dt;
>   	}
>
>   	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
>   				   &cfg->flash_max_timeout);
> -	if (ret)
> +	if (ret) {
>   		dev_err(dev, "failed to parse flash-max-timeout-us\n");
> +		goto err_parse_dt;
> +	}
> +
> +	return 0;
>
> +err_parse_dt:
>   	of_node_put(child_node);
>   	return ret;
>   }
>
