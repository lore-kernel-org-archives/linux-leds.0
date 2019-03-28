From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/25] dt-bindings: leds: Add LED_COLOR_NAME definitions
Date: Wed, 27 Mar 2019 19:08:05 -0500
Message-ID: <20190328000804.GA17215@bogus>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
 <20190310182836.20841-5-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190310182836.20841-5-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

On Sun, Mar 10, 2019 at 07:28:15PM +0100, Jacek Anaszewski wrote:
> Add common LED color name definitions for use in Device Tree.

Do we actually have variations in color strings? Maybe someone uses 
"RED" or something. If not, I think this adds less value compared to 
function names. Just my 2 cents, either way is fine.

> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Simon Shields <simon@lineageos.org>
> ---
>  include/dt-bindings/leds/common.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index ffcd46317307..0e986bb59391 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -57,4 +57,13 @@
>  #define LED_FUNCTION_WLAN "wlan"
>  #define LED_FUNCTION_WPS "wps"
>  
> +/* Standard LED colors */
> +#define LED_COLOR_NAME_WHITE    "white"
> +#define LED_COLOR_NAME_RED      "red"
> +#define LED_COLOR_NAME_GREEN    "green"
> +#define LED_COLOR_NAME_BLUE     "blue"
> +#define LED_COLOR_NAME_AMBER    "amber"
> +#define LED_COLOR_NAME_VIOLET   "violet"
> +#define LED_COLOR_NAME_YELLOW   "yellow"
> +
>  #endif /* __DT_BINDINGS_LEDS_H */
> -- 
> 2.11.0
> 
