From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 2/2] mfd: Add leds MFD cell for intel_soc_pmic_chtwc
Date: Wed, 13 Feb 2019 22:24:58 +0100
Message-ID: <7a27f294-aa91-e742-0c05-f36bece2fba5@gmail.com>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-3-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212205901.13037-3-jekhor@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

Cc Lee.

On 2/12/19 9:59 PM, Yauhen Kharuzhy wrote:
> Add MFD cell for LEDs driver to the Intel Cherry Trail Whiskey Cove PMIC
> mfd device driver.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>   drivers/mfd/intel_soc_pmic_chtwc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
> index 64a3aece9c5e..be84bb2aa837 100644
> --- a/drivers/mfd/intel_soc_pmic_chtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_chtwc.c
> @@ -60,6 +60,7 @@ static struct mfd_cell cht_wc_dev[] = {
>   		.resources = cht_wc_ext_charger_resources,
>   	},
>   	{	.name = "cht_wcove_region", },
> +	{	.name = "cht_wcove_leds", },
>   };
>   
>   /*
> 

-- 
Best regards,
Jacek Anaszewski
