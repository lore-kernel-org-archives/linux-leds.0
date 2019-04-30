From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 4/7] leds: TI LMU: Add common code for TI LMU devices
Date: Tue, 30 Apr 2019 12:23:53 -0700
Message-ID: <7d161cbc-d6bd-83aa-3790-6c45fdf9521f@infradead.org>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-5-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430191730.19450-5-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 4/30/19 12:17 PM, Dan Murphy wrote:
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index da00b9ed5a5c..3ae24eaf4cde 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -776,6 +776,14 @@ config LEDS_NIC78BX
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-nic78bx.
>  
> +config LEDS_TI_LMU_COMMON
> +	tristate "LED driver for TI LMU"

what does LMU mean?

> +	depends on REGMAP
> +	help
> +          Say Y to enable the LED driver for TI LMU devices.
> +          This supports common features between the TI LM3532, LM3631, LM3632,
> +	  LM3633, LM3695 and LM3697.

Fix help indentation above to use tab + 2 spaces consistently.

>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"


thanks.
-- 
~Randy
