From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 04/25] dt-bindings: leds: Add LED_COLOR_NAME definitions
Date: Mon, 11 Mar 2019 07:23:08 -0500
Message-ID: <4b4b5109-2da3-a74f-7e77-c4ab4d34ecbc@ti.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
 <20190310182836.20841-5-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-5-jacek.anaszewski@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Jacek

On 3/10/19 1:28 PM, Jacek Anaszewski wrote:
> Add common LED color name definitions for use in Device Tree.
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

#define LED_COLOR_NAME_INFRARED	"ir"

Dan

>  #endif /* __DT_BINDINGS_LEDS_H */
> 


-- 
------------------
Dan Murphy
