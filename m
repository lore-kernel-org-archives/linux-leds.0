From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH][V2] leds: TI LMU: fix u8 variable comparisons with less
 than zero
Date: Wed, 22 May 2019 22:48:44 +0200
Message-ID: <1dab790f-0b82-5fac-2081-7943379ccc54@gmail.com>
References: <20190522101745.21828-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522101745.21828-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Colin,

Thank you for the patch.

On 5/22/19 12:17 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The u8 variables ramp_ups and ramp_downs are being compared to less
> than zero, this will always be false.  Fix this by making the ramp
> variables ints.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 9a8e66ebeaa2 ("leds: TI LMU: Add common code for TI LMU devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: make u8 vars ints rather than removing the comparison. Thanks once
> more to Dan Carpenter for spotting my clearly stupid V1 version and
> correcting my mistake.
> 
> ---
>   drivers/leds/leds-ti-lmu-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
> index adc7293004f1..c9ab40d5a6ba 100644
> --- a/drivers/leds/leds-ti-lmu-common.c
> +++ b/drivers/leds/leds-ti-lmu-common.c
> @@ -84,7 +84,7 @@ static int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
>   int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
>   {
>   	struct regmap *regmap = lmu_bank->regmap;
> -	u8 ramp, ramp_up, ramp_down;
> +	int ramp, ramp_up, ramp_down;
>   
>   	if (lmu_bank->ramp_up_usec == 0 && lmu_bank->ramp_down_usec == 0) {
>   		ramp_up = 0;
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
