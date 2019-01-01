From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Tue, 1 Jan 2019 15:45:46 +0200
Message-ID: <986b5105-2fdb-bd25-7c8a-ca8fd1ade821@gmail.com>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20181219162626.12297-3-dmurphy@ti.com> <20181219193455.GA21159@amd>
 <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com> <20181219201047.GA23448@amd>
 <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
 <cd90f179-6c16-823f-496f-27f141e9c322@ti.com>
 <a72c11c0-949b-bdbc-df2c-4490e04a1065@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a72c11c0-949b-bdbc-df2c-4490e04a1065@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi All,

On 20/12/2018 14.40, Vesa Jääskeläinen wrote:
> Idea was to define preset colors in device tree as an example when you 
> are dealing with multi-color LEDs without PWM. In that case you only 
> have GPIOs to control and then have a problem what does those GPIO's mean.
> 
> With preset definitions one can use color names to act as a shortcut to 
> configure GPIO's to proper state for that particular color.
> 
> For more flexible setups where you have PWM or such control you have 
> larger space of available colors. In this case you need to somehow 
> define also meaning of those controls.
> 
> Also we may not have LED with only red, green and blue elements. There 
> might in example be amber, ultraviolet, white elements.
> 
> This is where device tree is concerned. It helps us craft the logical 
> definition for LED so that we can control it from user space in common way.
> 
> Now the next problem then is how does user space work then.
> 
> For multi-color LEDs it it important to change the color atomically so 
> that no wrong colors are being shown as user space got interrupted when 
> controlling it.
> 
> Also we have brightness setting that would be useful for PWM controlled 
> LEDs.
> 
> Setting color is easy when you use preset names then you only need to 
> deal with brightness value (eg. RGB -> HSV * brightness -> RGB). Of 
> course here additional problem is other color elements are they then 
> scaled according to brightness value?.
> 
> Setting color as "raw" values is then next problem. In order to do it 
> atomically it needs to be one atomic activation and could be eg. one 
> write to "color" sysfs entry with combination of all color elements and 
> perhaps additionally also brightness value. Next question is then what 
> is the format for such entry then? What are the value ranges? In here we 
> can utilize device tree definition to help define what kind of LED we do 
> have and what kind of capabilities it does have.
> 
> Additional problem risen also in discussion was non-linearity of some 
> control mechanisms vs. perceived color. So there might be a need for 
> curve mapping similarly what is with backlight control and that would be 
> defined either in device tree and possibly in user space if there is a 
> need for that. I suppose golden curve definition in device tree should 
> be good enough.
> 
> Then there was additional discussion about possible animation support 
> but I would leave that for future design as that would then be utilizing 
> the same framework.
> 
> I suppose color space handling and that kind of stuff should be in some 
> led core functionality and then raw control should be part of physical 
> led driver.
> 
> I was planning to play with it during holiday season but lets see how it 
> goes. Feel free to also experiment with the idea.

I was playing with this and got some results with PWM LED driver. I 
would like to get feedback now even thou it is not yet ready for patch 
sending.

They still need more work but the idea can be seen here:
https://github.com/vesajaaskelainen/linux/tree/wip-multi-color-led

This branch is now based on Linux kernel 4.20 release.

Consider that branch as volatile as I will forcibly update it when there 
are updates.

 From there specifically in commits (while they last):

drivers: leds: Add core support for multi color element LEDs
https://github.com/vesajaaskelainen/linux/commit/55d553906d0a158591435bb6323a318462079d59

WIP: drivers: leds: leds-pwm: Add multi color element LED support.
https://github.com/vesajaaskelainen/linux/commit/efccef08cbf3b2e1e49b95b69ff81cd380519fe3

What is there now:

