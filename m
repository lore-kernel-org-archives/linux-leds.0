From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/2] leds: tlc59116: Driver for the TI 16 Channel i2c LED
 driver
Date: Fri, 9 Jan 2015 14:58:43 +0100
Message-ID: <20150109135843.GA11399@lunn.ch>
References: <1420763178-10115-1-git-send-email-andrew@lunn.ch>
 <1420763178-10115-3-git-send-email-andrew@lunn.ch>
 <op.xr64e8gt2s3iss@ecaz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <op.xr64e8gt2s3iss@ecaz>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthew.Fatheree-REUqjI8E1xrQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Fri, Jan 09, 2015 at 01:46:10PM +0100, Imre Kaloz wrote:
> Hi Andrew,
> 
> On Fri, 09 Jan 2015 01:26:18 +0100, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> 
> >The TLC59116 is an I2C bus controlled 16-channel LED driver.  Each LED
> >output has its own 8-bit fixed-frequency PWM controller to control the
> >brightness of the LED.
> >
> >This is based on a driver from Belkin, but has been extensively
> >rewritten.
> >
> <snip>
> 
> >+config LEDS_TLC59116
> >+	tristate "LED driver for TLC59116F controllers"
> >+	depends on LEDS_CLASS && I2C
> 
> I think you need "select REGMAP_I2C" as well.

Yes, you are right.

Thanks
	Andrew

> 
> >+	help
> >+	  This option enables support for Texas Instruments TLC59116F
> >+	  LED controller.
> >+
> > config LEDS_MAX8997
> > 	tristate "LED support for MAX8997 PMIC"
> > 	depends on LEDS_CLASS && MFD_MAX8997
> 
> 
> 
> Imre
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
