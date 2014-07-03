From: Peter Meerwald <pmeerw@pmeerw.net>
Subject: Re: [PATCH 1/2] leds:pca963x: Add support for PCA9635 LED driver
 chip
Date: Thu, 3 Jul 2014 07:38:54 +0200 (CEST)
Message-ID: <alpine.DEB.2.01.1407030732380.13292@pmeerw.net>
References: <1404288046-26661-1-git-send-email-pmeerw@pmeerw.net> <CAK5ve-Kt_jLoeSZxRRDn9p3Pv95_eaHnJ2=MfaoNVfpYYHD76Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ns.pmeerw.net ([87.118.82.44]:38591 "EHLO pmeerw.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750817AbaGCFi4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 3 Jul 2014 01:38:56 -0400
In-Reply-To: <CAK5ve-Kt_jLoeSZxRRDn9p3Pv95_eaHnJ2=MfaoNVfpYYHD76Q@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>

Hello Bryan,

thanks you for reviewing; my reply below

regards, p.

> > supports 16 PWM-controlled LEDs
> >
> > Signed-off-by: Peter Meerwald <pmeerw@pmeerw.net>
> > ---
> >  drivers/leds/leds-pca963x.c |   18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> > index 82589c0..70e3825 100644
> > --- a/drivers/leds/leds-pca963x.c
> > +++ b/drivers/leds/leds-pca963x.c
> > @@ -12,7 +12,7 @@
> >   * directory of this archive for more details.
> >   *
> >   * LED driver for the PCA9633 I2C LED driver (7-bit slave address 0x62)
> > - * LED driver for the PCA9634 I2C LED driver (7-bit slave address set by hw.)
> > + * LED driver for the PCA9634/5 I2C LED driver (7-bit slave address set by hw.)
> >   *
> >   * Note that hardware blinking violates the leds infrastructure driver
> >   * interface since the hardware only supports blinking all LEDs with the
> > @@ -52,6 +52,7 @@
> >  enum pca963x_type {
> >         pca9633,
> >         pca9634,
> > +       pca9635,
> >  };
> >
> >  struct pca963x_chipdef {
> > @@ -74,6 +75,12 @@ static struct pca963x_chipdef pca963x_chipdefs[] = {
> >                 .ledout_base    = 0xc,
> >                 .n_leds         = 8,
> >         },
> > +       [pca9635] = {
> > +               .grppwm         = 0x12,
> > +               .grpfreq        = 0x13,
> > +               .ledout_base    = 0x14,
> > +               .n_leds         = 16,
> > +       },
> >  };
> >
> >  /* Total blink period in milliseconds */
> > @@ -84,6 +91,7 @@ static const struct i2c_device_id pca963x_id[] = {
> >         { "pca9632", pca9633 },
> >         { "pca9633", pca9633 },
> >         { "pca9634", pca9634 },
> > +       { "pca9635", pca9635 },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(i2c, pca963x_id);
> > @@ -107,7 +115,7 @@ struct pca963x_led {
> >         struct work_struct work;
> >         enum led_brightness brightness;
> >         struct led_classdev led_cdev;
> > -       int led_num; /* 0 .. 7 potentially */
> > +       int led_num; /* 0 .. 15 potentially */
> >         enum pca963x_cmd cmd;
> >         char name[32];
> >         u8 gdc;
> > @@ -321,6 +329,7 @@ static const struct of_device_id of_pca963x_match[] = {
> >         { .compatible = "nxp,pca9632", },
> >         { .compatible = "nxp,pca9633", },
> >         { .compatible = "nxp,pca9634", },
> > +       { .compatible = "nxp,pca9635", },
> >         {},
> >  };
> >  #else
> > @@ -375,9 +384,8 @@ static int pca963x_probe(struct i2c_client *client,
> >         pca963x_chip->leds = pca963x;
> >
> >         /* Turn off LEDs by default*/
> > -       i2c_smbus_write_byte_data(client, chip->ledout_base, 0x00);
> > -       if (chip->n_leds > 4)
> > -               i2c_smbus_write_byte_data(client, chip->ledout_base + 1, 0x00);
> > +       for (i = 0; i < chip->n_leds; i++)
> > +               i2c_smbus_write_byte_data(client, chip->ledout_base + i, 0x00);
> >
> 
> This change looks like a bug fixing. The previous one just turn off
> the first and the second LEDs.
> 
> If yes, please add some description into the commit message.

the LEDOUT registers have two status bits for each LED, hence for 16 LEDs 
4 such registers are needed; the code just becomes more generic by using a 
loop

the line
      for (i = 0; i < chip->n_leds; i++)
should have been
      for (i = 0; i < chip->n_leds / 4; i++)

I'll send out a v2

> >         for (i = 0; i < chip->n_leds; i++) {
> >                 pca963x[i].led_num = i;
> > --
> > 1.7.9.5
> >
> 

-- 

Peter Meerwald
+43-664-2444418 (mobile)
