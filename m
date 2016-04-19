From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] drivers/leds/leds-ss4200.c: add DMI data for FSC SCALEO
 Home Server
Date: Tue, 19 Apr 2016 09:14:05 +0200
Message-ID: <5715DABD.9060203@samsung.com>
References: <1460891675-6994-1-git-send-email-martin.dummer@gmx.net>
 <1461045108-3125-1-git-send-email-martin.dummer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:18765 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752373AbcDSHOJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 Apr 2016 03:14:09 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5V0088ADFID700@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 19 Apr 2016 08:14:06 +0100 (BST)
In-reply-to: <1461045108-3125-1-git-send-email-martin.dummer@gmx.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Martin Dummer <martin.dummer@gmx.net>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org

Hi Martin,

On 04/19/2016 07:51 AM, Martin Dummer wrote:
> The Intel NAS SS4200 was also sold by Fujitsu Siemens (FSC) under
> the name "SCALEO Home Server". The hardware is equivalent.
>
> This patch adds the DMI data of this rebranded device.
>
> Signed-off-by: Martin Dummer <martin.dummer@gmx.net>
> ---
>   drivers/leds/leds-ss4200.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index 046cb70..732eb86 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -101,6 +101,19 @@ static struct dmi_system_id nas_led_whitelist[] __initdata = {
>   			DMI_MATCH(DMI_PRODUCT_VERSION, "1.00.00")
>   		}
>   	},
> +	{
> +		/*
> +		 * FUJITSU SIEMENS SCALEO Home Server/SS4200-E
> +		 * BIOS V090L 12/19/2007
> +		 */
> +		.callback = ss4200_led_dmi_callback,
> +		.ident = "Fujitsu Siemens SCALEO Home Server",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "SCALEO Home Server"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "1.00.00")
> +		}
> +	},
>   	{}
>   };
>
>

Thanks for the update, applied.

-- 
Best regards,
Jacek Anaszewski
