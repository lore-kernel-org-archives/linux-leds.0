From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Thu, 21 Mar 2019 08:20:34 +0000
Message-ID: <20190321082034.GR4731@dell>
References: <20190313123249.17258-1-dmurphy@ti.com>
 <20190313123249.17258-4-dmurphy@ti.com>
 <a7ee025e-361e-90b8-e38d-53546a542102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a7ee025e-361e-90b8-e38d-53546a542102@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, 20 Mar 2019, Jacek Anaszewski wrote:

> Hi Dan,
> 
> I have one minor issue below.
> 
> On 3/13/19 1:32 PM, Dan Murphy wrote:
> > Introduce the Texas Instruments LM3532 White LED driver.
> > The driver supports ALS configurability or manual brightness
> > control.
> > 
> > The driver also supports associating LED strings with specific
> > control banks in a group or as individually controlled strings.
> > 
> > Signed-off-by: Dan Murphy <dmurphy@ti.com>
> > ---
> > 
> > v4 - Updated code to DT doc changes appending "ti," to TI specific properties -
> > https://lore.kernel.org/patchwork/patch/1050124/
> > 
> > v3 - Removed switch case for register setting in favor of an algorithim (v1 comment),
> > https://lore.kernel.org/patchwork/patch/1049024/
> > v2 - Added look up tables for als_avg, als_imp and ramp times, fixed brightness
> > control when ALS is in control, added property value checks to ensure the values
> > are not out of bounds - https://lore.kernel.org/patchwork/patch/1048807/
> > 
> >   drivers/leds/Kconfig       |  10 +
> >   drivers/leds/Makefile      |   1 +
> >   drivers/leds/leds-lm3532.c | 681 +++++++++++++++++++++++++++++++++++++
> >   3 files changed, 692 insertions(+)
> >   create mode 100644 drivers/leds/leds-lm3532.c

[snip]

> > diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> > new file mode 100644
> > index 000000000000..e8a614d71469
> > --- /dev/null
> > +++ b/drivers/leds/leds-lm3532.c

[snip 700 lines of churn]

Jacek could you please trim your replies please?  It took way to long
to locate your one line comment in this 700 line patch.

> > +static int lm3532_remove(struct i2c_client *client)
> > +{
> > +	struct lm3532_data *drvdata = i2c_get_clientdata(client);
> mutex_destroy(&drvdata->lock);

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
