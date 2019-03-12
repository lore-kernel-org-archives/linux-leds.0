From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 02/25] leds: core: Add support for composing LED class
 device names
Date: Tue, 12 Mar 2019 17:56:34 +0100
Message-ID: <26d94535-cd45-9826-da24-113b8128f4e9@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
 <20190310182836.20841-3-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-3-jacek.anaszewski@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-leds@vger.kernel.org

Two auto corrections:

On 3/10/19 7:28 PM, Jacek Anaszewski wrote:
> Add public led_compose_name() API for composing LED class device
> name basing on fwnode_handle data. The function composes device name
> according to either a new <color:function> pattern or the legacy
> <devicename:color:function> pattern. The decision on using the
> particular pattern is made basing on whether fwnode contains new
> "function" and "color" properties, or the legacy "label" proeprty.
> 
> Backwards compatibility with in-driver hard-coded LED class device
> names is assured thanks to the default_desc argument.
> 
> In case none of the aforementioned properties was found, then, for OF
> nodes, the node name is adopted for LED class device name.
> 
> Alongside these changes added is a new tool - tools/leds/get_led_device_info.sh.
> The tool allows retrieving details of a LED class device's parent device,
> which proves that getting rid of a devicename section from LED name pattern
> is justified since this information is already available in sysfs.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   Documentation/leds/leds-class.txt | 20 +++++++++-
>   drivers/leds/led-core.c           | 82 +++++++++++++++++++++++++++++++++++++++
>   include/linux/leds.h              | 31 +++++++++++++++
>   tools/leds/get_led_device_info.sh | 81 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 213 insertions(+), 1 deletion(-)
>   create mode 100755 tools/leds/get_led_device_info.sh
> 
> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
> index 8b39cc6b03ee..866fe87063d4 100644
> --- a/Documentation/leds/leds-class.txt
> +++ b/Documentation/leds/leds-class.txt
> @@ -43,7 +43,22 @@ LED Device Naming
>   
>   Is currently of the form:
>   
> -"devicename:colour:function"
> +"colour:function"
> +
> +There might be still LED class drivers around using "devicename:colour:function"
> +naming pattern, but the "devicename" section is now deprecated since it used
> +to convey information that was already available in the sysfs, like product
> +name. There is a tool (tools/leds/get_led_device_info.sh) available for
> +retrieving that information per a LED class device.
> +
> +Associations with other devices, like network ones, should be defined
> +via LED triggr mechanism. This approach is applied by some of wireless

s/triggr/trigger/

> +network drivers that create triggers dynamically and incorporate phy
> +name into its name. On the other hand input subsystem offers LED - input

s/its name/the trigger name/

> +bridge (drivers/input/input-leds.c) for exposing keyboard LEDs as LED class
> +devices. The get_led_device_info.sh script has support for retrieving related
> +input device node name. Should it support discovery of associations between
> +LEDs and other subsystems, please don't hesitate to submit a relevant patch.
>   
>   There have been calls for LED properties such as colour to be exported as
>   individual led class attributes. As a solution which doesn't incur as much
> @@ -51,6 +66,9 @@ overhead, I suggest these become part of the device name. The naming scheme
>   above leaves scope for further attributes should they be needed. If sections
>   of the name don't apply, just leave that section blank.
>   
> +Please also keep in mind that LED subsystem has a protection against LED name
> +conflict. It adds numerical suffix (e.g. "_1", "_2", "_3" etc.) to the requested
> +LED class device name in case it is already in use.


-- 
Best regards,
Jacek Anaszewski
