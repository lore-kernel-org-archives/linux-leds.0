From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] leds: pwm: silently error out on EPROBE_DEFER
Date: Fri, 07 Sep 2018 09:56:12 +0200
Message-ID: <1053e423d4ba8c1dd65468d278c79d2b7159401f.camel@baylibre.com>
References: <20180906135904.13803-1-jbrunet@baylibre.com>
         <20180906153548.GA10088@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906153548.GA10088@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, sre@kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, 2018-09-06 at 17:35 +0200, Pavel Machek wrote:
> On Thu 2018-09-06 15:59:04, Jerome Brunet wrote:
> > When probing, if we fail to get the pwm due to probe deferal, we shouldn't
> > print an error message. Just be silent in this case.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/leds/leds-pwm.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> > index df80c89ebe7f..5d3faae51d59 100644
> > --- a/drivers/leds/leds-pwm.c
> > +++ b/drivers/leds/leds-pwm.c
> > @@ -100,8 +100,9 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
> >  		led_data->pwm = devm_pwm_get(dev, led->name);
> >  	if (IS_ERR(led_data->pwm)) {
> >  		ret = PTR_ERR(led_data->pwm);
> > -		dev_err(dev, "unable to request PWM for %s: %d\n",
> > -			led->name, ret);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(dev, "unable to request PWM for %s: %d\n",
> > +				led->name, ret);
> >  		return ret;
> >  	}
> 
> Hmm, sometimes probing is deffered forever, and in such case debug
> message is useful.
> 
> Do you see excessive number of these?

About 10 but displaying an error which is not error is already excessive IMO.

There is nothing out of the ordinary here. Feel free to grep git log for
EPROBE_DEFER. Many drivers take this into account from the beginning now and
we've been fixing others in most subsystem.

> 									
> 									Pavel
