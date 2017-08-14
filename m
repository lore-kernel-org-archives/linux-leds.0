From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 2/2] leds: lm3533: constify attribute_group structure
Date: Mon, 14 Aug 2017 22:46:21 +0200
Message-ID: <d47313e8-c60e-a1b0-5284-27a0e1c5ea5a@gmail.com>
References: <20170810162809.GA6903@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:38234 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752199AbdHNUrF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Aug 2017 16:47:05 -0400
In-Reply-To: <20170810162809.GA6903@amitoj-Inspiron-3542>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>, rpurdie@rpsys.net, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Amitoj,

Thanks for the patch, applied.

Best regards,
Jacek Anaszewski

On 08/10/2017 06:28 PM, Amitoj Kaur Chawla wrote:
> Functions working with attribute_groups provided by <linux/device.h>
> work with const attribute_group. These attribute_group structures do not
> change at runtime so mark them as const.
> 
> File size before:
>  text      data     bss     dec     hex filename
>  8272      4608      64   12944    3290 drivers/leds/leds-lm3533.o
> 
> File size after:
>  text      data     bss     dec     hex filename
>  8368      4512      64   12944    3290 drivers/leds/leds-lm3533.o
> 
> This change was made with the help of Coccinelle.
> 
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
> ---
>  drivers/leds/leds-lm3533.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index 5b529dc..72224b5 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c
> @@ -626,7 +626,7 @@ static umode_t lm3533_led_attr_is_visible(struct kobject *kobj,
>  	return mode;
>  };
>  
> -static struct attribute_group lm3533_led_attribute_group = {
> +static const struct attribute_group lm3533_led_attribute_group = {
>  	.is_visible	= lm3533_led_attr_is_visible,
>  	.attrs		= lm3533_led_attributes
>  };
> 
