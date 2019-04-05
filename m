From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 05/25] leds: core: Add support for composing LED class
 device names
Date: Fri, 5 Apr 2019 06:45:37 -0500
Message-ID: <eda766d7-3974-0e1f-3025-59c0aa840b14@ti.com>
References: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
 <20190331175501.23471-6-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331175501.23471-6-jacek.anaszewski@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Jacek

On 3/31/19 12:54 PM, Jacek Anaszewski wrote:
> Add generic support for composing LED class device name basing on
> fwnode_handle data. The function composes device name according to
> either a new <color:function> pattern or the legacy
> <devicename:color:function> pattern. The decision on using the
> particular pattern is made basing on whether fwnode contains new
> "function" and "color" properties, or the legacy "label" proeprty.
> 
> Backward compatibility with in-driver hard-coded LED class device
> names is assured thanks to the default_label and led_hw_name properties
> of newly introduced struct led_init_data.
> 
> In case none of the aforementioned properties was found, then, for OF
> nodes, the node name is adopted for LED class device name.
> 
> At the occassion of amending the Documentation/leds/leds-class.txt
> unify spelling: colour -> color.
> 
> Alongside these changes added is a new tool - tools/leds/get_led_device_info.sh.
> The tool allows retrieving details of a LED class device's parent device,
> which proves that getting rid of a devicename section from LED name pattern
> is justified since this information is already available in sysfs.
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
>  Documentation/leds/leds-class.txt | 27 +++++++++--
>  drivers/leds/led-class.c          | 29 ++++++++++--
>  drivers/leds/led-core.c           | 96 +++++++++++++++++++++++++++++++++++++++
>  include/linux/leds.h              | 43 ++++++++++++++++++
>  tools/leds/get_led_device_info.sh | 81 +++++++++++++++++++++++++++++++++
>  5 files changed, 270 insertions(+), 6 deletions(-)
>  create mode 100755 tools/leds/get_led_device_info.sh
> 
> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
> index 8b39cc6b03ee..11e19c3c2e4d 100644
> --- a/Documentation/leds/leds-class.txt
> +++ b/Documentation/leds/leds-class.txt
> @@ -43,14 +43,35 @@ LED Device Naming
>  
>  Is currently of the form:
>  
> -"devicename:colour:function"
> -
> -There have been calls for LED properties such as colour to be exported as
> +"color:function"
> +
> +There might be still LED class drivers around using "devicename:color:function"
> +naming pattern, but the "devicename" section is now deprecated since it used
> +to convey information that was already available in the sysfs, like product
> +name. There is a tool (tools/leds/get_led_device_info.sh) available for
> +retrieving that information per a LED class device.
> +
> +Associations with other devices, like network ones, should be defined
> +via LED trigger mechanism. This approach is applied by some of wireless
> +network drivers that create triggers dynamically and incorporate phy
> +name into the trigger name. On the other hand input subsystem offers LED - input
> +bridge (drivers/input/input-leds.c) for exposing keyboard LEDs as LED class
> +devices. The get_led_device_info.sh script has support for retrieving related
> +input device node name. Should it support discovery of associations between
> +LEDs and other subsystems, please don't hesitate to submit a relevant patch.
> +
> +There have been calls for LED properties such as color to be exported as
>  individual led class attributes. As a solution which doesn't incur as much
>  overhead, I suggest these become part of the device name. The naming scheme
>  above leaves scope for further attributes should they be needed. If sections
>  of the name don't apply, just leave that section blank.
>  
> +Please also keep in mind that LED subsystem has a protection against LED name
> +conflict. It adds numerical suffix (e.g. "_1", "_2", "_3" etc.) to the requested
> +LED class device name in case it is already in use. In order to prevent LED core
> +from assigning these suffixes in an arbitrary order the led-enumerator fwnode
> +property can be used for differentiation of LEDs that share common function
> +and/or color. In this case enumerators will be prepended with "-" character.
>  
>  Brightness setting API
>  ======================
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 2f09156b0c63..bfd46a9bba63 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -26,6 +26,18 @@
>  
>  static struct class *leds_class;
>  
> +const char *led_colors[LED_COLOR_ID_COUNT] = {
> +	[LED_COLOR_ID_WHITE] = "white",
> +	[LED_COLOR_ID_RED] = "red",
> +	[LED_COLOR_ID_GREEN] = "green",
> +	[LED_COLOR_ID_BLUE] = "blue",
> +	[LED_COLOR_ID_AMBER] = "amber",
> +	[LED_COLOR_ID_VIOLET] = "violet",
> +	[LED_COLOR_ID_YELLOW] = "yellow",
> +	[LED_COLOR_ID_IR] = "ir",
> +};
> +EXPORT_SYMBOL_GPL(led_colors);
> +

Why is this exported when it is only used here?

I can re-use this array for the multi color framework so I don't oppose it being exported.

Reviewed-by: Dan Murphy <dmurphy@ti.com>

Dan

<snip>-- 
------------------
Dan Murphy
