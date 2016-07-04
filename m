From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: triggers: return error if invalid trigger name is
 provided via sysfs
Date: Mon, 04 Jul 2016 08:54:02 +0200
Message-ID: <577A080A.7080108@samsung.com>
References: <d7ef6332-73ae-b902-bdf2-d6dbcf8cc06c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23780 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752807AbcGDGyH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 4 Jul 2016 02:54:07 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O9S00HCX363G140@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 04 Jul 2016 07:54:03 +0100 (BST)
In-reply-to: <d7ef6332-73ae-b902-bdf2-d6dbcf8cc06c@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Heiner,

On 07/01/2016 11:08 PM, Heiner Kallweit wrote:
> If an invalid trigger name is provided via sysfs currently no error
> is returned. Therefore it's not possible to determine whether the
> trigger was set successfully.
> Fix this by returning -EINVAL if no trigger is matched.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/leds/led-triggers.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 55fa65e..c92702a 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -60,6 +60,8 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>   			goto unlock;
>   		}
>   	}
> +	/* we come here only if buf matches no trigger */
> +	ret = -EINVAL;
>   	up_read(&triggers_list_lock);
>
>   unlock:
>

Thanks for the patch. Applied.

-- 
Best regards,
Jacek Anaszewski
