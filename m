From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: lp8860: Constify reg_default tables
Date: Mon, 13 Jul 2015 14:50:09 +0200
Message-ID: <55A3B401.40900@samsung.com>
References: <1436323406.25341.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40320 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751292AbbGMMuN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2015 08:50:13 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NRF004H7FNMUG00@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 13 Jul 2015 13:50:10 +0100 (BST)
In-reply-to: <1436323406.25341.0.camel@ingics.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Bryan Wu <cooloney@gmail.com>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org

Hi Axel,

Thanks for the patch.

On 07/08/2015 04:43 AM, Axel Lin wrote:
> These reg_default tables are not modified after initialized, so make them
> const.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>   drivers/leds/leds-lp8860.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
> index 8c2b7fb..79f0843 100644
> --- a/drivers/leds/leds-lp8860.c
> +++ b/drivers/leds/leds-lp8860.c
> @@ -302,7 +302,7 @@ out:
>   	return ret;
>   }
>
> -static struct reg_default lp8860_reg_defs[] = {
> +static const struct reg_default lp8860_reg_defs[] = {
>   	{ LP8860_DISP_CL1_BRT_MSB, 0x00},
>   	{ LP8860_DISP_CL1_BRT_LSB, 0x00},
>   	{ LP8860_DISP_CL1_CURR_MSB, 0x00},
> @@ -332,7 +332,7 @@ static const struct regmap_config lp8860_regmap_config = {
>   	.cache_type = REGCACHE_NONE,
>   };
>
> -static struct reg_default lp8860_eeprom_defs[] = {
> +static const struct reg_default lp8860_eeprom_defs[] = {
>   	{ LP8860_EEPROM_REG_0, 0x00 },
>   	{ LP8860_EEPROM_REG_1, 0x00 },
>   	{ LP8860_EEPROM_REG_2, 0x00 },
>

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
