From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Thu, 16 Nov 2017 09:45:23 -0600
Message-ID: <d3483e49-650d-1d68-bec6-eeb84d8ac48a@ti.com>
References: <20171115194203.13572-1-dmurphy@ti.com>
 <20171116154139.wed7qmpmv2ffyzv2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:37825 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933811AbdKPPp6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Nov 2017 10:45:58 -0500
In-Reply-To: <20171116154139.wed7qmpmv2ffyzv2@rob-hp-laptop>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Rob

Thanks for the review

On 11/16/2017 09:41 AM, Rob Herring wrote:
> On Wed, Nov 15, 2017 at 01:42:02PM -0600, Dan Murphy wrote:
>> This adds the devicetree bindings for the LM3692x
>> I2C LED string driver.
>>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v3 - No changes
>> v2 - No changes - https://patchwork.kernel.org/patch/10056677/
>>
>>  .../devicetree/bindings/leds/leds-lm3692x.txt      | 28 ++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>> new file mode 100644
>> index 000000000000..cfef67bd4100
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>> @@ -0,0 +1,28 @@
>> +* Texas Instruments - LM3692x Highly Efficient Dual-String White LED Driver
>> +
>> +The LM36922 is an ultra-compact, highly efficient,
>> +two string white-LED driver designed for LCD display
>> +backlighting.
>> +
>> +Required properties:
>> +	- compatible:
>> +		"ti,lm3692x"
> 
> Don't use wildcards in compatible strings.

Do you mean to remove the x?  How do we denote a family of parts then?

> 
>> +	- reg -  I2C slave address
>> +
>> +Optional properties:
>> +	- label - Used for naming LEDs
>> +	- enable-gpio - gpio pin to enable/disable the device.
> 
> enable-gpios is the preferred form.

ack

> 
>> +	- supply - "vled" - LED supply
> 
> vled-supply - ...
> 

ack

>> +
>> +Example:
>> +
>> +leds: leds@6 {
>> +	compatible = "ti,lm3692x";
>> +	reg = <0x36>;
>> +	label = "backlight_cluster";
>> +	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>> +	vled-supply = <&vbatt>;
>> +}
>> +
>> +For more product information please see the link below:
>> +http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
>> -- 
>> 2.15.0.124.g7668cbc60
>>


-- 
------------------
Dan Murphy
