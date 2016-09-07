From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch 2/2] leds: add driver for Mellanox systems leds
Date: Wed, 07 Sep 2016 15:10:39 +0200
Message-ID: <821b4b7a-aa0b-293d-01d0-722094c1bc12@samsung.com>
References: <1473259995-196607-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:29863 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757216AbcIGNK5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Sep 2016 09:10:57 -0400
In-reply-to: <1473259995-196607-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: vadimp@mellanox.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com

Hi Vadim,

Please use git format-patch -n, where n is the number
of patches to be produced starting from your current git HEAD.

It will produce patches tagged [PATCH 1/2], [PATCH 2/2],
or starting from [PATCH 0/2] when added --cover-letter switch.

Now it looks as if this patch was a part of the patch set
comprising two patches, but I don't see the first one.
I assume that you added the numbering by hand and this one
was intended to be put in the one set with the following one:

[patch] leds: add driver for Mellanox systems leds

On 09/07/2016 04:53 PM, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
>
> Fix in comments 3KHz and 6KHz to 3Hz and 6Hz respectively.
>
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/leds/leds-mlxcpld.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
> index 0ec2375..eeed35c 100644
> --- a/drivers/leds/leds-mlxcpld.c
> +++ b/drivers/leds/leds-mlxcpld.c
> @@ -47,8 +47,8 @@
>  #define MLXPLAT_CPLD_LPC_REG_BASE_ADRR     0x2500 /* LPC bus access */
>
>  /* Color codes for leds */
> -#define LED_OFFSET_HALF		0x01 /* Offset from solid for 3KHz blink */
> -#define LED_OFFSET_FULL		0x02 /* Offset from solid for 6KHz blink */
> +#define LED_OFFSET_HALF		0x01 /* Offset from solid for 3Hz blink */
> +#define LED_OFFSET_FULL		0x02 /* Offset from solid for 6Hz blink */
>  #define LED_IS_OFF		0x00 /* Off */
>  #define LED_RED_STATIC_ON	0x05 /* Solid red */
>  #define LED_RED_BLINK_HALF	(LED_RED_STATIC_ON + LED_OFFSET_HALF)
> @@ -237,7 +237,7 @@ static void mlxcpld_led_store_hw(u8 mask, u8 off, u8 vset)
>  	/* Each led is controlled through low or high nibble of the relevant
>  	 * CPLD register. Register offset is specified by off parameter.
>  	 * Parameter vset provides color code: 0x0 for off, 0x5 for solid red,
> -	 * 0x6 for 3KHz blink red, 0xd for solid green, 0xe for 3KHz blink
> +	 * 0x6 for 3Hz blink red, 0xd for solid green, 0xe for 3Hz blink
>  	 * green.
>  	 * Parameter mask specifies which nibble is used for specific led: mask
>  	 * 0xf0 - lower nibble is to be used (bits from 0 to 3), mask 0x0f -
> @@ -274,8 +274,8 @@ static int mlxcpld_led_blink(struct led_classdev *led,
>  {
>  	struct mlxcpld_led_priv *pled = cdev_to_priv(led);
>
> -	/* HW supports two types of blinking: full (6KHz) and half (3KHz).
> -	 * For delay on/off zero default setting 3KHz is used.
> +	/* HW supports two types of blinking: full (6Hz) and half (3Hz).
> +	 * For delay on/off zero default setting 3Hz is used.
>  	 */
>  	if (!(*delay_on == 0 && *delay_off == 0) &&
>  	    !(*delay_on == LED_BLINK_3HZ && *delay_off == LED_BLINK_3HZ) &&
>


-- 
Best regards,
Jacek Anaszewski
