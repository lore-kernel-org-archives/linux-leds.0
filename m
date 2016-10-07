From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] Added Support for STMicroelectronics 16 channels LED7708
 LED Driver
Date: Fri, 07 Oct 2016 10:02:29 +0200
Message-ID: <859aefd2-35a1-e2fc-8fe6-b5bd4bf6c460@samsung.com>
References: <CGME20161006054816eucas1p2f10725503a25be1970dbb01ab6f34de2@eucas1p2.samsung.com>
 <1475732798-25992-1-git-send-email-saurabh.rawat@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26397 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750935AbcJGICg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 Oct 2016 04:02:36 -0400
In-reply-to: <1475732798-25992-1-git-send-email-saurabh.rawat@st.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Saurabh Rawat <saurabh.rawat@st.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Saurabh,

Thanks for the patch.

General remarks:
- use scripts/checkpatch.pl
- read Documentation/CodingStyle
- read Documentation/SubmitChecklist
- read Documentation/SubmittingDrivers
- read Documentation/SubmittingPatches

On 10/06/2016 07:46 AM, Saurabh Rawat wrote:
> ---
>  .../devicetree/bindings/leds/leds-st.txt           |  105 ++
>  KERNEL/Documentation/leds/leds-st7708.txt          |  167 +++
>  KERNEL/drivers/leds/leds-st.c                      | 1210 ++++++++++++++++++++
>  KERNEL/include/linux/platform_data/leds-st.h       |  170 +++

The paths should be related to the kernel root directory.
I believe "KERNEL" is your local directory.

Before submitting a patch please confirm that it applies correctly
to the for-4.10 branch of

git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git


>  patches/defconfig                                  |    3 +-
>  5 files changed, 1654 insertions(+), 1 deletion(-)
>  create mode 100644 KERNEL/Documentation/devicetree/bindings/leds/leds-st.txt
>  create mode 100644 KERNEL/Documentation/leds/leds-st7708.txt
>  create mode 100644 KERNEL/drivers/leds/leds-st.c

Why leds-st.c and not leds-st7708.c ?

>  create mode 100644 KERNEL/include/linux/platform_data/leds-st.h

Ditto.

>
> diff --git a/KERNEL/Documentation/devicetree/bindings/leds/leds-st.txt b/KERNEL/Documentation/devicetree/bindings/leds/leds-st.txt
> new file mode 100644
> index 0000000..dde53f9
> --- /dev/null
> +++ b/KERNEL/Documentation/devicetree/bindings/leds/leds-st.txt
> @@ -0,0 +1,105 @@
> +STMicroelectronics LED7708 Driver connected to BeagleboneBlack.This can be customized for any other

Don't exceed line length limit (80 characters). It applies also to
the other lines in the patch.

> +hardware platform running linux depending on available free GPIOS
> +
> +Required properties:
> +- compatible : should be : "st,st-leds".
> +- sdo-gpio :contains a single GPIO specifier for the GPIO which is used for master to slave data OUT data.
> +- sdi-gpio: contains a single GPIO specifier for the GPIO which is used for master to slave data IN data.
> +- le-gpios: contains a single GPIO specifier for the GPIO which is used for Latch Enable data.
> +- lren-gpios: contains a single GPIO specifier for the GPIO which is used for Lren data.This has to be High for Device to Operate.

Why here *-gpios and above *-gpio?

> +- sck-gpio: contains a single GPIO specifier for the GPIO which is used for the clock pin.
> +- chanx :For controlling each LED channel Independently
> +- chan-common: For controlling all the 16 channels in a single shot.

It seems that using led-sources property could simplify your driver.
Please refer to:
- Documentation/devicetree/bindings/leds/common.txt,
- leds-max77693 driver, that uses that property.
- Documentation/devicetree/bindings/mfd/max77693.txt.

> +
> +Optional properties:
> + - None

If none, then just don't mention this category.

> +Example:
> +
> +st-leds {
> +        compatible = "st,st-leds";
> +        sdo-gpio = <&gpio1 16 1>;
> +        sdi-gpio = <&gpio1 28 1>;
> +        le-gpio = <&gpio3 21 1>;
> +        lren-gpio = <&gpio1 19 1>;
> +        sck-gpio = <&gpio1 17 1>;
> +
> +        chan1 {
> +
> +                chan-name = "led7708-chan1";
> +        };
> +
> +        chan2 {
> +
> +                chan-name = "led7708-chan2";
> +        };
> +        chan3 {
> +
> +                chan-name = "led7708-chan3";
> +        };
> +
> +        chan4 {
> +
> +                chan-name = "led7708-chan4";
> +        };
> +        chan5 {
> +
> +                chan-name = "led7708-chan5";
> +        };
> +
> +        chan6 {
> +
> +                chan-name = "led7708-chan6";
> +        };
> +        chan7 {
> +
> +                chan-name = "led7708-chan7";
> +                };
> +
> +        chan8 {
> +
> +                chan-name = "led7708-chan8";
> +        };
> +
> +        chan9 {
> +
> +                chan-name = "led7708-chan9";
> +	};
> +		
> +	chan10 {
> +		
> +	        chan-name = "led7708-chan10";
> +	};
> +	chan11 {
> +	
> +	        chan-name = "led7708-chan11";
> +	};
> +		
> +	chan12 {
> +		
> +	        chan-name = "led7708-chan12";
> +	};
> +	chan13 {
> +		
> +	        chan-name = "led7708-chan13";
> +	};
> +		
> +	chan14 {
> +		
> +	        chan-name = "led7708-chan14";
> +	};
> +	chan15 {
> +		
> +	        chan-name = "led7708-chan15";
> +	};
> +		
> +	chan16 {
> +		
> +	        chan-name = "led7708-chan16";
> +	};
> +		
> +	chan-common {
> +		
> +	        chan-name = "led7708-chan-comm";
> +	};
> +};
> diff --git a/KERNEL/Documentation/leds/leds-st7708.txt b/KERNEL/Documentation/leds/leds-st7708.txt
> new file mode 100644
> index 0000000..c1725ab
> --- /dev/null
> +++ b/KERNEL/Documentation/leds/leds-st7708.txt
> @@ -0,0 +1,167 @@
> +Kernel driver for led7708

s/Kernel driver for led7708/LED class driver for STMicroelectronics LED7708/

Please also use following comment style for multi-line comments:

/*
   *
   *
   */

> +===========================
> +
> +* STMicroelectronics LED7708 Driver
> +* Datasheet: www.st.com/resource/en/datasheet/led7708.pdf
> +
> +Authors: Saurabh Rawat
> +Contact: Saurabh Rawat (saurabh.rawat-at-st.com)

Instead of two above lines the following one will be enough:

Author: Saurabh Rawat <saurabh.rawat-at-st.com>

> +
> +Description
> +----------------------------------------------------------------------------------------------------------------
> +LED7708 is a simple 16 channels LED driver hardware from STMicroelectronics. Leds can be controlled directly via

Always use capital letters for "LED" string.
We should mention here how channels are mapped to LED class devices.

> +the led class control interface.
> +Each channel can be controlled independently in two modes - group-dimming mode or gray-scale dimming mode.

I'd skip "independently".

Also here you should use LED class device notion instead of a channel.

> +In group dimming mode writing brightness to any one channel will configure the brightness of all the channels
> +with the same brightness.

I'd rephrase it as follows:

In a group dimming mode configuring brightness of a single LED class
device will result in setting the same brightness on other LED class
devices controlled by the same LED7708 device.

> +This mode is enabled by default in the driver.
> +In gray scale dimming mode each channel can be configured to have different brightness values and all the channels
> +can be controlled in one shot.
> +
> +Follow these steps to configure the LED7708 channels in goup-dimming mode

typo: goup -> group

> +- Either select the channels from the sysfs by channel mask  e.g ff00 -> echo ff00 > led_7708_select_channel for 9-16 channels
> +                                 or

Why "or"? How we set brightness on all LEDs in this case?

> +- go to any channel's sysfs as described below, and write the brightness value to it , echo 122 > brightness .

And if this is the other case, how we synchronize other LEDs if it
doesn't require writing led_7708_select_channel?

