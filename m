From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 03/25] dt-bindings: leds: Add LED_COLOR_ID definitions
Date: Thu, 4 Apr 2019 20:12:03 -0500
Message-ID: <440de7d8-6acd-fb5a-3607-ba3c0a99f894@ti.com>
References: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
 <20190331175501.23471-4-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331175501.23471-4-jacek.anaszewski@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Jacek

On 3/31/19 12:54 PM, Jacek Anaszewski wrote:
> Add common LED color identifiers for use in Device Tree.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Simon Shields <simon@lineageos.org>
> ---
>  include/dt-bindings/leds/common.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 0325db5b4208..c95f39b3a254 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -55,4 +55,15 @@
>  #define LED_FUNCTION_WLAN "wlan"
>  #define LED_FUNCTION_WPS "wps"
>  
> +/* Standard LED colors */
> +#define LED_COLOR_ID_WHITE	0
> +#define LED_COLOR_ID_RED	1
> +#define LED_COLOR_ID_GREEN	2
> +#define LED_COLOR_ID_BLUE	3
> +#define LED_COLOR_ID_AMBER	4
> +#define LED_COLOR_ID_VIOLET	5
> +#define LED_COLOR_ID_YELLOW	6
> +#define LED_COLOR_ID_IR		7
> +#define LED_COLOR_ID_COUNT	8
> +
>  #endif /* __DT_BINDINGS_LEDS_H */
> 

Reviewed-by: Dan Murphy <dmurphy@ti.com>

-- 
------------------
Dan Murphy
