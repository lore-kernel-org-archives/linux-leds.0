From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: blinkm: avoid uninitialized data use
Date: Tue, 5 Dec 2017 21:30:50 +0100
Message-ID: <5aa46ad0-23d4-15d6-dcbe-58b37de25285@gmail.com>
References: <20171204144538.304782-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:38800 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751500AbdLEUbr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Dec 2017 15:31:47 -0500
In-Reply-To: <20171204144538.304782-1-arnd@arndb.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Jan-Simon Moeller <jansimon.moeller@gmx.de>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Arnd,

Thanks for the patch.

On 12/04/2017 03:45 PM, Arnd Bergmann wrote:
> gcc-8 reports missing error handling in blinkm_detect, when blinkm()
> fails, tmpargs[] is uninitialized:
> 
> drivers/leds/leds-blinkm.c: In function 'blinkm_detect':
> drivers/leds/leds-blinkm.c:555:6: error: 'tmpargs' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> 
> This adds a missing error checks.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/leds/leds-blinkm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index d03ed6b4176b..851c1920b63c 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -549,8 +549,12 @@ static int blinkm_detect(struct i2c_client *client, struct i2c_board_info *info)
>  	/* make sure the blinkM is balanced (read/writes) */
>  	while (count > 0) {
>  		ret = blinkm_write(client, BLM_GET_ADDR, NULL);
> +		if (ret)
> +			return ret;
>  		usleep_range(5000, 10000);
>  		ret = blinkm_read(client, BLM_GET_ADDR, tmpargs);
> +		if (ret)
> +			return ret;
>  		usleep_range(5000, 10000);
>  		if (tmpargs[0] == 0x09)
>  			count = 0;
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
