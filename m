From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] mfd: Add leds MFD cell for intel_soc_pmic_chtwc
Date: Tue, 12 Feb 2019 08:14:09 +0000
Message-ID: <20190212081409.GN20638@dell>
References: <20190209221213.24052-1-jekhor@gmail.com>
 <20190209221213.24052-3-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190209221213.24052-3-jekhor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-leds@vger.kernel.org

On Sun, 10 Feb 2019, Yauhen Kharuzhy wrote:

> Add MFD cell for LEDs driver to the Intel Cherry Trail Whiskey Cove PMIC
> mfd device driver.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  drivers/mfd/intel_soc_pmic_chtwc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
> index 64a3aece9c5e..68b54173edd8 100644
> --- a/drivers/mfd/intel_soc_pmic_chtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_chtwc.c
> @@ -60,6 +60,8 @@ static struct mfd_cell cht_wc_dev[] = {
>  		.resources = cht_wc_ext_charger_resources,
>  	},
>  	{	.name = "cht_wcove_region", },
> +

Nit: No need for the blank line, please remove it.

> +	{	.name = "cht_wcove_leds", },
>  };
>  
>  /*

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
