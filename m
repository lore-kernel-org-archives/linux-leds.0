From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: pca955x: Prevent crippled LED device name
Date: Tue, 22 Aug 2017 20:46:12 +0200
Message-ID: <3bc8fb83-4006-3945-ec59-45bb81eac8f5@gmail.com>
References: <1503003364-14952-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34952 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752236AbdHVSqz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Aug 2017 14:46:55 -0400
Received: by mail-lf0-f65.google.com with SMTP id d202so3091518lfd.2
        for <linux-leds@vger.kernel.org>; Tue, 22 Aug 2017 11:46:54 -0700 (PDT)
In-Reply-To: <1503003364-14952-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: colin.king@canonical.com, dan.carpenter@oracle.com, ncase@xes-inc.com

Hi all,

Provided that no objections have appeared for last few days,
I'm applying the patch to the for-next branch of linux-leds.git.

Thanks,
Jacek Anaszewski

On 08/17/2017 10:56 PM, Jacek Anaszewski wrote:
> In case platform data provided empty LED name string the resulting
> LED class device name would be crippled. Use corresponding LED chip
> bit in place of "function" segment of LED class device name then to
> make the LEDs at least distinguishable.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Reported-by: Colin King <colin.king@canonical.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Nate Case <ncase@xes-inc.com>
> ---
>  drivers/leds/leds-pca955x.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index f062d1e..09303fd 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -473,10 +473,14 @@ static int pca955x_probe(struct i2c_client *client,
>  			 * Platform data can specify LED names and
>  			 * default triggers
>  			 */
> -			if (pdata->leds[i].name)
> -				snprintf(pca955x_led->name,
> -					sizeof(pca955x_led->name), "pca955x:%s",
> -					pdata->leds[i].name);
> +			if (pdata->leds[i].name[0] == '\0')
> +				snprintf(pdata->leds[i].name,
> +					sizeof(pdata->leds[i].name), "%d", i);
> +
> +			snprintf(pca955x_led->name,
> +				sizeof(pca955x_led->name), "pca955x:%s",
> +				pdata->leds[i].name);
> +
>  			if (pdata->leds[i].default_trigger)
>  				pca955x_led->led_cdev.default_trigger =
>  					pdata->leds[i].default_trigger;
> 
