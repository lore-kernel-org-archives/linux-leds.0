From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds/powernv : removing NULL check
Date: Mon, 23 Nov 2015 13:37:42 +0100
Message-ID: <56530896.2050802@samsung.com>
References: <1448270896-23955-1-git-send-email-saurabh.truth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:13933 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752243AbbKWMhp (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 23 Nov 2015 07:37:45 -0500
In-reply-to: <1448270896-23955-1-git-send-email-saurabh.truth@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Saurabh Sengar <saurabh.truth@gmail.com>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/23/2015 10:28 AM, Saurabh Sengar wrote:
> no need to explicitly check for pointer to be null,
> of_prop_next_string anyways return NULL, if passed pointer is NULL
> and hence loop will continue
>
> Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
> ---
>   drivers/leds/leds-powernv.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
> index 1e75e1f..bc2d76e 100644
> --- a/drivers/leds/leds-powernv.c
> +++ b/drivers/leds/leds-powernv.c
> @@ -256,8 +256,6 @@ static int powernv_led_classdev(struct platform_device *pdev,
>
>   	for_each_child_of_node(led_node, np) {
>   		p = of_find_property(np, "led-types", NULL);
> -		if (!p)
> -			continue;
>
>   		while ((cur = of_prop_next_string(p, cur)) != NULL) {
>   			powernv_led = devm_kzalloc(dev, sizeof(*powernv_led),
>

Applied, thanks.

-- 
Best Regards,
Jacek Anaszewski
