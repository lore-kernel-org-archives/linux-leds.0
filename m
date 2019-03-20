From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/2] mfd: Add leds MFD cell for intel_soc_pmic_chtwc
Date: Wed, 20 Mar 2019 09:56:48 +0000
Message-ID: <20190320095648.GI4731@dell>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-3-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212205901.13037-3-jekhor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-leds@vger.kernel.org

On Tue, 12 Feb 2019, Yauhen Kharuzhy wrote:

> Add MFD cell for LEDs driver to the Intel Cherry Trail Whiskey Cove PMIC
> mfd device driver.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  drivers/mfd/intel_soc_pmic_chtwc.c | 1 +
>  1 file changed, 1 insertion(+)

I'll fix up the subject line for you.

In future, please do the following to see what is expected:

  git log --oneline -- <subsystem>

> diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
> index 64a3aece9c5e..be84bb2aa837 100644
> --- a/drivers/mfd/intel_soc_pmic_chtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_chtwc.c
> @@ -60,6 +60,7 @@ static struct mfd_cell cht_wc_dev[] = {
>  		.resources = cht_wc_ext_charger_resources,
>  	},
>  	{	.name = "cht_wcove_region", },
> +	{	.name = "cht_wcove_leds", },
>  };
>  
>  /*

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
