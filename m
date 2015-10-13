From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv4 3/3] devicetree: Add led-backlight binding
Date: Tue, 13 Oct 2015 09:21:03 -0500
Message-ID: <CAL_JsqJ+xYpX86DNHFCOEqV85FRh-Xzh1wg3p6guA0QeWG4+pg@mail.gmail.com>
References: <1443605522-1118-1-git-send-email-tomi.valkeinen@ti.com> <1443605522-1118-4-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:34938 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753157AbbJMOVX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 13 Oct 2015 10:21:23 -0400
In-Reply-To: <1443605522-1118-4-git-send-email-tomi.valkeinen@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Wed, Sep 30, 2015 at 4:32 AM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> Add DT binding for led-backlight.

Please use get_maintainers.pl.

>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/video/backlight/led-backlight.txt     | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/backlight/led-backlight.txt
>
> diff --git a/Documentation/devicetree/bindings/video/backlight/led-backlight.txt b/Documentation/devicetree/bindings/video/backlight/led-backlight.txt
> new file mode 100644
> index 000000000000..d4621d7414bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/backlight/led-backlight.txt
> @@ -0,0 +1,30 @@
> +led-backlight bindings
> +
> +Required properties:
> +  - compatible: "led-backlight"
> +  - leds: phandle to a led OF node [0]

Why do we need 2 levels of LED nodes?

> +  - brightness-levels: Array of distinct LED brightness levels. These
> +      are in the range from 0 to 255, passed to the LED class driver.
> +  - default-brightness-level: the default brightness level (index into the
> +      array defined by the "brightness-levels" property)
> +
> +Optional properties:
> +  - power-supply: regulator for supply voltage
> +  - enable-gpios: contains a single GPIO specifier for the GPIO which enables
> +                  and disables the backlight (see GPIO binding[1])

Why are all of these not part of the LED node pointed to by leds?

Describe the h/w, not what you want for a driver.

Rob
