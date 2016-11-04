From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch v1 1/1] leds: verify vendor and change license in mlxcpld
 driver
Date: Fri, 04 Nov 2016 09:37:52 +0100
Message-ID: <e4180b0b-f09f-a9f4-930d-127311704e36@samsung.com>
References: <CGME20161103171933epcas3p44d4939851092122a5fb9c985eb125770@epcas3p4.samsung.com>
 <1478200639-190079-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55481 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756454AbcKDIh7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Nov 2016 04:37:59 -0400
In-reply-to: <1478200639-190079-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us

Hi Vadim,

On 11/03/2016 08:17 PM, Vadim Pasternak wrote:
> Verify that vendor is Mellanox as the first step of initialization.
> If it is not - return ENODEV.
> Change module license from "GPL v2" to "Dual BSD/GPL".
>
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/leds/leds-mlxcpld.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
> index 197ab9b..281482e 100644
> --- a/drivers/leds/leds-mlxcpld.c
> +++ b/drivers/leds/leds-mlxcpld.c
> @@ -400,6 +400,9 @@ static int __init mlxcpld_led_init(void)
>  	struct platform_device *pdev;
>  	int err;
>
> +	if (!dmi_match(DMI_CHASSIS_VENDOR, "Mellanox Technologies Ltd."))
> +		return -ENODEV;
> +
>  	pdev = platform_device_register_simple(KBUILD_MODNAME, -1, NULL, 0);
>  	if (IS_ERR(pdev)) {
>  		pr_err("Device allocation failed\n");
> @@ -426,5 +429,5 @@ module_exit(mlxcpld_led_exit);
>
>  MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
>  MODULE_DESCRIPTION("Mellanox board LED driver");
> -MODULE_LICENSE("GPL v2");
> +MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_ALIAS("platform:leds_mlxcpld");
>

Thanks for the patch. Applied.

-- 
Best regards,
Jacek Anaszewski
