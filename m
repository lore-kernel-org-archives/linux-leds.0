From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: fix a missing check of return value of lp55xx_read
Date: Fri, 28 Dec 2018 17:52:27 +0100
Message-ID: <333a5518-ad9d-868c-a5b6-731e10c053ea@gmail.com>
References: <20181226041823.73950-1-kjlu@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181226041823.73950-1-kjlu@umn.edu>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kangjie Lu <kjlu@umn.edu>
Cc: pakki001@umn.edu, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Kangjie,

Thank you for the patch.

On 12/26/18 5:18 AM, Kangjie Lu wrote:
> When lp55xx_read() fails, "status" is an uninitialized variable and thus
> may contain random value; using it leads to undefined behaviors.
> 
> The fix inserts a check for the return value of lp55xx_read: if it
> fails, returns with its error code.
> 
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> ---
>   drivers/leds/leds-lp5523.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index a2e74feee2b2..fd64df5a57a5 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -318,7 +318,9 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
>   
>   	/* Let the programs run for couple of ms and check the engine status */
>   	usleep_range(3000, 6000);
> -	lp55xx_read(chip, LP5523_REG_STATUS, &status);
> +	ret = lp55xx_read(chip, LP5523_REG_STATUS, &status);
> +	if (ret)
> +		return ret;
>   	status &= LP5523_ENG_STATUS_MASK;
>   
>   	if (status != LP5523_ENG_STATUS_MASK) {
> 

Applied to fixes-for-4.21 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
