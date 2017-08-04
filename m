From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: blinkm: constify attribute_group structures.
Date: Fri, 4 Aug 2017 21:57:33 +0200
Message-ID: <c8a12023-33fc-8dab-cf36-1457c20cb225@gmail.com>
References: <7f7a15506ee3ccb8d2d54e3f3209f5cd1105f031.1501827866.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36840 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751268AbdHDT6Q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Aug 2017 15:58:16 -0400
In-Reply-To: <7f7a15506ee3ccb8d2d54e3f3209f5cd1105f031.1501827866.git.arvind.yadav.cs@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, jansimon.moeller@gmx.de, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Arvind,

Thanks for the patch.

On 08/04/2017 08:25 AM, Arvind Yadav wrote:
> attribute_group are not supposed to change at runtime. All functions
> working with attribute_group provided by <linux/sysfs.h> work with
> const attribute_group. So mark the non-const structs as const.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/leds/leds-blinkm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index 617fe97..d03ed6b 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -298,7 +298,7 @@ static ssize_t store_test(struct device *dev, struct device_attribute *attr,
>  	NULL,
>  };
>  
> -static struct attribute_group blinkm_group = {
> +static const struct attribute_group blinkm_group = {
>  	.name = "blinkm",
>  	.attrs = blinkm_attrs,
>  };
> 

Applied to the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
