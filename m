From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: gpio: Fix device teardown on probe deferral
Date: Wed, 15 Apr 2015 11:11:47 +0200
Message-ID: <552E2B53.8030002@samsung.com>
References: <1429046610-3001-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40876 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751396AbbDOJLw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 15 Apr 2015 05:11:52 -0400
In-reply-to: <1429046610-3001-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Sebastian,

On 04/14/2015 11:23 PM, Sebastian Hesselbarth wrote:
> In gpio_leds_create(), when devm_get_gpiod_from_child() fails with
> -EPROBE_DEFER on the second gpio led to be created, the first already
> registered led is not torn down properly. This causes create_gpio_led()
> to fail for the first led on re-probe().
>
> Fix this misbehaviour by incrementing num_leds only if all
> potentially failing calls completed successfully.
>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> ---
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   drivers/leds/leds-gpio.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

For this patch:

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

I have a question regarding the sequence above on line 201:

if (!led.name)
	return ERR_PTR(-EINVAL);

Shouldn't this be also 'goto err"?

-- 
Best Regards,
Jacek Anaszewski
