From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/4] ARM: dts: omap4-droid4: Update backlight dt
 properties
Date: Thu, 4 Apr 2019 15:00:13 -0700
Message-ID: <20190404220013.GG49658@atomide.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-2-dmurphy@ti.com>
 <f9d80ad1-d80c-bf77-5e0b-1e02a1b74200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f9d80ad1-d80c-bf77-5e0b-1e02a1b74200@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

* Jacek Anaszewski <jacek.anaszewski@gmail.com> [190404 20:12]:
> Tony,
> 
> On 3/21/19 3:28 PM, Dan Murphy wrote:
> > Update the properties for the lm3532 device node for droid4.
> > With this change the backlight LED string and the keypad
> > LED strings will be controlled separately.
> > 
> > Signed-off-by: Dan Murphy <dmurphy@ti.com>
> > ---
> > 
> > v5 - No change - https://lore.kernel.org/patchwork/patch/1050409/
> > 
> > v4 - No change - https://lore.kernel.org/patchwork/patch/1050125/
> > v3 - updated keypad label on v1 comment - https://lore.kernel.org/patchwork/patch/1049023/
> > v2 - Fixed ramp-up and ramp-down properties, removed hard coded property values,
> > I did not change the label as it is undecided what it could be - https://lore.kernel.org/patchwork/patch/1048806/
> > 
> >   arch/arm/boot/dts/omap4-droid4-xt894.dts | 26 ++++++++++++++++--------
> >   1 file changed, 18 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
> > index e21ec929f096..aea206f04f76 100644
> > --- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
> > +++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
> > @@ -383,20 +383,30 @@
> >   };
> >   &i2c1 {
> > -	lm3532@38 {
> > +	led-controller@38 {
> >   		compatible = "ti,lm3532";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> >   		reg = <0x38>;
> >   		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> > -		lcd_backlight: backlight {
> > -			compatible = "ti,lm3532-backlight";
> > +		ramp-up-us = <1024>;
> > +		ramp-down-us = <8193>;
> > -			lcd {
> > -				led-sources = <0 1 2>;
> > -				ramp-up-msec = <1>;
> > -				ramp-down-msec = <0>;
> > -			};
> 
> Since I'll be creating integration branch for this series,
> and it would be good to have this patch in it too, then
> I can do the amendments by myself:
> 
> > +		lcd_backlight: led@0 {
> > +			reg = <0>;
> > +			led-sources = <2>;
> > +			ti,led-mode = <0>;
> > +			label = "backlight";
> 
> s/backlight/:backlight/
> 
> > +			linux,default-trigger = "backlight";
> > +		};
> > +
> > +		led@1 {
> > +			reg = <1>;
> > +			led-sources = <1>;
> > +			ti,led-mode = <0>;
> > +			label = "platform::kbd_backlight";
> 
> s/platform::kbd_backlight/:kbd_backlight/

Yes makes sense to me.

> and then send you a pull request.
> 
> Would you be OK with that?

Sure go for it. Here's my ack for the changes:

Acked-by: Tony Lindgren <tony@atomide.com>

And then for the one liner to fold in below:

Signed-off-by: Tony Lindgren <tony@atomide.com>

8< -------------
diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -214,7 +214,6 @@
 
 		width-mm = <50>;
 		height-mm = <89>;
-		backlight = <&lcd_backlight>;
 
 		panel-timing {
 			clock-frequency = <0>;		/* Calculated by dsi */
