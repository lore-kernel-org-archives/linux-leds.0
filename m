From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: blinkm: clean up double assignment to
 data->i2c_addr
Date: Tue, 2 Apr 2019 21:05:36 +0200
Message-ID: <7360f559-7260-48b5-029d-e12a19bd967f@gmail.com>
References: <20190330203757.8877-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190330203757.8877-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Jan-Simon Moeller <jansimon.moeller@gmx.de>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Colin,

Thank you for the patch.

On 3/30/19 9:37 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently data->i2c_addr is being assigned twice, first with the
> value 0x09 and then immediately afterwards with the value 0x08.
> The first assignment is redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/leds/leds-blinkm.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index 851c1920b63c..11b771fb933b 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -594,7 +594,6 @@ static int blinkm_probe(struct i2c_client *client,
>   		goto exit;
>   	}
>   
> -	data->i2c_addr = 0x09;
>   	data->i2c_addr = 0x08;
>   	/* i2c addr  - use fake addr of 0x08 initially (real is 0x09) */
>   	data->fw_ver = 0xfe;
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