> +  All the seleted channels will get configured with this brightness value.
> +
> +Follow these steps to configure the channels of LED7708 in gray-scale mode
> +- Select the mode - echo 1 > led_7708_dimming_mode
> +- Select the data format - echo 3 or echo 2 or echo 1 > led_7708_data_fmt

Why should we bother the user with data format?

> +- Write brightness values to each channels , go to any channel sysfs and write brightness value to it , echo 213 > brightness
> +- Enable sync - This will write the brightness for all the channels , echo 1 > led_7708_sync_brightness
> +
> +
> +Scripts
> +----------------------------------------------------------------------------------------------------------------
> +----------------------------------------------------------------------------------------------------------------
> +
> +
> +Follow these steps to use the direct commands.Custom scripts can be made using them with/without them using the debug interface - led_7708_dbg_rw
> +echo "(0X,YY,ZZZZ)" > led_7708_dbg_rw

sysfs rules say "one value per file". I'd remove this debugging
feature entirely.

> +0X --> Registers Identifier
> + W_BRT_DL    1
> + W_BRT_GL    2
> + W_CHSEL     4
> + R_CHSTA     7
> + W_DEVCFGx   8
> + R_DEVCFGx   11
> + W_GSLAT     13
> +
> +YY --> Number of Nibbles to be written
> +ZZZZ --> Data to be written
> +
> +
> +#script1 - Same brighntess on All channels (Group Dimming)
> +$echo "(08,04,2130)" > led_7708_dbg_rw
> +$echo "(08,04,8440)" > led_7708_dbg_rw
> +$echo "(04,04,FFFF)" > led_7708_dbg_rw
> +$echo "(08,04,2131)" > led_7708_dbg_rw
> +$echo "(02,04,FFFF)" > led_7708_dbg_rw
> +$echo "(02,04,0000)" > led_7708_dbg_rw
> +
> +#script2 - Different brighntess on All channels in one shot - 1X192 format (Gray Scale)
> +$echo "(08,04,2530)" > led_7708_dbg_rw
> +$echo "(08,04,C240)" > led_7708_dbg_rw
> +$echo "(04,04,FFFF)" > led_7708_dbg_rw
> +$echo "(08,04,2531)" > led_7708_dbg_rw
> +$echo "(02,48,020111222333444555666777888999AAABBBCCCDDDEEEFFF)" > led_7708_dbg_rw
> +$echo "(02,48,000000000000000000000000000000000000000000000000)" > led_7708_dbg_rw
> +
> +
> +#script3 - Different brighntess on All channels in one shot - 1X256 format (Gray Scale)
> +$echo "(08,04,2530)" > led_7708_dbg_rw
> +$echo "(08,04,C640)" > led_7708_dbg_rw
> +$echo "(08,04,2530)" > led_7708_dbg_rw
> +$echo "(04,04,FFFF)" > led_7708_dbg_rw
> +$echo "(08,04,2531)" > led_7708_dbg_rw
> +$echo "(02,64,FFFFEEEEDDDDCCCCBBBBAAAA9900000000000000000000003333222211110000)" > led_7708_dbg_rw
> +$echo "(02,64,0000000000000000000000000000000000000000000000000000000000000000)" > led_7708_dbg_rw
> +
> +
> +#script4 - Different brighntess on All channels in one shot - 16X16 format (Gray Scale)
> +$echo "(08,04,2500)" > led_7708_dbg_rw
> +$echo "(08,04,8440)" > led_7708_dbg_rw
> +$echo "(04,04,FFFF)" > led_7708_dbg_rw
> +$echo "(08,04,2501)" > led_7708_dbg_rw
> +$echo "(01,04,1111)" > led_7708_dbg_rw
> +$echo "(01,04,2222)" > led_7708_dbg_rw
> +$echo "(01,04,3333)" > led_7708_dbg_rw
> +$echo "(01,04,4444)" > led_7708_dbg_rw
> +$echo "(01,04,5555)" > led_7708_dbg_rw
> +$echo "(01,04,6666)" > led_7708_dbg_rw
> +$echo "(01,04,7777)" > led_7708_dbg_rw
> +$echo "(01,04,8888)" > led_7708_dbg_rw
> +$echo "(01,04,9999)" > led_7708_dbg_rw
> +$echo "(01,04,AAAA)" > led_7708_dbg_rw
> +$echo "(01,04,BBBB)" > led_7708_dbg_rw
> +$echo "(01,04,CCCC)" > led_7708_dbg_rw
> +$echo "(01,04,DDDD)" > led_7708_dbg_rw
> +$echo "(01,04,EEEE)" > led_7708_dbg_rw
> +$echo "(01,04,FFFF)" > led_7708_dbg_rw
> +$echo "(02,04,AAAA)" > led_7708_dbg_rw
> +
> +#script5 - Independent Brightness Control (Group Dimming)
> +e.g.1 => set 145 brightness value to 8 to 16 channels
> +$lc
> +$sdm
> +$echo ff00 > led_7708_select_channel
> +$l1
> +$chb
> +$echo 145 > brightness
> +
> +e.g.2=> set 250 brightness value to 1-4 ,7,8,9,10,14 and 16 channels
> +$lc
> +$sdm
> +$echo a3cf > led_7708_select_channel
> +$l1
> +$chb
> +$echo 250 > brightness
> +
> +
> +#script6 - Gray-Scale Brightness Control for 1,7 and 15th channels
> +$lc
> +$sdm
> +$echo 3 > led_7708_data_fmt
> +$echo 1 > led_7708_dimming_mode
> +$l1
> +$chb
> +$echo 213 > brightness
> +$l7
> +$chb
> +$echo 123 > brightness
> +$l15
> +$chb
> +$echo 213 > brightness
> +$lc
> +$echo 1 > led_7708_sync_brightness
> +
> +
> +
> +#lc,lx,sdm,chb are the aliases created as below in the ~/.bash_aliases :
> +
> +alias l<x>='cd /sys/class/leds/led7708-chan<x>'
> +e.g.
> +
> +alias l1='cd /sys/class/leds/led7708-chan1'
> +alias l2='cd /sys/class/leds/led7708-chan2'
> +alias l3='cd /sys/class/leds/led7708-chan3'
> +alias l4='cd /sys/class/leds/led7708-chan4'
> +..
> +and so on
> +alias lc='cd /sys/class/leds/led7708-chan-comm'
> +alias chb='sudo chmod 666 brightness'
> +alias sdm='sudo chmod 666 led_*'
> +
> +
> +
> +
> +
> +
> +
> +
> +
> +
> +
> +
> +
> +
> +
> diff --git a/KERNEL/drivers/leds/leds-st.c b/KERNEL/drivers/leds/leds-st.c
> new file mode 100644
> index 0000000..1dd9c5e
> --- /dev/null
> +++ b/KERNEL/drivers/leds/leds-st.c
> @@ -0,0 +1,1210 @@
> +/*
> + * Driver for STMicroelectronics LED7708 driver
> + *
> + * Copyright 2016 STMicroelectronics <saurabh.rawat@st.com>
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/gpio.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> +#include "leds.h"
> +#include <linux/delay.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_data/leds-st.h>
> +

Please arrange include directives in alphabetical order,
and put "#include "leds.h" in the end.

> +
> +u16 channel_mask;
> +char data_buff[Max_Packet_Length];
> +struct device *dev_global;
> +char data[Max_Packet_Length];
> +/*default group dimming data for 16 bit resolution */
> +char brightness_data_grp_dim_16[MAX_LENGTH] = "0000000000000000000000000000000000000000000000000000000000000000";
> +/*default group dimming data for 12 bit resolution */
> +char brightness_data_grp_dim_12[MAX_LENGTH] = "000000000000000000000000000000000000000000000000";
> +struct led7708_chip *chip;

Don't use global variables. Please enclose this into a structure.
You can refer to the other LED class drivers.

> +static struct st7708_led *
> +cdev_to_led7708_led(struct led_classdev *cdev)
> +{
> +return container_of(cdev, struct st7708_led, cdev);
> +}
> +
> +/* Takes one character and returns it's hex value*/
> +u16
> +chartohex(char c)
> +{
> +int i;
> +int d = 'a' - 'A';
> +i = c - 'A';
> +if (i > 0)
> +   return ((i % d) % 6) + 10;
> +  i = c - '0';
> +  if (i > 0)
> +    return i % 10;
> +  return 0;
> +}

