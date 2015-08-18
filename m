From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: syscon: Correct check for syscon_node_to_regmap()
 errors
Date: Tue, 18 Aug 2015 12:35:23 +0200
Message-ID: <55D30A6B.5060304@samsung.com>
References: <1439828334-6619-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44386 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751878AbbHRKf1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 18 Aug 2015 06:35:27 -0400
In-reply-to: <1439828334-6619-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Bjor,

On 08/17/2015 06:18 PM, Bjorn Andersson wrote:
> syscon_node_to_regmap() returns a regmap or an ERR_PTR().
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>   drivers/leds/leds-syscon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
> index d1660b039812..39fca4c9f1ee 100644
> --- a/drivers/leds/leds-syscon.c
> +++ b/drivers/leds/leds-syscon.c
> @@ -83,7 +83,7 @@ static int syscon_led_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   	map = syscon_node_to_regmap(parent->of_node);
> -	if (!map) {
> +	if (IS_ERR(map)) {
>   		dev_err(dev, "no regmap for syscon LED parent\n");
>   		return -ENODEV;

return PTR_ERR(map) ?

>   	}
>


-- 
Best Regards,
Jacek Anaszewski
