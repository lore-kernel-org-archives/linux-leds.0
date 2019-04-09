From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/6] regulator: lm363x: Make the gpio register enable
 flexible
Date: Tue, 9 Apr 2019 20:44:47 +0200
Message-ID: <1dcaa34b-cce6-63fc-5866-242c1757a4cb@gmail.com>
References: <20190405145540.27703-1-dmurphy@ti.com>
 <20190405145540.27703-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405145540.27703-2-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

Regulator maintainers should be added too.

On 4/5/19 4:55 PM, Dan Murphy wrote:
> The use of and enablement of the GPIO can be used across devices.
> Use the enable_reg in the regulator descriptor for the register to
> write.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/regulator/lm363x-regulator.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/lm363x-regulator.c b/drivers/regulator/lm363x-regulator.c
> index c876e161052a..382b1cecdd93 100644
> --- a/drivers/regulator/lm363x-regulator.c
> +++ b/drivers/regulator/lm363x-regulator.c
> @@ -263,8 +263,8 @@ static int lm363x_regulator_probe(struct platform_device *pdev)
>   
>   	if (gpiod) {
>   		cfg.ena_gpiod = gpiod;
> -
> -		ret = regmap_update_bits(regmap, LM3632_REG_BIAS_CONFIG,
> +		ret = regmap_update_bits(regmap,
> +					 lm363x_regulator_desc[id].enable_reg,
>   					 LM3632_EXT_EN_MASK,
>   					 LM3632_EXT_EN_MASK);
>   		if (ret) {
> 

-- 
Best regards,
Jacek Anaszewski
