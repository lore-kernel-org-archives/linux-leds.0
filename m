Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ED75304DF;
	Thu, 15 Oct 2026 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073658; cv=none; b=ZI/ouuMS8FX9nfJ/w+Zd6NjVQFbd86sMKWsOxEV2rPO0nfHKrwsFSrCiv2pOgPNcO/34vj4GawAlhIHeiOIg4DkJMO/PIY/YmjSC6CPrFu/fwfiGYlZbhJHoAiQScoELwMv6xRy76Zrk0y3gyGkXBSj08eeN4ud7danQJTavKYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073658; c=relaxed/simple;
	bh=+O9W6AZt80HBczwy1tHdD4XbvpEEup1axg5kPUvUjGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bv++b6xkOGpVUm0cswrik+OwrZ3tErsUR4Ckd36oNA2kCsAhK3o/VUZzgJvjT4LxLn7bKTV1HHboU07FvjgsQcO8uyDfYlJJvj7kFD7GNJEuW87VJniOx5Tt+Kp+glEHzqD7lWn08Y2jpmznqUNwubw53XgEdA/bM0WGjJwBj/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBlHxE1p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBlHxE1p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F8B1F000C8;
	Thu, 15 Oct 2026 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792073656;
	bh=tWOzo0S9csVjulY/BLmnGqFe5AAYTQ6iP4hdWSkYo4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RBlHxE1pGvb85vZYrZz8Y9vIQuBnRCudsmGV6hP3PfTZ3ZMvh5n7UjcWeqHMyUPgY
	 lZ+SF7KFOKhcycCuH4V9UewfPPc8bPn6xya9PQTwRQB8b2y/h3v4UjwY1i/+KKhydO
	 4TtgjAaomc1e8cdkErrf6zZ/p3uDgTV8dBWL7Get+tlY6m6tk8uu4S9svPpaj16qaw
	 qfjYd96B10f+i+chO9A3W0R/zxyGLAK3sks8vi1tix7CSdnS7V5g7m1ng48OMiLp8z
	 S6PrNyfphqJTBy/pFsaj7ySjQEE5JDOQv9rtHkakIhmIczfIHHWWOOtrwDuFVjGEms
	 Z3WrjdVEPyaEQ==
Date: Thu, 15 Oct 2026 15:14:13 +0100
From: Lee Jones <lee@kernel.org>
To: plaztininikolai@gmail.com
Cc: Pavel Machek <pavel@kernel.org>, Hans de Goede <hansg@kernel.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] leds: triggers: Add led_trigger_walk_leds()
Message-ID: <20261015141413.GB1907748@google.com>
References: <20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com>
 <20260930-leds-input-events-brightness-v2-1-3948d3cddd83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-leds-input-events-brightness-v2-1-3948d3cddd83@gmail.com>

On Wed, 30 Sep 2026, Nikolay Plastinin via B4 Relay wrote:

> From: Nikolay Plastinin <plaztininikolai@gmail.com>
> 
> led_trigger_event() sets one brightness for all LEDs using a trigger.
> A trigger which restores a different brightness per LED, such as the
> input-events trigger turning keyboard backlights back on at the level
> the user picked, needs to walk the trigger's LEDs itself. That means
> using trig->led_cdevs and led_cdev->trig_list outside the LED core.
> 
> Add led_trigger_walk_leds(), which calls a function for each LED
> using the trigger under rcu_read_lock(), the same way led_trigger_event()
> does, so that such triggers do not have to walk the list themselves.
> 
> Assisted-by: LLM
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
> ---
>  drivers/leds/led-triggers.c | 25 +++++++++++++++++++++++++
>  include/linux/leds.h        |  7 +++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index b1223218b..b5fc14e47 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -422,6 +422,31 @@ void led_trigger_event(struct led_trigger *trig,
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_event);
>  
> +/**
> + * led_trigger_walk_leds - call a function for each LED using a trigger
> + * @trig: the trigger, may be NULL
> + * @fn: the function to call for each LED
> + * @data: pointer passed to @fn
> + *
> + * Walks the LEDs currently using @trig under rcu_read_lock() and calls @fn
> + * for each of them. This is for triggers which set a different brightness
> + * per LED, where led_trigger_event() is not enough. @fn must not sleep.
> + */
> +void led_trigger_walk_leds(struct led_trigger *trig, led_trigger_walk_fn_t fn,
> +			   void *data)

I'm really not keen on pointers to functions being passed as function
arguments.

What about a simple iterator macro in 'include/linux/leds.h' which
results in no new exported functions, no callbacks, no 'typedef', and no
'void *' casting.

#define led_trigger_for_each_led(pos, trig) \
    list_for_each_entry_rcu(pos, &(trig)->led_cdevs, trig_list)

Then in Patch 2, 'input_events_set_leds(bool on)' doesn't need to be split into
two functions or pack 'bool on' into 'void *arg'.  It just does:

    guard(rcu)();
    led_trigger_for_each_led(led_cdev, &input_events_trigger) { }

When turning the LEDs off in Patch 2, it could even just call
led_trigger_event(&input_events_trigger, LED_OFF) directly or handle
both branches right inside that single loop.

> +{
> +	struct led_classdev *led_cdev;
> +
> +	if (!trig)
> +		return;
> +
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list)
> +		fn(led_cdev, data);
> +	rcu_read_unlock();
> +}
> +EXPORT_SYMBOL_GPL(led_trigger_walk_leds);
> +
>  void led_mc_trigger_event(struct led_trigger *trig,
>  			  unsigned int *intensity_value, unsigned int num_colors,
>  			  enum led_brightness brightness)
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index a515f075c..c971a6aa5 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -476,6 +476,9 @@ static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
>  #define DEFINE_LED_TRIGGER(x)		static struct led_trigger *x;
>  #define DEFINE_LED_TRIGGER_GLOBAL(x)	struct led_trigger *x;
>  
> +/* Callback for led_trigger_walk_leds() */
> +typedef void (*led_trigger_walk_fn_t)(struct led_classdev *led_cdev, void *data);
> +
>  #ifdef CONFIG_LEDS_TRIGGERS
>  
>  #define TRIG_NAME_MAX 50
> @@ -521,6 +524,8 @@ void led_trigger_register_simple(const char *name,
>  				struct led_trigger **trigger);
>  void led_trigger_unregister_simple(struct led_trigger *trigger);
>  void led_trigger_event(struct led_trigger *trigger,  enum led_brightness event);
> +void led_trigger_walk_leds(struct led_trigger *trig, led_trigger_walk_fn_t fn,
> +			   void *data);
>  void led_mc_trigger_event(struct led_trigger *trig,
>  			  unsigned int *intensity_value, unsigned int num_colors,
>  			  enum led_brightness brightness);
> @@ -566,6 +571,8 @@ static inline void led_trigger_register_simple(const char *name,
>  static inline void led_trigger_unregister_simple(struct led_trigger *trigger) {}
>  static inline void led_trigger_event(struct led_trigger *trigger,
>  				enum led_brightness event) {}
> +static inline void led_trigger_walk_leds(struct led_trigger *trig,
> +					 led_trigger_walk_fn_t fn, void *data) {}
>  static inline void led_mc_trigger_event(struct led_trigger *trig,
>  				unsigned int *intensity_value, unsigned int num_colors,
>  				enum led_brightness brightness) {}
> 
> -- 
> 2.55.0
> 
> 

-- 
Lee Jones
