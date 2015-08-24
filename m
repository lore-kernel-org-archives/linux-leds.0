From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: syscon: Correct check for syscon_node_to_regmap()
 errors
Date: Mon, 24 Aug 2015 10:20:27 +0200
Message-ID: <55DAD3CB.5060705@samsung.com>
References: <1439925926-3174-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:17251 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751696AbbHXIUa (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 24 Aug 2015 04:20:30 -0400
In-reply-to: <1439925926-3174-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/18/2015 09:25 PM, Bjorn Andersson wrote:
> syscon_node_to_regmap() returns a regmap or an ERR_PTR().
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>
> Changes since v1:
> - Propagate the error
>
>   drivers/leds/leds-syscon.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
> index d1660b039812..b88900d721e4 100644
> --- a/drivers/leds/leds-syscon.c
> +++ b/drivers/leds/leds-syscon.c
> @@ -83,9 +83,9 @@ static int syscon_led_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   	map = syscon_node_to_regmap(parent->of_node);
> -	if (!map) {
> +	if (IS_ERR(map)) {
>   		dev_err(dev, "no regmap for syscon LED parent\n");
> -		return -ENODEV;
> +		return PTR_ERR(map);
>   	}
>
>   	sled = devm_kzalloc(dev, sizeof(*sled), GFP_KERNEL);
>

Merged, thanks.

-- 
Best Regards,
Jacek Anaszewski
