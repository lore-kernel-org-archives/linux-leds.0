From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: omap4-droid4: Update backlight dt
 properties
Date: Thu, 4 Apr 2019 22:12:03 +0200
Message-ID: <f9d80ad1-d80c-bf77-5e0b-1e02a1b74200@gmail.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321142838.22985-2-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, tony@atomide.com
Cc: robh+dt@kernel.org, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Tony,

On 3/21/19 3:28 PM, Dan Murphy wrote:
> Update the properties for the lm3532 device node for droid4.
> With this change the backlight LED string and the keypad
> LED strings will be controlled separately.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v5 - No change - https://lore.kernel.org/patchwork/patch/1050409/
> 
> v4 - No change - https://lore.kernel.org/patchwork/patch/1050125/
> v3 - updated keypad label on v1 comment - https://lore.kernel.org/patchwork/patch/1049023/
> v2 - Fixed ramp-up and ramp-down properties, removed hard coded property values,
> I did not change the label as it is undecided what it could be - https://lore.kernel.org/patchwork/patch/1048806/
> 
>   arch/arm/boot/dts/omap4-droid4-xt894.dts | 26 ++++++++++++++++--------
>   1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
> index e21ec929f096..aea206f04f76 100644
> --- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
> +++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
> @@ -383,20 +383,30 @@
>   };
>   
>   &i2c1 {
> -	lm3532@38 {
> +	led-controller@38 {
>   		compatible = "ti,lm3532";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>   		reg = <0x38>;
>   
>   		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
>   
> -		lcd_backlight: backlight {
> -			compatible = "ti,lm3532-backlight";
> +		ramp-up-us = <1024>;
> +		ramp-down-us = <8193>;
>   
> -			lcd {
> -				led-sources = <0 1 2>;
> -				ramp-up-msec = <1>;
> -				ramp-down-msec = <0>;
> -			};

Since I'll be creating integration branch for this series,
and it would be good to have this patch in it too, then
I can do the amendments by myself:

> +		lcd_backlight: led@0 {
> +			reg = <0>;
> +			led-sources = <2>;
> +			ti,led-mode = <0>;
> +			label = "backlight";

s/backlight/:backlight/

> +			linux,default-trigger = "backlight";
> +		};
> +
> +		led@1 {
> +			reg = <1>;
> +			led-sources = <1>;
> +			ti,led-mode = <0>;
> +			label = "platform::kbd_backlight";

s/platform::kbd_backlight/:kbd_backlight/

and then send you a pull request.

Would you be OK with that?

>   		};
>   	};
>   };
> 

-- 
Best regards,
Jacek Anaszewski
