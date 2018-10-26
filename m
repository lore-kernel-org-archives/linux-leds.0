From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: More checks for patterns? was: Fix pattern handling
 optimalization
Date: Fri, 26 Oct 2018 21:56:51 +0200
Message-ID: <216b2cb8-dd3e-6849-8643-ab5aef92c7a8@gmail.com>
References: <9794969ab8a5a6f62d8ac54cdebcaa3caedfc6d6.1539230481.git.baolin.wang@linaro.org>
 <d90397dd-429f-4f3f-307c-b69dccc360e0@gmail.com> <20181024083143.GA24165@amd>
 <bdadda71-f919-b6a6-4e1c-f87ed298b6b5@gmail.com> <20181024204439.GA32300@amd>
 <79c29d20-ae6a-4a12-28fa-93d7305a0623@gmail.com> <20181025212429.GB18016@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025212429.GB18016@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 10/25/2018 11:24 PM, Pavel Machek wrote:
> 
> We don't want brightness < 0, but this may not be best way to do
> this. We also don't want brightness > max_brightness, but I'm not sure
> this check is effective.
> 
> We probably also don't want pattern where all the delta_t s are zero.
> 
> I came up with this so far....
>    	    	       	    	    	      	  	    Pavel
> 
> 
> 
> diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
> index ce7acd1..bc5f495 100644
> --- a/drivers/leds/trigger/ledtrig-pattern.c
> +++ b/drivers/leds/trigger/ledtrig-pattern.c
> @@ -250,9 +251,16 @@ static ssize_t pattern_trig_store_patterns(struct led_classdev *led_cdev,
>  
>  	while (offset < count - 1 && data->npatterns < MAX_PATTERNS) {
>  		cr = 0;
> -		ccount = sscanf(buf + offset, "%d %u %n",
> +		ccount = sscanf(buf + offset, "%u %u %n",
>  				&data->patterns[data->npatterns].brightness,
>  				&data->patterns[data->npatterns].delta_t, &cr);
> +
> +		if (data->patterns[data->npatterns].brightness > data->led_cdev->max_brightness) {
> +			data->npatterns = 0;
> +			err = -EINVAL;

We don't fail on attempt of setting brightness > max_brightness, but
only truncate it. In this case we could do the same for consistency.

> +			goto out;
> +		}
> +			 
>  		if (ccount != 2) {
>  			data->npatterns = 0;
>  			err = -EINVAL;
> 
> 
> 
> 

-- 
Best regards,
Jacek Anaszewski
