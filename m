From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: BCM53573: Don't use nonexistent
 "default-off" LED trigger
Date: Wed, 8 Mar 2017 09:31:44 -0800
Message-ID: <42bce8ea-f1dc-2018-33f1-d296ccd7b677@gmail.com>
References: <20170308064105.26619-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33061 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751616AbdCHRcS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Mar 2017 12:32:18 -0500
In-Reply-To: <20170308064105.26619-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

On 03/07/2017 10:41 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Such a trigger doesn't exist in Linux and is not needed as LED is being
> turned off by default. This could cause errors in LEDs core code when
> trying to set default trigger.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Since you are fixing something, what's the proper Fixes: tag for this
commit? Likewise for the second patch.

Thanks

> ---
>  arch/arm/boot/dts/bcm47189-tenda-ac9.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
> index 6bdd79567cbd..34417dac1cd0 100644
> --- a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
> +++ b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
> @@ -26,19 +26,16 @@
>  		usb {
>  			label = "bcm53xx:blue:usb";
>  			gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "default-off";
>  		};
>  
>  		wps {
>  			label = "bcm53xx:blue:wps";
>  			gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "default-off";
>  		};
>  
>  		5ghz {
>  			label = "bcm53xx:blue:5ghz";
>  			gpios = <&chipcommon 11 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "default-off";
>  		};
>  
>  		system {
> @@ -54,7 +51,6 @@
>  		2ghz {
>  			label = "bcm53xx:blue:2ghz";
>  			gpios = <&pcie0_chipcommon 3 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "default-off";
>  		};
>  	};
>  
> 


-- 
Florian
