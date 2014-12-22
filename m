From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH w/ acks] DT: leds: Add flash LED devices related properties
Date: Sun, 21 Dec 2014 20:27:46 -0600
Message-ID: <CAL_Jsq+RQvjrvkS7JWPyUmJ4jA7n637xRwM4y4ZWYyGKoetnHA@mail.gmail.com>
References: <20141120131713.GC27527@amd> <20141203185746.GA25267@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141203185746.GA25267@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, sakari.ailus@iki.fi, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-leds@vger.kernel.org, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>
List-Id: linux-leds@vger.kernel.org

On Wed, Dec 3, 2014 at 12:57 PM, Pavel Machek <pavel@ucw.cz> wrote:
>
> Addition of a LED Flash class extension entails the need for flash LED
> specific device tree properties. The properties being added are:
> max-microamp, flash-max-microamp, flash-timeout-microsec.
>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

One minor comment, otherwise:

Acked-by: Rob Herring <robh@kernel.org>

>
> ---
>
> This will allow me to add device tree support for adp1653 i2c flash
> LED driver, and allow Jacek Anaszewski to add support for more LED
> drivers..
>
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 2d88816..e9acbbc 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -14,6 +14,15 @@ Optional properties for child nodes:
>       "ide-disk" - LED indicates disk activity
>       "timer" - LED flashes at a fixed, configurable rate
>
> +- max-microamp : maximum intensity in microamperes of the LED
> +                (torch LED for flash devices)
> +- flash-max-microamp : maximum intensity in microamperes of the
> +                       flash LED; it is mandatory if the LED should
> +                      support the flash mode
> +- flash-timeout-microsec : timeout in microseconds after which the flash
> +                           LED is turned off

Use 'us' as it is more common than microsec.

We probably should have done 'uamp' to be consistent in this binding,
but regulator binding is using microamp.

Rob
