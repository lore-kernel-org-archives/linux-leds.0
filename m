From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] drivers: led: is31fl319x: 6/9-channel light effect led driver
Date: Thu, 21 Apr 2016 18:25:19 +0200
Message-ID: <D83BF9BE-985A-4044-8105-3E5664B54DF7@goldelico.com>
References: <cover.1461004995.git.hns@goldelico.com> <75127f4bf2bb11343bdff5bfb1129a092e668c61.1461004995.git.hns@goldelico.com> <20160421150100.GA28324@rob-hp-laptop>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.221]:40304 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752439AbcDUQZe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Apr 2016 12:25:34 -0400
In-Reply-To: <20160421150100.GA28324@rob-hp-laptop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org

Hi,

> Am 21.04.2016 um 17:01 schrieb Rob Herring <robh@kernel.org>:
> 
> On Mon, Apr 18, 2016 at 08:43:16PM +0200, H. Nikolaus Schaller wrote:
>> This is a driver for the Integrated Silicon Solution Inc. LED driver
>> chips IS31FL3196 and IS31FL3199. They can drive up to 6 or 9
>> LEDs.
>> 
>> Each LED is individually controllable in brightness (through pwm)
>> in 256 steps so that RGB LEDs can show any of ca. 16 Mio colors.
>> 
>> The maximum current of the LEDs can be programmed and limited to
>> 5 .. 40mA through a device tree property.
>> 
>> The chip is connected through I2C and can have one of 4 addresses (0x64 .. 0x67)
>> depending on how the AD pin is connected. The address is defined by the
>> reg property as usual.
>> 
>> The chip also has a shutdown input which could be connected to a GPIO,
>> but this driver uses software shutdown if all LEDs are inactivated.
>> 
>> The chip also has breathing and audio features which are not supported
>> by this driver.
>> 
>> This driver was developed and tested on OMAP5 based Pyra handheld prototype.
>> 
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> .../devicetree/bindings/leds/is31fl319x.txt        |  41 +++
>> drivers/leds/Kconfig                               |   8 +
>> drivers/leds/Makefile                              |   1 +
>> drivers/leds/leds-is31fl319x.c                     | 406 +++++++++++++++++++++
>> include/linux/leds-is31fl319x.h                    |  24 ++
>> 5 files changed, 480 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/leds/is31fl319x.txt
>> create mode 100644 drivers/leds/leds-is31fl319x.c
>> create mode 100644 include/linux/leds-is31fl319x.h
>> 
>> diff --git a/Documentation/devicetree/bindings/leds/is31fl319x.txt b/Documentation/devicetree/bindings/leds/is31fl319x.txt
>> new file mode 100644
>> index 0000000..d13c7ca
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/is31fl319x.txt
>> @@ -0,0 +1,41 @@
>> +LEDs connected to is31fl319x RGB LED controller chip
>> +
>> +Required properties:
>> +- compatible : should be : "issi,is31fl3196" or "issi,is31fl3199".
> 
> One per line please.
> 
>> +- #address-cells: must be 1
>> +- #size-cells: must be 0
>> +- reg: 0x64, 0x65, 0x66, 0x67.
>> +
>> +Optional properties:
>> +- max-current-ma:	maximum led current (5..40 mA, default 20 mA)
> 
> Use standard property led-max-microamp.
> 
>> +- audio-gain-db:	audio gain selection (0..21 dB. default 0 dB)
>> +- breathing & audio:	not implemented
>> +
>> +Each led is represented as a sub-node of the issi,is31fl319x device.
>> +
>> +LED sub-node properties:
>> +- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
>> +- reg : number of LED line (0 to 5 or 0 to 8 - not all need to be present)
>> +- linux,default-trigger : (optional)
>> +   see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Examples:
>> +
>> +fancy_leds: is31fl3196@65 {
>> +	compatible = "issi,is31fl319x";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	reg = <0x65>;
>> +
>> +	led0: red-aux@0 {
> 
> Use generic unit names:
> 
> red-aux: led@0
> 
>> +		label = "red:aux";
>> +		reg = <0>;
>> +	};
>> +
>> +	led1: green-power@4 {
> 
> ditto
> 
>> +		label = "green:power";
>> +		reg = <4>;
>> +		linux,default-trigger = "default-on";
>> +	};
>> +};
>> +

thanks! Will be included in upcoming V2.

BR,
Nikolaus
