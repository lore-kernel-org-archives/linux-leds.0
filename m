From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds:lp55xx: Correct Kconfig dependency for f/w user helper
Date: Mon, 07 Sep 2015 16:19:13 +0200
Message-ID: <55ED9CE1.1080002@samsung.com>
References: <1441628701-3022-1-git-send-email-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19597 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750964AbbIGOTQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 10:19:16 -0400
In-reply-to: <1441628701-3022-1-git-send-email-tiwai@suse.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>, Milo Kim <milo.kim@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>

Hi Takashi,

Thanks for chasing this.
Milo, could you express your opinion?

On 09/07/2015 02:25 PM, Takashi Iwai wrote:
> The commit [b67893206fc0: leds:lp55xx: fix firmware loading error]
> tries to address the firmware file handling with user helper, but it
> sets a wrong Kconfig CONFIG_FW_LOADER_USER_HELPER_FALLBACK.  Since the
> wrong option was enabled, the system got a regression -- it suffers
> from the unexpected long delays for non-present firmware files.
>
> This patch corrects the Kconfig dependency to the right one,
> CONFIG_FW_LOADER_USER_HELPER.  This doesn't change the fallback
> behavior but only enables UMH when needed.
>
> Bugzilla: https://bugzilla.opensuse.org/show_bug.cgi?id=944661
> Fixes: b67893206fc0 ('leds:lp55xx: fix firmware loading error')
> Cc: <stable@vger.kernel.org> # v4.2+
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   drivers/leds/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 70f4255ff291..2ba52bc2e174 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -229,7 +229,7 @@ config LEDS_LP55XX_COMMON
>   	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>   	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>   	select FW_LOADER
> -	select FW_LOADER_USER_HELPER_FALLBACK
> +	select FW_LOADER_USER_HELPER
>   	help
>   	  This option supports common operations for LP5521/5523/55231/5562/8501
>   	  devices.
>


-- 
Best Regards,
Jacek Anaszewski
