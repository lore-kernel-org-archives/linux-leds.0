From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] drivers/leds/leds-ss4200.c: add DMI data for FSC SCALEO
 Home Server
Date: Mon, 18 Apr 2016 11:00:04 +0200
Message-ID: <5714A214.200@samsung.com>
References: <1460891675-6994-1-git-send-email-martin.dummer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12164 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751355AbcDRJAJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 18 Apr 2016 05:00:09 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5T00K02NO6TQ70@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 18 Apr 2016 10:00:06 +0100 (BST)
In-reply-to: <1460891675-6994-1-git-send-email-martin.dummer@gmx.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Martin Dummer <martin.dummer@gmx.net>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org

Hi Martin,

Thanks for the patch. I have one remark below.

On 04/17/2016 01:14 PM, Martin Dummer wrote:
> The Intel NAS SS4200 was also sold by Fujitsu Siemens (FSC) under
> the name "SCALEO Home Server". The hardware is equivalent.
>
> This patch adds the DMI data of this rebranded device.
>
> Signed-off-by: Martin Dummer <martin.dummer@gmx.net>
> ---
>   drivers/leds/leds-ss4200.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index 046cb70..a3aa02e 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -101,6 +101,16 @@ static struct dmi_system_id nas_led_whitelist[] __initdata = {
>   			DMI_MATCH(DMI_PRODUCT_VERSION, "1.00.00")
>   		}
>   	},
> +	{
> +		//  FUJITSU SIEMENS SCALEO Home Server/SS4200-E, BIOS V090L   12/19/2007

checkpatch.pl complains here:

WARNING: line over 80 characters
ERROR: do not use C99 // comments

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


-- 
Best regards,
Jacek Anaszewski
