From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED driver
Date: Mon, 20 May 2019 21:54:39 +0200
Message-ID: <77f1ed5b-bfd2-510c-edd5-1b702f2d1d45@gmail.com>
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-7-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507201159.13940-7-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc: lee.jones@linaro.org, rdunlap@infradead.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

On 5/7/19 10:11 PM, Dan Murphy wrote:
> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
> MFD driver to probe this LED driver.  The driver configures only the
> LED registers and enables the outputs according to the config file.
> 
> The driver utilizes the TI LMU (Lighting Management Unit) LED common
> framework to set the brightness bits.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/leds/Kconfig        |   7 ++
>   drivers/leds/Makefile       |   1 +
>   drivers/leds/leds-lm36274.c | 174 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 182 insertions(+)
>   create mode 100644 drivers/leds/leds-lm36274.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 255fdd5e8491..db83a3feca01 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -791,6 +791,13 @@ config LEDS_LM3697
>   	  Say Y to enable the LM3697 LED driver for TI LMU devices.
>   	  This supports the LED device LM3697.
>   
> +config LEDS_LM36274
> +	tristate "LED driver for LM36274"
> +	depends on LEDS_TI_LMU_COMMON

Shouldn't we have "depends on MFD_TI_LMU" as well here?

> +	help
> +	  Say Y to enable the LM36274 LED driver for TI LMU devices.
> +	  This supports the LED device LM36274.

-- 
Best regards,
Jacek Anaszewski
