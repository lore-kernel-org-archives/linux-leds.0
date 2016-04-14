From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch] leds: tca6507: silence an uninitialized variable warning
Date: Thu, 14 Apr 2016 13:12:38 +0200
Message-ID: <570F7B26.2090202@samsung.com>
References: <20160414093616.GH16549@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41672 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751752AbcDNLMm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Apr 2016 07:12:42 -0400
In-reply-to: <20160414093616.GH16549@mwanda>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for the patch.

Applied to the for-next branch of linux-leds.git.

Thanks,
Jacek Anaszewski

On 04/14/2016 11:36 AM, Dan Carpenter wrote:
> If choose_times() returns -EINVAL that means "c1" and "c2" haven't been
> initialized.  I've added a check for that.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index c548ea1..45222a7 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
> @@ -327,6 +327,8 @@ static void set_times(struct tca6507_chip *tca, int bank)
>   	int result;
>
>   	result = choose_times(tca->bank[bank].ontime, &c1, &c2);
> +	if (result < 0)
> +		return;
>   	dev_dbg(&tca->client->dev,
>   		"Chose on  times %d(%d) %d(%d) for %dms\n",
>   		c1, time_codes[c1],
>
>
