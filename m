From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/2] leds: blinkm: constify attribute_group structure
Date: Mon, 14 Aug 2017 22:47:32 +0200
Message-ID: <29cfc396-027f-9460-afea-a701ae76a78e@gmail.com>
References: <20170810162802.GA6881@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:37154 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751588AbdHNUsQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Aug 2017 16:48:16 -0400
In-Reply-To: <20170810162802.GA6881@amitoj-Inspiron-3542>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>, rpurdie@rpsys.net, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Amitoj,

Similar patch is already queued in the for-next branch
of linux-leds.git.

Thanks,
Jacek Anaszewski

On 08/10/2017 06:28 PM, Amitoj Kaur Chawla wrote:
> Functions working with attribute_groups provided by <linux/sysfs.h>
> work with const attribute_group. These attribute_group structures do not
> change at runtime so mark them as const.
> 
> File size before:
>  text      data     bss     dec     hex filename
>  8657      3496      64   12217    2fb9 drivers/leds/leds-blinkm.o
> 
> File size after:
>  text      data     bss     dec     hex filename
>  8753      3400      64   12217    2fb9 drivers/leds/leds-blinkm.o
> 
> This change was made with the help of Coccinelle.
> 
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
> ---
>  drivers/leds/leds-blinkm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index 617fe97..d03ed6b 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -298,7 +298,7 @@ static struct attribute *blinkm_attrs[] = {
>  	NULL,
>  };
>  
> -static struct attribute_group blinkm_group = {
> +static const struct attribute_group blinkm_group = {
>  	.name = "blinkm",
>  	.attrs = blinkm_attrs,
>  };
> 
