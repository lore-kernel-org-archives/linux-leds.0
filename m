From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/2] leds: core: Introduce LED pattern trigger
Date: Thu, 2 Aug 2018 14:53:40 -0700
Message-ID: <20180802215340.GP30024@minitux>
References: <1bf9aed83d1756dd4f81590297ce7e0b9972bf85.1533112637.git.baolin.wang@linaro.org>
 <34c87589-ccaf-e541-7acb-efcf3bd306f6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <34c87589-ccaf-e541-7acb-efcf3bd306f6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, pavel@ucw.cz, rteysseyre@gmail.com, david@lechnology.com, broonie@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu 02 Aug 14:21 PDT 2018, Jacek Anaszewski wrote:
> On 08/01/2018 11:01 AM, Baolin Wang wrote:
[..]
> > diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
[..]
> > +static ssize_t pattern_trig_store_pattern(struct device *dev,
> > +					  struct device_attribute *attr,
> > +					  const char *buf, size_t count)
> > +{
> > +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> > +	struct pattern_trig_data *data = led_cdev->trigger_data;
> > +	int cr, ccount, offset = 0, err = 0;
> > +
> > +	if (!data->hardware_pattern)
> > +		del_timer_sync(&data->timer);
> > +
> > +	mutex_lock(&data->lock);
> > +
> > +	data->npatterns = 0;
> > +	while (offset < count - 1 && data->npatterns < MAX_PATTERNS) {
> > +		cr = 0;
> > +		ccount = sscanf(buf + offset, "%d %d " PATTERN_SEPARATOR "%n",
> > +				&data->patterns[data->npatterns].brightness,
> > +				&data->patterns[data->npatterns].delta_t, &cr);
> 
> In case user makes a typo while constructing list of pattern tuples,
> e.g. he forgets a comma, the pattern gets silently truncated.
> 
> User is able to detect the truncation by reading pattern file,
> but it is not an immediate feedback anyway.
> 

I agree, a failure to parse the entire pattern should result in an error
returned, rather than just silently truncating the pattern.

> I propose that pattern format should require number of tuples in the
> first position which would allow to get rid of this ambiguity, since
> we could verify if the number of parsed tuples is as intended.
> 

I would prefer to see that we check that we have consumed the entire
input (accepting optional \n end), rather than having to prepend a count
to the string...

Regards,
Bjorn