sprintf can do this job.

> +
> +
> +int
> +inttochar(int x, char *res)
> +{
> +  if (x <= 0xFFFF) {
> +      res[0] = TO_HEX(((x & 0xF000) >> 12));
> +      res[1] = TO_HEX(((x & 0x0F00) >> 8));
> +      res[2] = TO_HEX(((x & 0x00F0) >> 4));
> +      res[3] = TO_HEX((x & 0x000F));
> +      res[4] = '\0';
> +    }
> +  return 0;
> +}

Ditto.

> +
> +void
> +clock_out(struct led7708_platform_data *pdata)
> +{
> +  gpio_set_value(pdata->sck_gpio, 1);
> +  msleep(MS50);

Please make the macro name more meaningful and add LED7708 prefix
to all macros.

Also use proper indentation.

> +  gpio_set_value(pdata->sck_gpio, 0);
> +  msleep(MS50);
> +
> +
> +}
> +
> +void
> +led7708_create_brightness_data(struct led7708_platform_data *pdata,
> +				u16 BrightnessData, char *brt_data_grp_dim)
> +{
> +
> +  if (pdata->led_config->data_fmt == LED7708_1X256) {
> +
> +      inttochar(BrightnessData, &data[0]);
> +      brt_data_grp_dim[0] = data[0];
> +      brt_data_grp_dim[1] = data[1];
> +      brt_data_grp_dim[2] = data[2];
> +      brt_data_grp_dim[3] = data[3];
> +    }
> +  else if (pdata->led_config->data_fmt == LED7708_1X192) {
> +      inttochar(BrightnessData, &data[0]);
> +      brt_data_grp_dim[0] = data[0];
> +      brt_data_grp_dim[1] = data[1];
> +      brt_data_grp_dim[2] = data[2];
> +      /* brt_data_grp_dim[3] = data[3]; */
> +
> +    }
> +
> +  return;
> +
> +}
> +
> +static int
> +convert_to_hex(char x)
> +{
> +  int d;
> +  if (x == 'F')
> +    d = 15;

x - '0' will do.
This function is not needed then.

> +  else if (x == 'E')
> +    d = 14;
> +  else if (x == 'D')
> +    d = 13;
> +  else if (x == 'C')
> +    d = 12;
> +  else if (x == 'B')
> +    d = 11;
> +  else if (x == 'A')
> +    d = 10;
> +  else
> +    d = x;
> +
> +  return d;
> +
> +}
> +
> +static int
> +write_led7708(struct led7708_platform_data *pdata, u8 pulse, char nbytes,
> +	       char *data_to_send)

Begin function names always with "led7708" namespacing prefix.

