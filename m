From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv6 0/2] Driver for TI tlc591xx 8/16 Channel i2c LED driver
Date: Fri, 6 Feb 2015 04:10:48 +0100
Message-ID: <20150206031048.GA9614@lunn.ch>
References: <1422367161-16487-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422367161-16487-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, vigneshr-l0cyMroinI0@public.gmane.org, Matthew.Fatheree-REUqjI8E1xrQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Tue, Jan 27, 2015 at 02:59:19PM +0100, Andrew Lunn wrote:
> This patchset is a driver for the TI tlc59116 16 Channel i2c LED
> driver and tlc59108 8 Channel i2c LED driver. This driver is used on
> the Belkin WRT1900AC access point and the C code is derived from code
> Belkin contributed to OpenWRT.  However it has been extensively
> re-written, and a device tree binding added to replace platform data.

Hi Bryan

Do you have any further comments on this driver? Are you likely to
queue it up for the next merge window?

      Thanks
	Andrew


> 
> Cc: Matthew.Fatheree-REUqjI8E1xrQT0dZR+AlfA@public.gmane.org
> 
> Since v5:
>       Hard code number of LEDs, rather than #define
>       Moved common fields from led into priv
>       Moved reg_ledout into priv, removed helper functions
>       Cache brightness to avoid race conditions
>       tlc591xx_led_set -> tlc591xx_set_brightness
>       Be paranoid with of_match_device() and client->dev.of_node
> 
> Since v4:
>       Fix Oops on module unload reported by Vignesh R
> 
> Since v3:
>       Generalized and added support for tlc59108
>       brightness == 0 and brightness == LED_FULL disable PWM and used
>         fixed OFF/ON mode
> 
> Since v2:
>       Remove incorrect /* Mode register ? */ comment
>       Parenthesis around the macro arguments
>       Converted many signed variables into unsigned
>       Saved an initialization
> 
> 
> Since v1:
>       s/uint8_t/u8/g
>       Remove empty line
>       Removed #gpio-cells
>       Added select REGMAP_I2C
>       Sorted #includes into alphabetic order
>       Added missing MODULE_DEVICE_TABLE(of, ...)
>       Check return value of regmap_write()
>       Simplified tlc59116_set_mode()
> 
> Andrew Lunn (2):
>   leds: tlc59116: Document binding for the TI 16 Channel i2c LED driver
>   leds: tlc59116: Driver for the TI 16 Channel i2c LED driver
> 
>  .../devicetree/bindings/leds/leds-tlc59116.txt     |  41 ++++
>  drivers/leds/Kconfig                               |   7 +
>  drivers/leds/Makefile                              |   1 +
>  drivers/leds/leds-tlc59116.c                       | 253 +++++++++++++++++++++
>  4 files changed, 302 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-tlc59116.txt
>  create mode 100644 drivers/leds/leds-tlc59116.c
> 
> -- 
> 2.1.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
