From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH V2 0/3] leds: add SN3218 LED driver
Date: Fri, 05 Feb 2016 09:15:34 +0100
Message-ID: <56B45A26.1060002@samsung.com>
References: <1454612167-8680-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1454612167-8680-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Stefan,

Patch set applied to the for-next branch of linux-leds.git.

Thanks,
Jacek Anaszewski

On 02/04/2016 07:56 PM, Stefan Wahren wrote:
> This patch series implements support for the Si-En SN3218
> 18 Channel LED Driver connected through I2C. The SN3218
> doesn't support reading so the LED states are cached in a
> regmap.
>
> The driver has been tested on a Raspberry Pi B.
>
> Changes since V1:
>    * add shutdown handler
>    * use defines for modes
>    * remove empty line at the end of binding doc
>    * make sn3218_led_init static
>    * skip setting default max brightness
>    * fix fail sn3218_init
>
> Changes since RFC:
>    * using regmap instead of direct I2C
>    * add new function to init single LED
>    * add module name to Kconfig help
>    * replace of_get_property() with of_property_read_string()
>    * remove lock, leds_state and name from priv structure
>    * drop sn3218 LED name prefix
>    * don't use led_info and led_platform_data
>    * abort probing if no SN3218 is connected or DT invalid
>    * fix some style and text issues
>    * fix license
>    * move i2c_device_id and of_device_id at the end of file
>    * use devm_* calls
>    * use device function as node name in DT binding
>
> Stefan Wahren (3):
>    of: Add vendor prefix for Si-En Technology
>    DT: add binding for SN3218 LED driver
>    leds: add SN3218 LED driver
>
>   .../devicetree/bindings/leds/leds-sn3218.txt       |   41 +++
>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>   drivers/leds/Kconfig                               |   12 +
>   drivers/leds/Makefile                              |    1 +
>   drivers/leds/leds-sn3218.c                         |  306 ++++++++++++++++++++
>   5 files changed, 361 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-sn3218.txt
>   create mode 100644 drivers/leds/leds-sn3218.c
>
