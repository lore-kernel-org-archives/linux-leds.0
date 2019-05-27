From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
Date: Mon, 27 May 2019 22:00:42 +0200
Message-ID: <f01ac400-efda-80a8-4d63-1e2add5e054a@gmail.com>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523190820.29375-2-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the update.

One thing is missing here - we need to document how legacy brightness
levels map to the sub-LED color levels, i.e. what you do in
multicolor_set_brightness().

Best regards,
Jacek Anaszewski

On 5/23/19 9:08 PM, Dan Murphy wrote:
> Add a documentation of LED Multicolor LED class specific
> sysfs attributes.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    | 57 +++++++++++++++++++
>   1 file changed, 57 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..2f102ede258b
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,57 @@
> +What:		/sys/class/leds/<led>/colors/sync_enable
> +Date:		April 2019
> +KernelVersion:	5.2
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Writing a 1 to this file will enable the synchronization of all
> +		the defined color LEDs within the LED node.  Brightness values
> +		for each LED will be stored and written when sync is set to 1.
> +		Writing a 0 to this file will disable syncing and allow
> +		individual control of the LEDs brightness settings.
> +
> +What:		/sys/class/leds/<led>/colors/sync
> +Date:		April 2019
> +KernelVersion:	5.2
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	write only
> +		Writing a 1 to this file while sync_enable is set to 1 will
> +		write the current brightness values to all defined LEDs within
> +		the LED node.  All LEDs defined will be configured based
> +		on the brightness that has been requested.
> +
> +		If sync_enable is set to 0 then writing a 1 to sync has no
> +		affect on the LEDs.
> +
> +What:		/sys/class/leds/<led>/colors/<led_color>/brightness
> +Date:		April 2019
> +KernelVersion:	5.2
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		The led_color directory is dynamically created based on the
> +		colors defined by the registrar of the class.
> +		The led_color can be but not limited to red, green, blue,
> +		white, amber, yellow and violet.  Drivers can also declare a
> +		LED color for presentation.  There is one directory per color
> +		presented.  The brightness file is created under each
> +		led_color directory and controls the individual LED color
> +		setting.
> +
> +		If sync is enabled then	writing the brightness value of the LED
> +		is deferred until a 1 is written to
> +		/sys/class/leds/<led>/color/sync.  If syncing is
> +		disabled then the LED brightness value will be written
> +		immediately to the LED driver.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/colors/<led_color>/max_brightness.
> +
> +What:		/sys/class/leds/<led>/colors/<led_color>/max_brightness
> +Date:		April 2019
> +KernelVersion:	5.2
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read only
> +		Maximum brightness level for the LED color, default is
> +		255 (LED_FULL).
> +
> +		If the LED does not support different brightness levels, this
> +		should be 1.
> 
