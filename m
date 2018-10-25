From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] Fix pattern handling optimalization
Date: Thu, 25 Oct 2018 21:17:45 +0200
Message-ID: <79c29d20-ae6a-4a12-28fa-93d7305a0623@gmail.com>
References: <9794969ab8a5a6f62d8ac54cdebcaa3caedfc6d6.1539230481.git.baolin.wang@linaro.org>
 <d90397dd-429f-4f3f-307c-b69dccc360e0@gmail.com> <20181024083143.GA24165@amd>
 <bdadda71-f919-b6a6-4e1c-f87ed298b6b5@gmail.com> <20181024204439.GA32300@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024204439.GA32300@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel.

Thank you for the patch.

On 10/24/2018 10:44 PM, Pavel Machek wrote:
> 
> Check for zero duration before skipping step. This fixes pattern
>     
>     echo "0 1000 10 2550 0 1000" > pattern
>     
> which should do [  .-xXx-.] but does [   Xx-.]
>     
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> 
> diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
> index ce7acd1..bc5f495 100644
> --- a/drivers/leds/trigger/ledtrig-pattern.c
> +++ b/drivers/leds/trigger/ledtrig-pattern.c
> @@ -87,9 +87,10 @@ static void pattern_trig_timer_function(struct timer_list *t)
>  					   data->curr->brightness);
>  			mod_timer(&data->timer,
>  				  jiffies + msecs_to_jiffies(data->curr->delta_t));
> -
> -			/* Skip the tuple with zero duration */
> -			pattern_trig_update_patterns(data);
> +			if (!data->next->delta_t) {
> +				/* Skip the tuple with zero duration */
> +				pattern_trig_update_patterns(data);
> +			}
>  			/* Select next tuple */
>  			pattern_trig_update_patterns(data);
>  		} else {
> 

Yep, it fixes the issue.

Applied to the fixes-for-4.20-rc2 branch of linux-leds.git

-- 
Best regards,
Jacek Anaszewski