- led-core supports color elements
- led-class supports users space configuration
- both led-core and led-class are driver agnostic so they should be 
treated as generic code.
- leds-pwm: my testing code with PWM led.
- no HSV support for brightness as there could be multiple color 
elements out from traditional red-green-blue space or odd combinations 
of colors and they are a bit hard to map to HSV formula (and it needs 
fixed point math).
- no color presets that could be optionally be selected
- when I configure led trigger to heartbeat it actually blinks with 
color specified -- thou trigger gets zeroed out with one sets new color 
or brightness as that was previous functionality with brightness.
- some documentation added
- code should pass checkpatch

What I was planning to do next:

- cleanup PWM LED driver so that it works with and without 
LED_MULTI_COLOR_LED being defined.
- improve documentation
- try out how my other device behaves which have dual color element LED 
controlled with GPIO's and see how it would integrate to gpio-led driver.

I would like to get feedback on:
- Device tree idea
- Internal logic
- Should the trigger be really reseted when one changes value of 
brightness? I would think it should function like setting brightness 
entry from sysfs would set current brightness for trigger when it is 
lit. Setting color should change color and brightness and it should be 
active from there one until trigger is disabled from trigger sysfs node.

My testing device has RGB LED with all color elements controlled with 
individual PWM channels from TI's AM335x's integrated PWM controller.

In device tree I have following:

	multi-color-leds {
		compatible = "pwm-leds";

		status-led {
			label = "status";

			element-red {
				pwms = <&ehrpwm0 0 100000 0>;
			};
			element-green {
				pwms = <&ehrpwm1 0 100000 0>;
			};
			element-blue {
				pwms = <&ehrpwm1 1 100000 0>;
			};
		};
	};

For my second test device I was planning to replace "pwms" with "gpios" 
or such entries.

In user space one can use it like:

# --- start of snippet ---

hostname ~ # cd /sys/class/leds/
hostname leds # ls
status
hostname leds # cd status
hostname status # ls
brightness      color           device          max_brightness 
max_color       power           subsystem       trigger         uevent
hostname status # cat color
brightness=0 red=0 green=0 blue=0

# some notes about color value here.
# - red, green, and blue are directly coming from device tree
# definition. if one would add eg. element-white or element-uv entries
# then they would appear here as well.
# - brightness is hardcoded entry

hostname status # cat max_color
brightness=255 red=255 green=255 blue=255
hostname status # cat brightness
0
hostname status # cat max_brightness
255

# Set color and brightness to maximum values eg. "white"
hostname status # cat max_color > color

# Zero out red and green elements to make color blue
hostname status # echo "red=0 green=0" > color

# Configure individual color elements
hostname status # echo "red=55 green=22 blue=11" > color

# Start with max brightness and then dim it with each step
hostname status # echo 255 > brightness
hostname status # echo 128 > brightness
hostname status # echo 32 > brightness

# And finally with brightness=0 LED is OFF
hostname status # echo 0 > brightness

# --- end of snippet ---

About color presets...

I believe the optional color preset thing could work like:

	multi-color-leds {
		compatible = "pwm-leds";

		status-led {
			label = "status";

			element-red {
				pwms = <&ehrpwm0 0 100000 0>;
			};
			element-green {
				pwms = <&ehrpwm1 0 100000 0>;
			};
			element-blue {
				pwms = <&ehrpwm1 1 100000 0>;
			};

			color-orange = 255,128,0;
		};
	};

Then in user space:

hostname status # echo "orange" > color

or with combined brightness:

hostname status # echo "brightness=255 orange" > color

But then again -- I am a bit unsure here myself is it a good idea. I 
need to try out how the dual color element GPIO LED variant works first. 
My current hunch is that we might not need the color presets as one can 
now set all color elements in one go. It just changes a bit logic how it 
is used.

With dual color element LED with GPIO control it might as well be:

# for orange:
echo "brightness=255 red=255 green=128" > color
# or max value as GPIO led doesn't really care:
echo "brightness=255 red=255 green=255" > color

# for red:
echo "brightness=255 red=255 green=0" > color

# for green:
echo "brightness=255 red=0 green=255" > color

# for off:
echo "brightness=0" > color
# or
echo 0 > brightness

Thanks,
Vesa Jääskeläinen
