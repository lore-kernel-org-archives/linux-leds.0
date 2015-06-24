From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [RESEND PATCH 3/4] leds: leds-ns2: handle can_sleep GPIOs
Date: Wed, 24 Jun 2015 16:18:29 +0200
Message-ID: <558ABC35.1010801@samsung.com>
References: <1434640650-28086-1-git-send-email-simon.guinot@sequanux.org>
 <1434640650-28086-4-git-send-email-simon.guinot@sequanux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17189 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752723AbbFXOSd (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 24 Jun 2015 10:18:33 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NQG0019MD2VKN30@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 24 Jun 2015 15:18:31 +0100 (BST)
In-reply-to: <1434640650-28086-4-git-send-email-simon.guinot@sequanux.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vincent Donnefort <vdonnefort@gmail.com>

On 06/18/2015 05:17 PM, Simon Guinot wrote:
> On the board n090401 (Seagate NAS 4-Bay), some of the LEDs are handled
> by the leds-ns2 driver. This LEDs are connected to an I2C GPIO expander
> (PCA95554PW) which means that GPIO access may sleep. This patch makes
> leds-ns2 compatible with such GPIOs by using the *_cansleep() variant of
> the GPIO functions. As a drawback this functions can't be used safely in
> a timer context (with the timer LED trigger for example). To fix this
> issue, a workqueue mechanism (copied from the leds-gpio driver) is used.
>
> Note that this patch also updates slightly the ns2_led_sata_store
> function. The LED state is now retrieved from cached values instead of
> reading the GPIOs previously. This prevents ns2_led_sata_store from
> working with a stale LED state (which may happen when a delayed work
> is pending).
>
> Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>
> ---
>   drivers/leds/leds-ns2.c | 56 ++++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 42 insertions(+), 14 deletions(-)
>

>
> +static void ns2_led_work(struct work_struct *work)
> +{
> +	struct ns2_led_data *led_dat =
> +		container_of(work, struct ns2_led_data, work);
> +	int i = led_dat->new_mode_index;
> +
> +	write_lock(&led_dat->rw_lock);
> +
> +	gpio_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
> +	gpio_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
> +
> +	write_unlock(&led_dat->rw_lock);
> +}
> +

I've just realized that this can break one of the basic rules:
no sleeping should occur while holding a spinlock. Did you
consider this?

-- 
Best Regards,
Jacek Anaszewski
