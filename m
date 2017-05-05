From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 3/3]: Add build support PCEngines APU1/APU2 drivers
Date: Fri, 5 May 2017 22:05:51 +0200
Message-ID: <1312d519-eb1e-f628-5796-c690be9350ce@gmail.com>
References: <52d5bb5e-8992-caab-d59d-4935d36f37da@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34090 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751104AbdEEUGg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 May 2017 16:06:36 -0400
Received: by mail-wm0-f66.google.com with SMTP id z129so3362950wmb.1
        for <linux-leds@vger.kernel.org>; Fri, 05 May 2017 13:06:36 -0700 (PDT)
In-Reply-To: <52d5bb5e-8992-caab-d59d-4935d36f37da@gmx.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Luigi Baldoni <aloisio@gmx.com>, linux-leds@vger.kernel.org

Hi Luigi,

On 05/04/2017 01:00 PM, Luigi Baldoni wrote:
> This patch adds build support for PCEngines APU1/APU2 LEDs drivers.
> 
> Signed-off-by: Christian Herzog <daduke@daduke.org>
> 
> ---
>  drivers/leds/Kconfig     |   22 ++++
>  drivers/leds/Makefile    |    2
>  2 files changed, 24 insertions(+)
> 
> Index: b/drivers/leds/Kconfig
> ===================================================================
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -694,6 +694,28 @@ config LEDS_NIC78BX
>        To compile this driver as a module, choose M here: the module
>        will be called leds-nic78bx.
> 
> +config LEDS_APU
> +    tristate "Front LED support for pcengines apu boards"
> +    depends on LEDS_CLASS
> +    depends on X86 && DMI
> +    help
> +      This driver makes the pcengines apu front LEDs accessible from
> +      userspace programs through the leds subsystem.
> +
> +      To compile this driver as a module, choose M here: the
> +      module will be called leds-apu.
> +
> +config LEDS_APU2
> +    tristate "Front LED support for pcengines apu2 boards"
> +    depends on LEDS_CLASS
> +    depends on X86 && DMI
> +    help
> +      This driver makes the pcengines apu2 front LEDs accessible from
> +      userspace programs through the leds subsystem.
> +
> +      To compile this driver as a module, choose M here: the
> +      module will be called leds-apu2.
> +
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
> 
> Index: b/drivers/leds/Makefile
> ===================================================================
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -73,6 +73,8 @@ obj-$(CONFIG_LEDS_PM8058)        += leds-pm805
>  obj-$(CONFIG_LEDS_MLXCPLD)        += leds-mlxcpld.o
>  obj-$(CONFIG_LEDS_NIC78BX)        += leds-nic78bx.o
>  obj-$(CONFIG_LEDS_MT6323)        += leds-mt6323.o
> +obj-$(CONFIG_LEDS_APU)            += leds-apu.o
> +obj-$(CONFIG_LEDS_APU2)            += leds-apu2.o
> 
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_DAC124S085)        += leds-dac124s085.o
> 

Please don't split Kconfig and Makefile modifications from the driver,
since it would break bisect and doesn't have logical justification.

-- 
Best regards,
Jacek Anaszewski
