From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: lp55xx: fix spelling mistake: 'cound' -> 'could'
Date: Mon, 30 Oct 2017 20:45:16 +0100
Message-ID: <f747caff-16fe-fd1f-c4a9-1dde478df1df@gmail.com>
References: <429d064a947efc6e55b057ead58ac0b0a598e391.1509256447.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:50912 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932554AbdJ3TqQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 30 Oct 2017 15:46:16 -0400
In-Reply-To: <429d064a947efc6e55b057ead58ac0b0a598e391.1509256447.git.arvind.yadav.cs@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Arvind,

Thanks for the patch.

On 10/29/2017 06:55 AM, Arvind Yadav wrote:
> Trivial fix to spelling mistakes in 'lp5523_init_program_engine'.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/leds/leds-lp5523.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index 924e50a..52b6f529 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -323,7 +323,7 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
>  
>  	if (status != LP5523_ENG_STATUS_MASK) {
>  		dev_err(&chip->cl->dev,
> -			"cound not configure LED engine, status = 0x%.2x\n",
> +			"could not configure LED engine, status = 0x%.2x\n",
>  			status);
>  		ret = -1;
>  	}
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