> +{
> +
> +  int pulses_before_lren = 0, i, j, flag, temp, mask;
> +  u8 received_stream[Max_Packet_Length], mode = 2;

Don't multiply empty lines.

> +
> +  for (i = 0; i < nbytes; i++) {
> +      temp = convert_to_hex(data_to_send[i]);
> +      mask = 8;

mask = 0x08 will look more familiar.

> +      received_stream[i] = 0;
> +
> +      for (j = 0; j <= 3; j++) {
> +	  flag = temp & mask;
> +
> +	  if (flag) {

Remove empty line.

> +	      gpio_set_value(pdata->sdo_gpio, 1);
> +	      msleep(MS50);
> +	      gpio_set_value(pdata->sck_gpio, 1);
> +	      msleep(MS50);
> +	      gpio_set_value(pdata->sck_gpio, 0);
> +	      msleep(MS50);
> +	      if (gpio_get_value(pdata->sdi_gpio))	{
> +		  received_stream[i] = received_stream[i] | mask;
> +		}
> +	    }
> +	  else {

Ditto.

> +	      gpio_set_value(pdata->sdo_gpio, 0);
> +	      msleep(MS50);
> +	      gpio_set_value(pdata->sck_gpio, 1);
> +	      msleep(MS50);
> +	      gpio_set_value(pdata->sck_gpio, 0);
> +	      msleep(MS50);
> +	      if (gpio_get_value(pdata->sdi_gpio)) {
> +		  received_stream[i] = received_stream[i] | mask;
> +		}

Ditto.

As well as in many other places. Compare other kernel drivers.
I'm sorry to say that your code looks scruffy.
You need to pay more attention to that.

> +	    }
> +
> +	  pulses_before_lren++;
> +
> +	  if (pulse != 0) {
> +	      if (pulses_before_lren == ((nbytes * 4) - pulse)) {
> +		  gpio_set_value(pdata->le_gpio, 1);
> +		  msleep(MS50);
> +
> +		}
> +	      if (pulses_before_lren == nbytes * 4) {
> +		  gpio_set_value(pdata->le_gpio, 0);
> +		  msleep(MS50);
> +
> +		}
> +	    }
> +	  mask = mask / 2;

mask >>= 1;

> +	}
> +    }
> +  if (pdata->led_config->mode == LED7708_R)  {
> +      for (i = 0; i < nbytes; i++)	{
> +	  if ((received_stream[i] >= 0) && (received_stream[i] <= 9)) {
> +	      received_stream[i] = received_stream[i] + 48;
> +	    }
> +	  else if ((received_stream[i] >= 10) && (received_stream[i] <= 15)) {
> +	      received_stream[i] = received_stream[i] + 55;
> +	    }
> +
> +	}
> +      dev_info(dev_global, "Continuous Brightness Reading = %s \n",
> +		received_stream);
> +    }
> +  return 0;
> +}
> +
> +
> +static void
> +led7708_led_brightness(struct st7708_led *led)
> +{
> +  struct led7708_chip *chip = led->chip;
> +  struct led7708_platform_data *pdata = chip->pdata;
> +
> +  mutex_lock(&chip->lock);
> +  if (led->chan_nr <= LED7708_MAX_CHANNELS) {
> +      channel_mask = channel_mask | ((1 << (led->chan_nr)) & (0xFFFF));
> +    }
> +
> +  /*Map the brightness to the LED7708 brightness value [0=255] - [0 - 65536] */

You can use whole 0 - 65535. max_brightness property overrides legacy
LED_FULL enum.

> +  led->brightness =
> +    led->brightness * (MAX_BRIGHTNESS) / (MAX_LED_SUBSYS_BRIGHTNESS);
> +
> +
> +  /*Group Dimming mode Disabled by default */
> +  if (!pdata->led_config->dimming_mode) {
> +      inttochar(channel_mask, &data[0]);
> +      write_led7708(chip->pdata, W_CHSEL, 4, data);
> +      /*enable the device */
> +      inttochar(0x2131, &data[0]);
> +      write_led7708(chip->pdata, W_DEVCFGx, 4, data);
> +      /*Write the common channel Brightness to the selected channels */
> +      inttochar(led->brightness, &data[0]);
> +      write_led7708(chip->pdata, W_BRT_GL, 4, data);
> +    }
> +  else {
> +
> +/*Select All channels
> + *inttochar(0xFFFF,&data[0]);
> + *write_led7708(chip->pdata,W_CHSEL,4,data);
> + *enable the device in GSME = 1 , group dimming mode
> + *inttochar(0x2501,&data[0]);
> + *write_led7708(chip->pdata,W_DEVCFGx,4,data);
> +*/
> +      if (pdata->led_config->data_fmt == LED7708_1X256) {
> +	  led7708_create_brightness_data(pdata, led->brightness,
> +					  &brightness_data_grp_dim_16[4 *
> +								      (15 -
> +								       led->
> +								       chan_nr)]);


> +	  dev_info(&chip->pd->dev,
> +		    "Current Brightness string = %s  strlen = %x \n",
> +		    brightness_data_grp_dim_16,
> +		    strlen (brightness_data_grp_dim_16));
> +	  dev_info(&chip->pd->dev, "Channel_mask = %x \n", channel_mask);

Too much detailed logging. Please remove it.

> +
> +	}
> +      else if (pdata->led_config->data_fmt == LED7708_1X192) {
> +	  led7708_create_brightness_data(pdata, led->brightness,
> +					  &brightness_data_grp_dim_12[3 *
> +								      (15 -
> +								       led->
> +								       chan_nr)]);
> +	  dev_info (&chip->pd->dev,
> +		    "Current Brightness string = %s  strlen = %x \n",
> +		    brightness_data_grp_dim_12,
> +		    strlen (brightness_data_grp_dim_12));
> +	  dev_info (&chip->pd->dev, "Channel_mask = %x \n", channel_mask);
> +
> +	}
> +      else if (pdata->led_config->data_fmt == LED7708_16X16) {
> +	  inttochar (led->brightness, &data[0]);
> +	  /* data Latch */
> +	  write_led7708 (chip->pdata, W_BRT_DL, 4, data);
> +	}
> +      else	{
> +	  dev_info (&chip->pd->dev, "Incorrect Value for data format");
> +
> +	}
> +    }
> +
> +  mutex_unlock (&chip->lock);
> +}
> +
> +
> +static char
> +demodecodewriteCmd (struct led7708_platform_data *led_dat, char mode,
> +		    char buffer[Max_Packet_Length])
> +{
> +
> +  char n_bytes = 0;
> +  char le_pulses = 0;
> +  char usb_received_bytes = strlen (buffer) - 1;
> +  int i;
> +
> +  if ((buffer[0] == '(') && (buffer[3] == ',') && (buffer[6] == ',') &&
> +      (buffer[usb_received_bytes - 1] == ')') && (buffer[1] >= '0') &&
> +      (buffer[1] <= '9') && (buffer[2] >= '0') && (buffer[2] <= '9') &&
> +      (buffer[4] >= '0') && (buffer[4] <= '9') && (buffer[5] >= '0')
> +      && (buffer[5] <= '9')) {
> +
> +      le_pulses = (buffer[2] - 48) + 10 * (buffer[1] - 48);
> +      n_bytes = (buffer[5] - 48) + 10 * (buffer[4] - 48);
> +
> +      if (n_bytes == (usb_received_bytes - 8))	{
> +
> +	  /* Convert received data characters into ASCII value if nibble mode: */
> +	  if (mode != 0)
> +	    for (i = 7; i <= usb_received_bytes - 2; i++) {
> +		if (buffer[i] >= 'A' && buffer[i] <= 'F')
> +		  buffer[i] = buffer[i] - 55;
> +		else if (buffer[i] >= '0' && buffer[i] <= '9')
> +		  buffer[i] = buffer[i] - 48;
> +		else
> +		  buffer[i] = 0;
> +	      }
> +	  write_led7708 (led_dat, le_pulses, n_bytes, &buffer[7]);
> +
> +	}
> +      else {
> +	  return ERR;
> +	}
> +
> +    }
> +  else {
> +      return ERR;
> +    }
> +
> +
> +  return NOERR;
> +
> +}
> +
> +
> +static ssize_t
> +led_7708_data_fmt_store (struct device *dev,
> +			 struct device_attribute *attr,
> +			 const char *buff, size_t count)
> +{
> +  /* struct st7708_led *led_dat =    container_of(dev_get_drvdata (dev), struct st7708_led, cdev); */
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;
> +  struct led7708_platform_data *pdata = chip->pdata;
> +  u16 data_fmt_reg_value = 0;
> +  /*BDFS , BRLS
> +   * 0       0  -> 0 => 16x16, 12-bit , (the 4 most significant bits are not used)
> +   * 0       1  -> 1 => 16x16, 16-bit (default)
> +   * 1       0  -> 2 => 192x1, 12-bit
> +   * 1       1  -> 3 => 256x1, 16-bit
> +   */
> +
> +  mutex_lock (&chip->lock);
> +
> +  if (!strncmp (buff, "0", 1)) {
> +      pdata->led_config->data_fmt = LED7708_12X16;
> +      data_fmt_reg_value = 0x8440;
> +      dev_info (&chip->pd->dev,
> +		" Current Brightness Data Format Set is = %d \n",
> +		pdata->led_config->data_fmt);
> +    }
> +  else if (!strncmp (buff, "1", 1)) {
> +      pdata->led_config->data_fmt = LED7708_16X16;
> +      data_fmt_reg_value = 0x8440;
> +      dev_info (&chip->pd->dev,
> +		" Current Brightness Data Format Set is = %d \n",
> +		pdata->led_config->data_fmt);
> +    }
> +  else if (!strncmp (buff, "2", 1)) {
> +      pdata->led_config->data_fmt = LED7708_1X192;
> +      data_fmt_reg_value = 0xC240;
> +      dev_info (&chip->pd->dev,
> +		" Current Brightness Data Format Set is = %d \n",
> +		pdata->led_config->data_fmt);
> +    }
> +  else if (!strncmp (buff, "3", 1)) {
> +      pdata->led_config->data_fmt = LED7708_1X256;
> +      data_fmt_reg_value = 0xC640;
> +      dev_info (&chip->pd->dev,
> +		" Current Brightness Data Format Set is = %d \n",
> +		pdata->led_config->data_fmt);
> +    }
> +  else
> +    dev_info (&chip->pd->dev,
> +	      " Wrong value Set, [0-3] accepted only.Previous Value Retained = %d \n",
> +	      pdata->led_config->data_fmt);
> +
> +
> +
> +  if (pdata->led_config->data_fmt == LED7708_12X16) {
> +      inttochar (0x2500, &data[0]);
> +      dev_info (&chip->pd->dev, "16X16 : %s written \n", data);
> +      write_led7708 (chip->pdata, W_DEVCFGx, 4, data);
> +    }
> +/*16 bit resolution*/
> +  inttochar (data_fmt_reg_value, &data[0]);
> +  dev_info (&chip->pd->dev, "data FMT : %s written \n", data);
> +  write_led7708 (chip->pdata, W_DEVCFGx, 4, data);
> +
> +  mutex_unlock (&chip->lock);
> +
> +  return count;
> +}
> +
> +static ssize_t
> +led_7708_dimming_mode_store (struct device *dev,
> +			     struct device_attribute *attr,
> +			     const char *buff, size_t count)
> +{
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;
> +  struct led7708_platform_data *pdata = chip->pdata;

Pleas add an empty line here.

> +  /*GSME
> +   * 0       GSME => Group Dimming mode Enabled
> +   * 1       GSME => Group Dimming mode Disabled
> +   */
> +
> +  mutex_lock (&chip->lock);
> +
> +  if (!strncmp (buff, "0", 1)) {

Use kstrtoul. Compare e.g. brightness_store() in
drivers/led/led-class.c.

> +      pdata->led_config->dimming_mode = LED7708_GREY_SCALE_MODE_GRP_DIM;
> +      dev_info (&chip->pd->dev,
> +		" Current Brightness Data Format Set is = %d \n",
> +		pdata->led_config->dimming_mode);
> +      inttochar (0x2130, &data[0]);
> +    }
> +  else if (!strncmp (buff, "1", 1)) {
> +      pdata->led_config->dimming_mode = LED7708_GREY_SCALE_MODE_GRY_DIM;
> +      dev_info (&chip->pd->dev,
> +		" Current Brightness Data Format Set is = %d \n",
> +		pdata->led_config->dimming_mode);
> +      inttochar (0x2530, &data[0]);
> +    }
> +  else
> +    dev_info (&chip->pd->dev,
> +	      " Wrong value Set, [0-1] accepted only.Previous Value Retained = %d \n",
> +	      pdata->led_config->dimming_mode);
> +
> +  dev_info (&chip->pd->dev, "Dimming mode : %s written \n", data);
> +  write_led7708 (pdata, W_DEVCFGx, 4, data);
> +  mutex_unlock (&chip->lock);
> +
> +
> +  return count;
> +}
> +
> +
> +static ssize_t
> +led_7708_sync_brightness_store (struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buff, size_t count)
> +{
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;
> +  struct led7708_platform_data *pdata = chip->pdata;
> +
> +  struct st7708_led *led =
> +    container_of (dev_get_drvdata (dev), struct st7708_led, cdev);
> +  mutex_lock (&chip->lock);
> +
> +  if (!strncmp (buff, "0", 1)) {
> +      pdata->led_config->sync_brightness = 0;
> +    }
> +  else if (!strncmp (buff, "1", 1))  {
> +      pdata->led_config->sync_brightness = 1;
> +    }
> +  else
> +    dev_info (&chip->pd->dev,
> +	      " Wrong value Set, [0-1] accepted only.Previous Value Retained = %d \n",
> +	      pdata->led_config->sync_brightness);
> +
> +/* if Sync received then write both the channel mask and the Brightness string accumulated ar*/

What is "ar"? Also put a space before closing "*/"

> +  if (pdata->led_config->sync_brightness) {
> +
> +      inttochar (channel_mask, &data[0]);
> +      dev_info (&chip->pd->dev, "Channel Mask 0x: %s written \n", data);
> +      write_led7708 (chip->pdata, W_CHSEL, 4, data);
> +      dev_info (&chip->pd->dev, "Device Enabled 0x : %s written \n", data);
> +
> +      /*Device Enabled */
> +      if (pdata->led_config->data_fmt == LED7708_16X16)  {
> +
> +	  inttochar (0x2501, &data[0]);
> +	}
> +      else	{
> +	  inttochar (0x2531, &data[0]);
> +	}
> +
> +      write_led7708 (chip->pdata, W_DEVCFGx, 4, data);
> +
> +      /*write the brightness data now
> +       *dev_info(&chip->pd->dev, "Current Brightness Data value = %s \n",brightness_data_grp_dim);
> +       *        brightness_data_grp_dim[64] = '\n';
> +       */
> +      if (pdata->led_config->data_fmt == LED7708_1X256)	{
> +	  dev_info (&chip->pd->dev,
> +		    "Final Brightness Data value = %s  strlen = %d \n",
> +		    brightness_data_grp_dim_16,
> +		    strlen (brightness_data_grp_dim_16));
> +	  write_led7708 (chip->pdata, W_BRT_GL, 64,
> +			 brightness_data_grp_dim_16);
> +
> +	}
> +      else if (pdata->led_config->data_fmt == LED7708_1X192) {
> +	  dev_info (&chip->pd->dev,
> +		    "Final Brightness Data value = %s  strlen = %d \n",
> +		    brightness_data_grp_dim_12,
> +		    strlen (brightness_data_grp_dim_12));
> +	  write_led7708 (chip->pdata, W_BRT_GL, 48,
> +			 brightness_data_grp_dim_12);
> +
> +	}
> +      else if (pdata->led_config->data_fmt == LED7708_16X16) {
> +	  inttochar (led->brightness, &data[0]);
> +	  /* Global Latch */
> +	  write_led7708 (chip->pdata, W_BRT_GL, 4, data);
> +
> +	}
> +
> +    }
> +  else  {
> +      /*deselect all the channels */
> +      write_led7708 (chip->pdata, W_CHSEL, 4, "0000");
> +
> +    }
> +
> +  mutex_unlock (&chip->lock);
> +
> +
> +  return count;
> +}
> +
> +
> +static ssize_t
> +led_7708_dbg_rw_store (struct device *dev,
> +		       struct device_attribute *attr,
> +		       const char *buff, size_t count)
> +{
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;
> +  struct led7708_platform_data *pdata = chip->pdata;
> +  mutex_lock (&chip->lock);
> +
> +  demodecodewriteCmd (pdata, 2, buff);
> +
> +  mutex_unlock (&chip->lock);
> +
> +
> +  return count;
> +}
> +
> +
> +static ssize_t
> +led_7708_enable_csrd_store (struct device *dev,
> +			    struct device_attribute *attr,
> +			    const char *buff, size_t count)
> +{
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;
> +  struct led7708_platform_data *pdata = chip->pdata;
> +  /*
> +   * 0       W => Continuous Brightness Reading mode Enabled
> +   * 1       R => Continuous Brightness Reding mode Disabled
> +   */
> +
> +  mutex_lock (&chip->lock);
> +  if (pdata->led_config->data_fmt == LED7708_1X192
> +      || pdata->led_config->data_fmt == LED7708_1X256)  {
> +
> +      if (!strncmp (buff, "0", 1)) {
> +	  pdata->led_config->mode = 0;
> +	  dev_info (&chip->pd->dev, " Current csrd mode  is = %d \n",
> +		    pdata->led_config->mode);
> +	}
> +      else if (!strncmp (buff, "1", 1))	{
> +	  pdata->led_config->mode = 1;
> +	  dev_info (&chip->pd->dev, " Current csrd mode  is = %d \n",
> +		    pdata->led_config->mode);
> +	}
> +    }  else   {
> +
> +      dev_err (&chip->pd->dev,
> +	       " CSRD not Available Only in 1X256 and 1X192 mode ,Current mode value remains = %d \n",
> +	       pdata->led_config->mode);
> +
> +    }
> +
> +  mutex_unlock (&chip->lock);
> +
> +
> +  return count;
> +}
> +
> +
> +static ssize_t
> +led_7708_select_channel_store (struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buff, size_t count)
> +{
> +  int i, m = 1;
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;
> +
> +  mutex_lock (&chip->lock);

Add an empty line after mutex_lock().

> +  channel_mask = 0;
> +  for (i = sizeof (buff) - 1; i > -1; i--, m *= 16)
> +    channel_mask += m * chartohex (buff[i]);
> +
> +  inttochar (channel_mask, &data[0]);
> +  /*write select the channels */

Put a space after "/*".

> +  write_led7708 (chip->pdata, W_CHSEL, 4, data);

Too much empty lines.

> +
> +  mutex_unlock (&chip->lock);
> +

Ditto.

> +  return count;
> +}
> +
> +
> +static ssize_t
> +led_7708_data_fmt_show (struct device *dev, struct device_attribute *attr,
> +			char *buf)
> +{
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;
> +  struct led7708_platform_data *pdata = chip->pdata;
> +  char bufc[2] = "0";
> +  dev_info (&chip->pd->dev, "current Dimming mode %d \n",
> +	 pdata->led_config->data_fmt);
> +	switch (pdata->led_config->data_fmt) {
> +	case 0:
> +	strcpy (bufc, "0");
> +	break;
> +
> +	case 1:
> +	strcpy (bufc, "1");
> +	break;
> +
> +	case 2:
> +	strcpy (bufc, "2");
> +	break;
> +
> +	case 3:
> +	strcpy (bufc, "3");
> +	break;
> +
> +	default:
> +	break;
> +
> +    }
> +  return sprintf (buf, "%s\n", bufc);
> +
> +}
> +
> +
> +static ssize_t
> +led_7708_dimming_mode_show (struct device *dev, struct device_attribute *attr,
> +			    char *buf)
> +{
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;

This is unnecessarily complex. Do it in separate steps.

> +  struct led7708_platform_data *pdata = chip->pdata;
> +  char bufc[2] = "0";

Put an empty line after after such definitions.

> +  dev_info (&chip->pd->dev, "current Dimming mode %d \n",
> +	    pdata->led_config->dimming_mode);
> +	switch (pdata->led_config->dimming_mode) {
> +	case 0:
> +	strcpy (bufc, "0");
> +	break;
> +	case 1:
> +	strcpy (bufc, "1");
> +	break;
> +	default:
> +	break;

This switch is redunant. You could use:

sprintf (buf, "%d\n", pdata->led_config->dimming_mode);

> +	 }
> +  return sprintf (buf, "%s\n", bufc);
> +
> +}
> +
> +static ssize_t
> +led_7708_sync_brightness_show (struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;
> +  struct led7708_platform_data *pdata = chip->pdata;
> +  char bufc[2] = "0";
> +  dev_info (&chip->pd->dev, "current sync_brightness Enable %d \n",
> +	    pdata->led_config->sync_brightness);
> +	switch (pdata->led_config->sync_brightness)  {
> +	case 0:
> +	strcpy (bufc, "0");
> +	break;
> +
> +	case 1:
> +	strcpy (bufc, "1");
> +	break;
> +
> +	default:
> +	break;
> +
> +	}
> +  return sprintf (buf, "%s\n", bufc);
> +}
> +
> +static ssize_t
> +led_7708_dbg_rw_show (struct device *dev, struct device_attribute *attr,
> +		      char *buf)
> +{
> +  /*struct led_classdev *led_cdev = dev_get_drvdata (dev);
> +   * struct st7708_led *led_dat =  container_of (led_cdev, struct st7708_led, cdev);
> +   */
> +  return sprintf (buf, "%d\n", 1);;
> +}
> +
> +static ssize_t
> +led_7708_enable_csrd_show (struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;
> +  struct led7708_platform_data *pdata = chip->pdata;
> +  char bufc[2] = "0";
> +  dev_info (&chip->pd->dev, "current csrd mode %d \n",
> +	    pdata->led_config->mode);
> +	switch (pdata->led_config->mode) {
> +	case 0:
> +	strcpy (bufc, "0");
> +	break;
> +
> +	case 1:
> +	strcpy (bufc, "1");
> +	break;
> +
> +	default:
> +	break;
> +
> +    }
> +  return sprintf (buf, "%s\n", bufc);
> +}
> +
> +
> +static ssize_t
> +led_7708_select_channel_show (struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +  struct led7708_chip *chip =
> +    (container_of (dev_get_drvdata (dev), struct st7708_led, cdev))->chip;
> +  struct led7708_platform_data *pdata = chip->pdata;
> +
> +  return sprintf (buf, "Channel Select Mask %x\n", channel_mask);
> +}
> +
> +/*common device attribute for controlling all the 16 channels*/
> +static DEVICE_ATTR (led_7708_dimming_mode, 0644, led_7708_dimming_mode_show,
> +		    led_7708_dimming_mode_store);
> +static DEVICE_ATTR (led_7708_data_fmt, 0644, led_7708_data_fmt_show,
> +		    led_7708_data_fmt_store);
> +static DEVICE_ATTR (led_7708_sync_brightness, 0644,
> +		    led_7708_sync_brightness_show,
> +		    led_7708_sync_brightness_store);
> +static DEVICE_ATTR (led_7708_dbg_rw, 0644, led_7708_dbg_rw_show,
> +		    led_7708_dbg_rw_store);
> +static DEVICE_ATTR (led_7708_enable_csrd, 0644, led_7708_enable_csrd_show,
> +		    led_7708_enable_csrd_store);
> +static DEVICE_ATTR (led_7708_select_channel, 0644,
> +		    led_7708_select_channel_show,
> +		    led_7708_select_channel_store);
> +
> +
> +static struct attribute *st7708_led_common_attrs[] = {
> +  &dev_attr_led_7708_dimming_mode.attr,
> +  &dev_attr_led_7708_data_fmt.attr,
> +  &dev_attr_led_7708_sync_brightness.attr,
> +  &dev_attr_led_7708_dbg_rw.attr,
> +  &dev_attr_led_7708_enable_csrd.attr,
> +  &dev_attr_led_7708_select_channel.attr,
> +  NULL
> +};
> +
> +ATTRIBUTE_GROUPS (st7708_led_common);
> +
> +
> +/* Chip specific configurations */
> +static struct led7708_device_config led_cfg = {
> +
> +/*Extra Channel is for Common Channel Configuration */
> +  .max_channel = LED7708_MAX_CHANNELS + 1,
> +  .brightness_fn = led7708_led_brightness,
> +};
> +
> +
> +static struct led7708_platform_data *
> +led7708_of_populate_pdata (struct device *dev, struct device_node *np)
> +{
> +  struct device_node *child;
> +  struct led7708_platform_data *pdata;
> +  struct led7708_config *cfg;
> +  int ret;
> +  int num_channels;
> +  int i = 0;
> +
> +  pdata = devm_kzalloc (dev, sizeof (*pdata), GFP_KERNEL);

Don't add space after the function name.

> +  if (!pdata)
> +    return ERR_PTR (-ENOMEM);
> +
> +  num_channels = of_get_child_count (np);
> +  if (num_channels == 0)  {
> +      dev_err (dev, "no LED channels\n");
> +      return ERR_PTR (-EINVAL);
> +    }
> +
> +  cfg = devm_kzalloc (dev, sizeof (*cfg) * num_channels, GFP_KERNEL);
> +  if (!cfg)
> +    return ERR_PTR (-ENOMEM);
> +
> +  pdata->led_config = &cfg[0];
> +  pdata->num_channels = num_channels;
> +
> +  for_each_child_of_node (np, child)  {
> +    cfg[i].chan_nr = i;
> +
> +    of_property_read_string (child, "chan-name", &cfg[i].name);
> +    cfg[i].default_trigger =
> +      of_get_property (child, "linux,default-trigger", NULL);
> +
> +    i++;
> +  }
> +
> +  of_property_read_string (np, "label", &pdata->label);
> +
> +  /*Parse all the GPIOs from the Device Tree */
> +    ret = of_get_named_gpio (np, "sdo-gpio", 0);
> +	if (ret > 0)
> +	pdata->sdo_gpio = ret;
> +	else
> +    goto gpio_error;
> +
> +    ret = of_get_named_gpio (np, "sdi-gpio", 0);

Use devm_gpiod_get().

> +    if (ret > 0)
> +    pdata->sdi_gpio = ret;
> +    else
> +    goto gpio_error;
> +
> +
> +	ret = of_get_named_gpio (np, "le-gpio", 0);
> +	if (ret > 0)
> +	pdata->le_gpio = ret;
> +	else
> +	goto gpio_error;
> +
> +	ret = of_get_named_gpio (np, "lren-gpio", 0);
> +	if (ret > 0)
> +	pdata->lren_gpio = ret;
> +	else
> +	goto gpio_error;
> +
> +
> +	ret = of_get_named_gpio (np, "sck-gpio", 0);
> +	if (ret > 0)
> +	pdata->sck_gpio = ret;
> +	else
> +	 goto gpio_error;
> +
> +  return pdata;
> +
> +gpio_error:
> +  return ret;
> +
> +}
> +
> +static int
> +led7708_init_device (struct led7708_chip *chip)
> +{
> +  struct led7708_platform_data *pdata;
> +  struct led7708_device_config *cfg;
> +  struct device *dev = &chip->pd->dev;
> +  int ret = 0;
> +
> +  pdata = chip->pdata;
> +  cfg = chip->cfg;
> +
> +  if (!pdata || !cfg)
> +    return -EINVAL;
> +
> +
> +  if (gpio_is_valid (pdata->sdi_gpio))  {
> +      ret =
> +	devm_gpio_request_one (dev, pdata->sdi_gpio, GPIOF_DIR_IN,
> +			       "sdi-gpio");
> +      if (ret < 0) {
> +	  dev_err (dev, "could not acquire sdi_gpio (err=%d)\n", ret);
> +	  goto err;
> +	}
> +
> +    }
> +
> +  if (gpio_is_valid (pdata->sck_gpio))  {
> +      ret =
> +	devm_gpio_request_one (dev, pdata->sck_gpio, GPIOF_DIR_OUT,
> +			       "sck-gpio");
> +      if (ret < 0) {
> +	  dev_err (dev, "could not acquire sck_gpio (err=%d)\n", ret);
> +	  goto err;
> +	}
> +
> +    }
> +
> +
> +  if (gpio_is_valid (pdata->lren_gpio))  {
> +      ret =
> +	devm_gpio_request_one (dev, pdata->lren_gpio, GPIOF_DIR_OUT,
> +			       "lren-gpio");
> +      if (ret < 0) {
> +	  dev_err (dev, "could not acquire lren_gpio (err=%d)\n", ret);
> +	  goto err;
> +	}
> +
> +    }
> +
> +  if (gpio_is_valid (pdata->le_gpio))  {
> +      ret =
> +	devm_gpio_request_one (dev, pdata->le_gpio, GPIOF_DIR_OUT, "le-gpio");
> +      if (ret < 0)	{
> +	  dev_err (dev, "could not acquire le_gpio (err=%d)\n", ret);
> +	  goto err;
> +	}
> +
> +    }
> +
> +
> +  if (gpio_is_valid (pdata->sdo_gpio))  {
> +      ret =
> +	devm_gpio_request_one (dev, pdata->sdo_gpio, GPIOF_DIR_OUT,
> +			       "sdo_gpio");
> +      if (ret < 0)	{
> +	  dev_err (dev, "could not acquire sdo_gpio (err=%d)\n", ret);
> +	  goto err;
> +	}
> +
> +    }
> +
> +  gpio_set_value(pdata->lren_gpio, 0);
> +  msleep(MS50);
> +  gpio_set_value(pdata->lren_gpio, 1);
> +  msleep(MS50);
> +
> +
> +  return 0;
> +
> +err:
> +  return ret;
> +}
> +
> +
> +static void
> +led7708_set_brightness (struct led_classdev *cdev,
> +			enum led_brightness brightness)
> +{
> +  struct st7708_led *led = cdev_to_led7708_led (cdev);
> +  struct led7708_device_config *cfg = led->chip->cfg;
> +  led->brightness = (u8) brightness;
> +  return cfg->brightness_fn(led);
> +}
> +
> +static int
> +led7708_init_led (struct st7708_led *led, struct led7708_chip *chip, int chan)
> +{
> +  struct led7708_platform_data *pdata = chip->pdata;
> +  struct led7708_device_config *cfg = chip->cfg;
> +  struct device *dev = &chip->pd->dev;
> +  char name[32];
> +  int ret;
> +  int max_channel = cfg->max_channel;
> +
> +
> +
> +  if (chan >= max_channel)  {
> +      dev_err (dev, "invalid channel: %d / %d\n", chan, max_channel);
> +      return -EINVAL;
> +    }
> +
> +  led->chan_nr = pdata->led_config[chan].chan_nr;
> +  led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
> +
> +  if (led->chan_nr >= max_channel)  {
> +      dev_err (dev, "Use channel numbers between 0 and %d\n",
> +	       max_channel - 1);
> +      return -EINVAL;
> +    }
> +
> +  led->cdev.brightness_set = led7708_set_brightness;
> +
> +  if (pdata->led_config[chan].name)  {
> +      led->cdev.name = pdata->led_config[chan].name;
> +    }
> +  else  {
> +      snprintf (name, sizeof (name), "%s:channel%d",
> +		pdata->label ? : chip->pd->name, chan);
> +      led->cdev.name = name;
> +    }
> +
> +  if (!strcmp (led->cdev.name, "led7708-chan-comm"))  {
> +      led->cdev.groups = st7708_led_common_groups;
> +
> +
> +    }
> +
> +  ret = led_classdev_register (dev, &led->cdev);

Use devm prefixed version.

> +  if (ret)  {
> +      dev_err (dev, "led register err: %d\n", ret);
> +      return ret;
> +    }
> +  else {
> +
> +
> +    }
> +
> +  return 0;
> +}
> +
> +static void
> +led7708_unregister_leds (struct st7708_led *led, struct led7708_chip *chip)
> +{
> +  int i;
> +  struct st7708_led *each;
> +
> +  for (i = 0; i < chip->num_leds; i++)  {
> +      each = led + i;
> +      led_classdev_unregister (&each->cdev);
> +    }
> +}
> +
> +static int
> +led7708_register_leds (struct st7708_led *led, struct led7708_chip *chip)
> +{
> +  struct led7708_platform_data *pdata = chip->pdata;
> +  struct led7708_device_config *cfg = chip->cfg;
> +  int num_channels = pdata->num_channels;
> +  struct st7708_led *each;
> +  int ret;
> +  int i;
> +
> +  if (!cfg->brightness_fn)  {
> +      dev_err (&chip->pd->dev, "empty brightness configuration\n");
> +      return -EINVAL;
> +    }
> +
> +  for (i = 0; i < num_channels; i++) {
> +
> +      each = led + i;
> +      ret = led7708_init_led(each, chip, i);
> +      if (ret)	{
> +	  goto err_init_led;
> +	}
> +      else{
> +
> +	}
> +
> +      chip->num_leds++;
> +      each->chip = chip;
> +
> +    }
> +
> +
> +  return 0;
> +
> +err_init_led:
> +  led7708_unregister_leds(led, chip);
> +  return ret;
> +}
> +
> +void
> +led7708_deinit_device (struct led7708_chip *chip)
> +{
> +  struct led7708_platform_data *pdata = chip->pdata;
> +  if (gpio_is_valid(pdata->lren_gpio))
> +    /*Disables the device */
> +    gpio_set_value(pdata->lren_gpio, 0);
> +
> +}
> +
> +static void
> +st_led_7708_init (struct led7708_chip *chip)
> +{
> +  struct led7708_platform_data *pdata = chip->pdata;
> +
> +  mutex_lock(&chip->lock);
> +  /*defautl configure in the 16 Bit resolution 1X256 bit data format mode , enable gray scale mode */
> +  write_led7708(pdata, W_DEVCFGx, 4, "2530");
> +  write_led7708(pdata, W_DEVCFGx, 4, "C640");
> +  msleep(MS50);
> +
> +  mutex_unlock(&chip->lock);
> +
> +}
> +
> +
> +static int
> +st_led_7708_probe (struct platform_device *pdev)
> +{
> +  int ret;
> +  struct led7708_chip *chip;
> +  struct st7708_led *led;
> +  struct led7708_platform_data *pdata = dev_get_platdata(&pdev->dev);
> +  struct device_node *np = pdev->dev.of_node;
> +
> +  if (!pdata)  {
> +      if (np) {
> +	  pdata = led7708_of_populate_pdata(&pdev->dev, np);
> +	  if (IS_ERR(pdata))
> +	    return PTR_ERR(pdata);
> +	}
> +      else	{
> +	  dev_err(&pdev->dev, "no platform data\n");
> +	  return -EINVAL;
> +	}
> +    }
> +
> +  chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +  if (!chip)
> +    return -ENOMEM;
> +
> +  led = devm_kzalloc(&pdev->dev,
> +		      sizeof(*led) * pdata->num_channels, GFP_KERNEL);
> +  if (!led)
> +    return -ENOMEM;
> +
> +  chip->pd = pdev;
> +  chip->pdata = pdata;
> +  chip->cfg = &led_cfg;
> +
> +
> +  mutex_init(&chip->lock);
> +
> +  platform_set_drvdata(pdev, led);
> +
> +
> +  ret = led7708_init_device(chip);
> +  if (ret)
> +    goto err_init;
> +
> +  ret = led7708_register_leds(led, chip);
> +
> +  if (ret)
> +    goto err_register_leds;
> +
> +  if (ret) {
> +      dev_err(&pdev->dev, "registering sysfs failed\n");
> +      goto err_register_sysfs;
> +    }
> +  else {
> +
> +    }
> +
> +  /*Initialize the led7708 with gsme =1 , 16 bit resolution and all channels de-selected */
> +  st_led_7708_init(chip);
> +
> +  dev_global = &chip->pd->dev;
> +
> +
> +  return 0;
> +
> +err_register_sysfs:
> +  led7708_unregister_leds(led, chip);
> +err_register_leds:
> +  led7708_deinit_device(chip);
> +err_init:
> +  return ret;
> +}
> +
> +
> +
> +static int
> +st_led_7708_remove (struct platform_device *pdev)
> +{
> +  struct st7708_led *led = platform_get_drvdata(pdev);
> +  struct led7708_chip *chip = led->chip;
> +  chip->pdata->led_config->sync_brightness = 0;
> +
> +  led7708_unregister_leds(led, chip);
> +  led7708_deinit_device(chip);
> +
> +  dev_info(&pdev->dev, "ST LED7708 Driver removed Successfully \n");
> +
> +
> +  return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id of_st_leds_match[] = {
> +{.compatible = "st,st-leds",},
> +{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, of_st_leds_match);
> +#endif
> +
> +static struct platform_driver st_led_7708_driver = {
> +.driver = {
> +	     .name = "leds-st",
> +	     .of_match_table = of_match_ptr(of_st_leds_match),
> +	     },
> +.probe = st_led_7708_probe,
> +.remove = st_led_7708_remove,
> +};
> +
> +module_platform_driver(st_led_7708_driver);
> +
> +MODULE_AUTHOR("Saurabh Rawat <saurabh.rawat@st.com>");
> +MODULE_DESCRIPTION("ST LED7708 Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/KERNEL/include/linux/platform_data/leds-st.h b/KERNEL/include/linux/platform_data/leds-st.h
> new file mode 100644
> index 0000000..4a5a31f
> --- /dev/null
> +++ b/KERNEL/include/linux/platform_data/leds-st.h
> @@ -0,0 +1,170 @@
> +/*
> + * Platform data structure for ST LED7708 driver
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#ifndef __LEDS_7708_ST_H
> +#define __LEDS_7708_ST_H
> +
> +#define W_BRT_DL    1
> +#define W_BRT_GL    2
> +#define W_CHSEL     4
> +#define R_CHSTA     7
> +#define W_DEVCFGx   8
> +#define R_DEVCFGx   11
> +#define W_GSLAT     13
> +
> +/* DEVCFG0 register bits */
> +#define DEVCFG0_DEN		(1 << 0) /* Device Enable */
> +#define DEVCFG0_EDMI		(1 << 1) /* Error Detection Mode Indctr  */
> +#define DEVCFG0_OVFW		(1 << 2) /* Regulation DAC Overflow */
> +#define DEVCFG0_OTAF		(1 << 3) /* Over-Temperature Alert Flag  */
> +#define DEVCFG0_OCAD		(1 << 4) /* Open Channels Auto Disconnect*/
> +#define DEVCFG0_SCAD		(1 << 5) /* Shorted Channels Auto Disconn*/
> +#define DEVCFG0_CFP		(1 << 6) /* Critical Fault Protection    */
> +#define DEVCFG0_RWAS		(1 << 7) /* Regulation Wndw Amplitude Sel*/
> +#define DEVCFG0_DTS_DIS		(0 << 8) /* Regulation Wndw Amplitude Sel*/
> +#define DEVCFG0_DTS_3_4		(1 << 8) /* Regulation Wndw Amplitude Sel*/
> +#define DEVCFG0_DTS_6_8		(2 << 8) /* Regulation Wndw Amplitude Sel*/
> +#define DEVCFG0_DTS_8_4		(3 << 8) /* Regulation Wndw Amplitude Sel*/
> +#define DEVCFG0_GSME		(1 << 10) /* Gray-Scale Mode Enable       */
> +#define DEVCFG0_CRS		(1 << 11) /* Current Range Selector       */
> +#define DEVCFG0_OVRS		(1 << 12) /* Output Volt Regulation Stat  */
> +#define DEVCFG0_OVRE		(1 << 13) /* Output Volt Regulation Enbl  */
> +#define DEVCFG0_SDMS		(1 << 14) /* Slave Device Mode Selection  */
> +#define DEVCFG0_DEST_CFG0	(0 << 15) /* FIFO loaded into DEVCFG0     */
> +
> +/* DEVCFG1 register bits */
> +#define DEVCFG1_ADJ_SET(_val)	(((_val) & 0x3f) << 0)
> +/* Current Gain Adjust          */
> +#define DEVCFG1_CGRS		(1 << 6) /* Current Gain Range Selector  */
> +#define DEVCFG1_LAT16		(1 << 7) /* Bits #16 of dimming latency  */
> +#define DEVCFG1_LAT17		(1 << 8) /* Bits #17 of dimming latency  */
> +#define DEVCFG1_BDFS		(1 << 9) /* Brightness Data Format Sel   */
> +#define DEVCFG1_BRLS		(1 << 10) /* Brightness Registers Len Sel */
> +#define DEVCFG1_DTIN		(1 << 11) /* Dimming Timing Inversion sel */
> +#define DEVCFG1_DASS		(1 << 12) /* Data Synchronization Selector*/
> +#define DEVCFG1_DSYS		(1 << 13) /* Dimming Synch Selector       */
> +#define DEVCFG1_CSRD		(1 << 14) /* Continuous Status Reading    */
> +#define DEVCFG1_DEST_CFG1	(1 << 15) /* FIFO loaded into DEVCFG1     */
> +
> +#define TO_HEX(i) (i <= 9 ? '0' + i : 'A' - 10 + i)
> +
> +#define LED7708_MAX_CHANNELS		16
> +#define MAX_BRIGHTNESS			0xffff
> +#define MAX_LED_SUBSYS_BRIGHTNESS	0xff
> +#define MAX_LENGTH			100
> +#define Max_Packet_Length		100
> +#define ERR 1
> +#define NOERR 0
> +
> +
> +#define MS50 0
> +#define MS100 0
> +
> +enum st_led_modes {
> +LED7708_W = 0,
> +LED7708_R = 1,
> +};
> +
> +enum st_led_datafmt {
> +LED7708_12X16 = 0,
> +LED7708_16X16 = 1,
> +LED7708_1X192 = 2,
> +LED7708_1X256 = 3,
> +};
> +
> +enum st_led_gsme_mode {
> +LED7708_GREY_SCALE_MODE_GRP_DIM = 0,
> +LED7708_GREY_SCALE_MODE_GRY_DIM = 1,
> +};
> +
> +
> +struct st_led {
> +const char *name;
> +const char *default_trigger;
> +unsigned le;
> +unsigned lren;
> +unsigned sdo;
> +unsigned sck;
> +unsigned sdi;
> +};
> +
> +struct st_led_platform_data {
> +int num_leds;
> +struct st_led *leds;
> +};
> +
> +/*
> + * struct led7708_chip
> + * @pdata      : Platform specific data
> + * @lock       : Lock for user-space interface
> + * @num_leds   : Number of registered LEDs
> + * @cfg        : Device specific configuration data
> + */
> +struct led7708_chip {
> +struct platform_device *pd;
> +struct led7708_platform_data *pdata;
> +struct mutex lock;		/* lock for user-space interface */
> +int num_leds;
> +struct led7708_device_config *cfg;
> +};
> +
> +
> +/*
> + * struct st7708_led
> + * @chan_nr         : Channel number
> + * @cdev            : LED class device
> + * @brightness      : Brightness value
> + * @chip            : The led7708 chip data
> + */
> +struct st7708_led {
> +int chan_nr;
> +struct led_classdev cdev;
> +u16 brightness;
> +struct led7708_chip *chip;
> +};
> +
> + /*
> +  * struct led7708_platform_data
> +  * @led_config        : Configurable led class device
> +  * @num_channels      : Number of LED channels
> +  * @label             : Used for naming LEDs
> +  */
> +struct led7708_platform_data {
> +
> +  /* LED channel configuration */
> +struct led7708_config *led_config;
> +u8 num_channels;
> +const char *label;
> +int sdo_gpio;
> +int sdi_gpio;
> +int sck_gpio;
> +int lren_gpio;
> +int le_gpio;
> +
> +};
> +
> +struct led7708_config {
> +const char *name;
> +const char *default_trigger;
> +u8 chan_nr;
> +u8 dimming_mode;
> +u8 data_fmt;
> +u8 sync_brightness;
> +u8 mode;
> +};
> +
> +struct led7708_device_config {
> +const int max_channel;
> +
> +/* access brightness register */
> +void (*brightness_fn)(struct st7708_led *led);
> +
> +};
> +
> +
> +#endif /* __LEDS_7708_ST_H */
> diff --git a/patches/defconfig b/patches/defconfig
> index 4c7f16f..856c245 100644
> --- a/patches/defconfig
> +++ b/patches/defconfig

This is your local config.

And I don't see any modifications to drivers/leds/Kconfig
and drivers/leds/Makefile.

Did you build this driver?


> @@ -1,6 +1,6 @@
>  #
>  # Automatically generated file; DO NOT EDIT.
> -# Linux/arm 4.7.0 Kernel Configuration
> +# Linux/arm 4.7.6 Kernel Configuration
>  #
>  CONFIG_ARM=y
>  CONFIG_ARM_HAS_SG_CHAIN=y
> @@ -4693,6 +4693,7 @@ CONFIG_LEDS_PCA9532=m
>  CONFIG_LEDS_PCA9532_GPIO=y
>  CONFIG_LEDS_GPIO=m
>  CONFIG_LEDS_LP3944=m
> +CONFIG_LEDS_STLED7708=y
>  CONFIG_LEDS_LP55XX_COMMON=m
>  CONFIG_LEDS_LP5521=m
>  CONFIG_LEDS_LP5523=m
>


-- 
Best regards,
Jacek Anaszewski
