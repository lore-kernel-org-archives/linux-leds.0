From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Subject: Re: [PATCH 04/24] dt-bindings: leds: Add function and color
 properties
Date: Fri, 9 Nov 2018 10:32:01 +0200
Message-ID: <bdd18dc6-0dee-5957-81d4-39254c7ad74d@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

On 07/11/2018 0.07, Jacek Anaszewski wrote:
> Introduce dedicated properties for conveying information about
> LED function and color. Mark old "label" property as deprecated.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Simon Shields <simon@lineageos.org>
> Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
> ---
>   Documentation/devicetree/bindings/leds/common.txt | 52 +++++++++++++++++++----
>   1 file changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index aa13998..3efc826 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -10,14 +10,20 @@ can influence the way of the LED device initialization, the LED components
>   have to be tightly coupled with the LED device binding. They are represented
>   by child nodes of the parent LED device binding.
>   
> +
>   Optional properties for child nodes:
>   - led-sources : List of device current outputs the LED is connected to. The
>   		outputs are identified by the numbers that must be defined
>   		in the LED device binding documentation.
> +- function: LED functon. Use one of the LED_FUNCTION_* prefixed definitions
> +	    from the header include/dt-bindings/leds/functions.h.
> +	    If there is no matching LED_FUNCTION available, add a new one.
> +- color : Color of the LED.

We have had for years out-of-tree patch for multi color gpio led driver 
which extends this concept with multiple colors. Then in sysfs there has 
been possibility to control the color and otherwise use blinking or 
other features.

Our need is multi color status led of the device which includes 
different kind of blinkings and colors on different situations.

Current in-tree gpio led driver just wasn't atomic enough and a bit 
clumsy interface for handling this.

Now that this is being looked at could we come up with solution that we 
could define multiple colors for one led in device tree and then we 
could work on getting the driver upstreamed?

What we did was generally:

leds-multi {
	compatible = "gpio-multi-leds";

	status {
		gpios = <...>;
		linux,default-trigger = "none";
		deafult-state = "keep";

		color-red {
			pin-mask = <0x01>;
		};

		color-green {
			pin-mask = <0x02>;
		};

		color-orange {
			pin-mask = <0x03>;
		};
	};
};

Thanks,
Vesa Jääskeläinen
