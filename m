From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH RESEND] leds:lp55xx: fix firmware loading error
Date: Mon, 29 Jun 2015 16:58:05 +0200
Message-ID: <55915CFD.2000801@samsung.com>
References: <1435538354-4332-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:11261 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753026AbbF2O6J (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jun 2015 10:58:09 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NQP009SWO8V9G70@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 29 Jun 2015 15:58:07 +0100 (BST)
In-reply-to: <1435538354-4332-1-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: cooloney@gmail.com, linux-leds@vger.kernel.org

Hi Milo,

Thanks for the update.

On 06/29/2015 02:39 AM, Milo Kim wrote:
> LP55xx driver uses not firmware file but raw data to load program through
> the firmware interface.(Documents/leds/leds-lp55xx.txt)
>
>    For example, here is how to run blinking green channel pattern.
>    (The second engine is seleted and MUX is mapped to 'RGB' mode)
>    echo 2 > /sys/bus/i2c/devices/xxxx/select_engine
>    echo "RGB" > /sys/bus/i2c/devices/xxxx/engine_mux
>    echo 1 > /sys/class/firmware/lp5562/loading
>    echo "4000600040FF6000" > /sys/class/firmware/lp5562/data
>    echo 0 > /sys/class/firmware/lp5562/loading
>    echo 1 > /sys/bus/i2c/devices/xxxx/run_engine
>
> However, '/sys/class/firmware/<device name>' is not created after the
> firmware loader user helper was introduced.
> This feature is used in the case below.
>
>    As soon as the firmware download is requested by the driver, firmware
>    class subsystem tries to find the binary file.
>    If it gets failed, then it just falls back to user helper to load
>    raw data manually. Here, you can see the device file under
>    /sys/class/firmware/.
>
> To make it happen, LP55xx driver requires two configurations.
>
>    1. Enable CONFIG_FW_LOADER_USER_HELPER_FALLBACK in Kconfig
>    2. Set option, 'FW_OPT_USERHELPER' on requesting the firmware data.
>       It means the second option should be 'false' in
>       request_firmware_nowait().
>       This option enables to load firmware data manually by calling
>       fw_load_from_user_helper().
>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> ---
>   drivers/leds/Kconfig              | 1 +
>   drivers/leds/leds-lp55xx-common.c | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 966b960..a39d608 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -206,6 +206,7 @@ config LEDS_LP55XX_COMMON
>   	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>   	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>   	select FW_LOADER
> +	select FW_LOADER_USER_HELPER_FALLBACK
>   	help
>   	  This option supports common operations for LP5521/5523/55231/5562/8501
>   	  devices.
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 77c26bc..96d51e9 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -223,7 +223,7 @@ static int lp55xx_request_firmware(struct lp55xx_chip *chip)
>   	const char *name = chip->cl->name;
>   	struct device *dev = &chip->cl->dev;
>
> -	return request_firmware_nowait(THIS_MODULE, true, name, dev,
> +	return request_firmware_nowait(THIS_MODULE, false, name, dev,
>   				GFP_KERNEL, chip, lp55xx_firmware_loaded);
>   }
>
>

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
