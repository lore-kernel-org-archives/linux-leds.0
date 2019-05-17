From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] ledtrig-gpio: 0 is a valid GPIO number
Date: Fri, 17 May 2019 08:27:36 +0200
Message-ID: <20190517062736.bh46ozfiux7xvnox@pengutronix.de>
References: <20190516214209.139726-1-kunyi@google.com>
 <20190516214209.139726-3-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190516214209.139726-3-kunyi@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kun Yi <kunyi@google.com>
Cc: linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, May 16, 2019 at 02:42:09PM -0700, Kun Yi wrote:
> GPIO number 0 is a valid case to handle. Use -1 as initial value
> and use gpio_is_valid() to determine validity of the GPIO
> number.

I think it's more sensible to convert to gpiod instead.

Best regards
Uwe

> Signed-off-by: Kun Yi <kunyi@google.com>
> Change-Id: I4a29f98b237fd0d8ba4dd2a28219d4429f2ccfff
> ---
>  drivers/leds/trigger/ledtrig-gpio.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
> index f6d50e031492..48d8ef8538bd 100644
> --- a/drivers/leds/trigger/ledtrig-gpio.c
> +++ b/drivers/leds/trigger/ledtrig-gpio.c
> @@ -22,7 +22,7 @@ struct gpio_trig_data {
>  
>  	unsigned desired_brightness;	/* desired brightness when led is on */
>  	unsigned inverted;		/* true when gpio is inverted */
> -	unsigned gpio;			/* gpio that triggers the leds */
> +	int gpio;			/* gpio that triggers the leds */
>  };
>  
>  static irqreturn_t gpio_trig_irq(int irq, void *_led)
> @@ -114,13 +114,12 @@ static ssize_t gpio_trig_gpio_show(struct device *dev,
>  {
>  	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
>  
> -	return sprintf(buf, "%u\n", gpio_data->gpio);
> +	return sprintf(buf, "%d\n", gpio_data->gpio);
>  }
>  
> -static inline void free_used_gpio_if_valid(unsigned int gpio,
> -					   struct led_classdev *led)
> +static inline void free_used_gpio_if_valid(int gpio, struct led_classdev *led)
>  {
> -	if (gpio == 0)
> +	if (!gpio_is_valid(gpio))
>  		return;
>  
>  	free_irq(gpio_to_irq(gpio), led);
> @@ -144,12 +143,6 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
>  	if (gpio_data->gpio == gpio)
>  		return n;
>  
> -	if (!gpio) {
> -		free_used_gpio_if_valid(gpio_data->gpio, led);
> -		gpio_data->gpio = 0;
> -		return n;
> -	}
> -
>  	ret = gpio_request(gpio, "ledtrig-gpio");
>  	if (ret) {
>  		dev_err(dev, "gpio_request failed with error %d\n", ret);
> @@ -195,6 +188,7 @@ static int gpio_trig_activate(struct led_classdev *led)
>  		return -ENOMEM;
>  
>  	gpio_data->led = led;
> +	gpio_data->gpio = -1;
>  	led_set_trigger_data(led, gpio_data);
>  
>  	return 0;
> -- 
> 2.21.0.1020.gf2820cf01a-goog
> 
> 

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
